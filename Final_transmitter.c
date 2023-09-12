// EFM8_I2C_Nunchuck.c: Reads the WII nunchuck using the hardware I2C port
// available in the EFM8LB1 and sends them using the serial port.  The best
// information so far about the nunchuck is at:
//
// http://wiibrew.org/wiki/Wiimote/Extension_Controllers
// http://wiibrew.org/wiki/Wiimote/Extension_Controllers/Nunchuck
//
// Some good information was found also here:
//
// http://forum.arduino.cc/index.php/topic,45924.0.html
//
// By:  Jesus Calvino-Fraga (c) 2010-2018
//
// The next line clears the "C51 command line options:" field when compiling with CrossIDE
//  ~C51~  

#include <EFM8LB1.h>
#include <stdio.h>

#define  SYSCLK         72000000L // System clock frequency in Hz
#define  BAUDRATE       115200L
#define  SMB_FREQUENCY  100000L   // I2C SCL clock rate (10kHz to 100kHz)
#define  DEF_FREQ       15986L // 21315L
// #define  DEF_FREQ       21315L

#define  OUT0           P2_0
#define  OUT1           P2_1

#define  ON_TIME 		48 	// 1.5 ms
#define  MIN_OFF_TIME	32 	// 1 ms
#define  TIME_STEP		 8	// 0.25 ms


#define LCD_RS P3_0
// #define LCD_RW Px_x // Not used in this code.  Connect to GND
#define LCD_E  P2_6
#define LCD_D4 P2_5
#define LCD_D5 P2_4
#define LCD_D6 P2_3
#define LCD_D7 P2_2
#define CHARS_PER_LINE 16

#include <EFM8LB1.h>
//#include "globals.h"

// int sync_count = 0

volatile int off_period = 0;
volatile int on_count = 0;
volatile int off_count = 0;

char flags = 0;

#define FOLLOW_MODE (1<<0)
#define LIGHTS		(1<<1)

char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key
  
	VDM0CN=0x80;       // enable VDD monitor
	RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD

	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif
	
	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)	
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif

	#if ( ((SYSCLK/BAUDRATE)/(12L*2L)) > 0x100)
		#error Can not configure baudrate using timer 1 
	#endif
	// Configure Uart 0
	SCON0 = 0x10;
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(12L*2L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
	
	//Configure pins
	P2MDOUT|=0b_0000_0011;
	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0 = 0b_0000_0101; // Enable SMBus pins and UART pins P0.4(TX) and P0.5(RX)
	XBR1 = 0X00;
	XBR2 = 0x40; // Enable crossbar and weak pull-ups

	// Configure Timer 0 as the I2C clock source
	CKCON0 |= 0b_0000_0100; // Timer0 clock source = SYSCLK
	TMOD &= 0xf0;  // Mask out timer 1 bits
	TMOD |= 0x02;  // Timer0 in 8-bit auto-reload mode
	// Timer 0 configured to overflow at 1/3 the rate defined by SMB_FREQUENCY
	TL0 = TH0 = 256-(SYSCLK/SMB_FREQUENCY/3);
	TR0 = 1; // Enable timer 0
	
	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000;
	TMR2RL=(0x10000L-(SYSCLK/(2*DEF_FREQ))); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2
	EA=1; // Global interrupt enable
	
	// Configure and enable SMBus
	SMB0CF = 0b_0101_1100; //INH | EXTHOLD | SMBTOE | SMBFTE ;
	SMB0CF |= 0b_1000_0000;  // Enable SMBus

	return 0;
}

// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

// Uses Timer4 to delay <ms> mili-seconds. 
void Timer4ms(unsigned char ms)
{
	unsigned char i;// usec counter
	unsigned char k;
	
	k=SFRPAGE;
	SFRPAGE=0x10;
	// The input for Timer 4 is selected as SYSCLK by setting bit 0 of CKCON1:
	CKCON1|=0b_0000_0001;
	
	TMR4RL = 65536-(SYSCLK/1000L); // Set Timer4 to overflow in 1 ms.
	TMR4 = TMR4RL;                 // Initialize Timer4 for first overflow
	
	TF4H=0; // Clear overflow flag
	TR4=1;  // Start Timer4
	for (i = 0; i < ms; i++)       // Count <ms> overflows
	{
		while (!TF4H);  // Wait for overflow
		TF4H=0;         // Clear overflow indicator
	}
	TR4=0; // Stop Timer4
	SFRPAGE=k;	
}

void WaitXms (unsigned int ms)
{
	unsigned int j;
	for(j=ms; j!=0; j--)
	{
		Timer3us(249);
		Timer3us(249);
		Timer3us(249);
		Timer3us(250);
	}
}

void I2C_write (unsigned char output_data)
{
	SMB0DAT = output_data; // Put data into buffer
	SI = 0;
	while (!SI); // Wait until done with send
}

unsigned char I2C_read (void)
{
	unsigned char input_data;

	SI = 0;
	while (!SI); // Wait until we have data to read
	input_data = SMB0DAT; // Read the data

	return input_data;
}

void I2C_start (void)
{
	ACK = 1;
	STA = 1;     // Send I2C start
	STO = 0;
	SI = 0;
	while (!SI); // Wait until start sent
	STA = 0;     // Reset I2C start
}

void I2C_stop(void)
{
	STO = 1;  	// Perform I2C stop
	SI = 0;	// Clear SI
	//while (!SI);	   // Wait until stop complete (Doesn't work???)
}

void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
{

	TF2H = 0; // Clear Timer2 interrupt flag
	if (on_count != 0) {
        OUT0=!OUT0;
        OUT1=!OUT0;
        on_count--;
		P1_7 = 1;
    } else if (off_count != 0) {
        off_count--;
		P1_7 = 0;
    } else {
        on_count = ON_TIME;
        off_count = off_period;
    }
}

void nunchuck_init(bit print_extension_type)
{
	unsigned char i, buf[6];
	
	// Newer initialization format that works for all nunchucks
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xF0);
	I2C_write(0x55);
	I2C_stop();
	Timer4ms(1);
	 
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xFB);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);

	// Read the extension type from the register block.  For the original Nunchuk it should be
	// 00 00 a4 20 00 00.
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xFA); // extension type register
	I2C_stop();
	Timer4ms(3); // 3 ms required to complete acquisition

	I2C_start();
	I2C_write(0xA5);
	
	// Receive values
	for(i=0; i<6; i++)
	{
		buf[i]=I2C_read();
	}
	ACK=0;
	I2C_stop();
	Timer4ms(3);
	
	if(print_extension_type)
	{
		printf("Extension type: %02x  %02x  %02x  %02x  %02x  %02x\n", 
			buf[0],  buf[1], buf[2], buf[3], buf[4], buf[5]);
	}

	// Send the crypto key (zeros), in 3 blocks of 6, 6 & 4.

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xF0);
	I2C_write(0xAA);
	I2C_stop();
	Timer4ms(1);

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);
}

void nunchuck_getdata(unsigned char * s)
{
	unsigned char i;

	// Start measurement
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(3); 	// 3 ms required to complete acquisition

	// Request values
	I2C_start();
	I2C_write(0xA5);
	
	// Receive values
	for(i=0; i<6; i++)
	{
		s[i]=(I2C_read()^0x17)+0x17; // Read and decrypt
	}
	ACK=0;
	I2C_stop();
}

void LCD_pulse (void)
{
	LCD_E=1;
	Timer4ms(40);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the C8051Fxxx is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	Timer4ms(40);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	Timer4ms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	Timer4ms(5);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	// LCD_RW=0; // We are only writing to the LCD in this program
	Timer4ms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	Timer4ms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	Timer4ms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

void main (void)
{
	unsigned char rbuf[6];
 	int joy_x, joy_y, off_x, off_y, acc_x, acc_y, acc_z;
 	bit but1, but2;
	char buff[17];
	int new_off_period;
	char c;

	Timer4ms(200);
	nunchuck_init(1);
	Timer4ms(200);
	LCD_4BIT();

	LCDprint("D  R  <=  =>", 1, 1);
	
	nunchuck_getdata(rbuf);

	off_x=(int)rbuf[0]-128;
	off_y=(int)rbuf[1]-128;
	
	Timer4ms(1000); // Give PuTTY a chance to start before sending text
	
	printf("\x1b[2J\x1b[1;1H"); // Clear screen using ANSI escape sequence.
	printf ("PIC32MX130 I2C WII Nunchuck test program\r\n"
	        "File: %s\r\n"
	        "Compiled: %s, %s\r\n\r\n",
	        __FILE__, __DATE__, __TIME__);

	while(1) {
		nunchuck_getdata(rbuf);
		
		joy_x=(int)rbuf[0]-128-off_x;
		joy_y=(int)rbuf[1]-128-off_y;
		acc_x=rbuf[2]*4; 
		acc_y=rbuf[3]*4;
		acc_z=rbuf[4]*4;

		but1=(rbuf[5] & 0x01)?1:0;
		but2=(rbuf[5] & 0x02)?1:0;
		if (rbuf[5] & 0x04) acc_x+=2;
		if (rbuf[5] & 0x08) acc_x+=1;
		if (rbuf[5] & 0x10) acc_y+=2;
		if (rbuf[5] & 0x20) acc_y+=1;
		if (rbuf[5] & 0x40) acc_z+=2;
		if (rbuf[5] & 0x80) acc_z+=1;
		
		c = '\0';
		printf("\nControl:\r");
		if (RI){
		c = getchar();
		}
		printf("\ncontrol is: %c\r",c);
		
		
		if (!but1) { flags |= FOLLOW_MODE;}
		else { flags &= ~FOLLOW_MODE;}
		if (!but2) { flags |= LIGHTS;}
		else { flags &= ~LIGHTS;}
		
		if (flags&FOLLOW_MODE) {	//  tracking
			//		  1234567890123456
			LCDprint(" tracking  mode ", 2, 1);
			new_off_period = MIN_OFF_TIME + 1 * TIME_STEP;
		}
		else if (flags&LIGHTS) {	//  tracking
			//		  1234567890123456
			LCDprint("                ", 2, 1);
			new_off_period = MIN_OFF_TIME + 11 * TIME_STEP;
		}
		else if (joy_x >= 50 && (joy_y * 2 < joy_x && -joy_y * 2 < joy_x) || c == 'd') { // right
			LCDprint("          ^     ", 2, 1);
			new_off_period = MIN_OFF_TIME + 2 * TIME_STEP;
		}
		else if (joy_y >= 50 && (joy_x * 2 < joy_y && -joy_x * 2 < joy_y) || c == 'w') { // forward
			LCDprint("^               ", 2, 1);
			new_off_period = MIN_OFF_TIME + 3 * TIME_STEP;
		}
		else if (joy_x <= -50 && (joy_y * 2 < -joy_x && -joy_y * 2 < -joy_x) || c == 'a') { // left
			LCDprint("      ^         ", 2, 1);\
			new_off_period = MIN_OFF_TIME + 4 * TIME_STEP;
		}
		else if (joy_y <= -50 && (joy_x * 2 < -joy_y && -joy_x * 2 < -joy_y) || c == 's') { // back
			LCDprint("   ^            ", 2, 5);
			new_off_period = MIN_OFF_TIME + 5 * TIME_STEP;
		}
		else if (joy_x > -50 && joy_x < 50 && joy_y > -50 && joy_y < 50) {	// stop
			LCDprint("                ", 2, 1);
			new_off_period = MIN_OFF_TIME + 6 * TIME_STEP;
		} 
		else if (joy_x > 0 && joy_y > 0) {	// forward right
			LCDprint("^         ^     ", 2, 1);
			new_off_period = MIN_OFF_TIME + 7 * TIME_STEP;
		}
		else if (joy_x < 0 && joy_y > 0) {	// forward left
			LCDprint("      ^   ^     ", 2, 1);
			new_off_period = MIN_OFF_TIME + 8 * TIME_STEP;
		}
		else if (joy_x > 0 && joy_y < 0) {	// back right
			LCDprint("   ^      ^     ", 2, 1);
			new_off_period = MIN_OFF_TIME + 9 * TIME_STEP;
		}
		else if (joy_x < 0 && joy_y < 0) {	// back left
			LCDprint("   ^  ^         ", 2, 1);
			new_off_period = MIN_OFF_TIME + 10 * TIME_STEP;
		}
		else {
		 	LCDprint("                ", 2, 1);
			new_off_period = MIN_OFF_TIME + 0 * TIME_STEP;
		}
		off_period = new_off_period;		

		/*printf("Buttons(wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwZ:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d) Period(%d, %d) follow(%c) \x1b[0J\r\n",
			   but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z, ON_TIME, new_off_period, (flags&FOLLOW_MODE)?'1':'0');*/
		
		Timer4ms(100);
		
   }
}