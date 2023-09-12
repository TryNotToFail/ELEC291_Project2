;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Wed Apr 12 13:10:57 2023
;--------------------------------------------------------
$name Final_transmitter
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _nunchuck_getdata
	public _nunchuck_init
	public _Timer2_ISR
	public _I2C_stop
	public _I2C_start
	public _I2C_read
	public _I2C_write
	public _WaitXms
	public _Timer4ms
	public _Timer3us
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _nunchuck_init_PARM_1
	public _LCDprint_PARM_2
	public _flags
	public _off_count
	public _on_count
	public _off_period
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_off_period:
	ds 2
_on_count:
	ds 2
_off_count:
	ds 2
_flags:
	ds 1
_nunchuck_init_buf_1_48:
	ds 6
_nunchuck_init_sloc0_1_0:
	ds 2
_nunchuck_init_sloc1_1_0:
	ds 2
_nunchuck_init_sloc2_1_0:
	ds 2
_LCDprint_PARM_2:
	ds 1
_main_rbuf_1_67:
	ds 6
_main_joy_x_1_67:
	ds 2
_main_joy_y_1_67:
	ds 2
_main_off_x_1_67:
	ds 2
_main_off_y_1_67:
	ds 2
_main_buff_1_67:
	ds 17
_main_c_1_67:
	ds 1
_main_sloc0_1_0:
	ds 2
_main_sloc1_1_0:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_nunchuck_init_PARM_1:
	DBIT	1
_LCDprint_PARM_3:
	DBIT	1
_main_but1_1_67:
	DBIT	1
_main_but2_1_67:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:48: volatile int off_period = 0;
	clr	a
	mov	_off_period,a
	mov	(_off_period + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:49: volatile int on_count = 0;
	clr	a
	mov	_on_count,a
	mov	(_on_count + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:50: volatile int off_count = 0;
	clr	a
	mov	_off_count,a
	mov	(_off_count + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:52: char flags = 0;
	mov	_flags,#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:57: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:60: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:61: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:62: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:64: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:65: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:72: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:73: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:74: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:95: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:96: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:97: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:98: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:99: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:100: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:109: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:110: TH1 = 0x100-((SYSCLK/BAUDRATE)/(12L*2L));
	mov	_TH1,#0xE6
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:111: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:112: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:113: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:114: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:115: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:118: P2MDOUT|=0b_0000_0011;
	orl	_P2MDOUT,#0x03
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:119: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:120: XBR0 = 0b_0000_0101; // Enable SMBus pins and UART pins P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x05
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:121: XBR1 = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:122: XBR2 = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:125: CKCON0 |= 0b_0000_0100; // Timer0 clock source = SYSCLK
	orl	_CKCON0,#0x04
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:126: TMOD &= 0xf0;  // Mask out timer 1 bits
	anl	_TMOD,#0xF0
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:127: TMOD |= 0x02;  // Timer0 in 8-bit auto-reload mode
	orl	_TMOD,#0x02
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:129: TL0 = TH0 = 256-(SYSCLK/SMB_FREQUENCY/3);
	mov	_TH0,#0x10
	mov	_TL0,#0x10
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:130: TR0 = 1; // Enable timer 0
	setb	_TR0
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:133: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:134: CKCON0|=0b_0001_0000;
	orl	_CKCON0,#0x10
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:135: TMR2RL=(0x10000L-(SYSCLK/(2*DEF_FREQ))); // Initialize reload value
	mov	_TMR2RL,#0x35
	mov	(_TMR2RL >> 8),#0xF7
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:136: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:137: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:138: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:139: EA=1; // Global interrupt enable
	setb	_EA
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:142: SMB0CF = 0b_0101_1100; //INH | EXTHOLD | SMBTOE | SMBFTE ;
	mov	_SMB0CF,#0x5C
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:143: SMB0CF |= 0b_1000_0000;  // Enable SMBus
	orl	_SMB0CF,#0x80
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:145: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:149: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:154: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:156: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:157: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:159: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:160: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L003004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L003007?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:162: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L003001?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:163: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:160: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L003004?
L003007?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:165: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer4ms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 
;i                         Allocated to registers r4 
;k                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:169: void Timer4ms(unsigned char ms)
;	-----------------------------------------
;	 function Timer4ms
;	-----------------------------------------
_Timer4ms:
	mov	r2,dpl
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:174: k=SFRPAGE;
	mov	r3,_SFRPAGE
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:175: SFRPAGE=0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:177: CKCON1|=0b_0000_0001;
	orl	_CKCON1,#0x01
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:179: TMR4RL = 65536-(SYSCLK/1000L); // Set Timer4 to overflow in 1 ms.
	mov	_TMR4RL,#0xC0
	mov	(_TMR4RL >> 8),#0xE6
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:180: TMR4 = TMR4RL;                 // Initialize Timer4 for first overflow
	mov	_TMR4,_TMR4RL
	mov	(_TMR4 >> 8),(_TMR4RL >> 8)
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:182: TF4H=0; // Clear overflow flag
	clr	_TF4H
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:183: TR4=1;  // Start Timer4
	setb	_TR4
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:184: for (i = 0; i < ms; i++)       // Count <ms> overflows
	mov	r4,#0x00
L004004?:
	clr	c
	mov	a,r4
	subb	a,r2
	jnc	L004007?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:186: while (!TF4H);  // Wait for overflow
L004001?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:187: TF4H=0;         // Clear overflow indicator
	jbc	_TF4H,L004015?
	sjmp	L004001?
L004015?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:184: for (i = 0; i < ms; i++)       // Count <ms> overflows
	inc	r4
	sjmp	L004004?
L004007?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:189: TR4=0; // Stop Timer4
	clr	_TR4
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:190: SFRPAGE=k;	
	mov	_SFRPAGE,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'WaitXms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:193: void WaitXms (unsigned int ms)
;	-----------------------------------------
;	 function WaitXms
;	-----------------------------------------
_WaitXms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:196: for(j=ms; j!=0; j--)
L005001?:
	cjne	r2,#0x00,L005010?
	cjne	r3,#0x00,L005010?
	ret
L005010?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:198: Timer3us(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	lcall	_Timer3us
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:199: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:200: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:201: Timer3us(250);
	mov	dpl,#0xFA
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:196: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L005011?
	dec	r3
L005011?:
	sjmp	L005001?
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_write'
;------------------------------------------------------------
;output_data               Allocated to registers 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:205: void I2C_write (unsigned char output_data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
	mov	_SMB0DAT,dpl
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:208: SI = 0;
	clr	_SI
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:209: while (!SI); // Wait until done with send
L006001?:
	jnb	_SI,L006001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_read'
;------------------------------------------------------------
;input_data                Allocated to registers 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:212: unsigned char I2C_read (void)
;	-----------------------------------------
;	 function I2C_read
;	-----------------------------------------
_I2C_read:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:216: SI = 0;
	clr	_SI
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:217: while (!SI); // Wait until we have data to read
L007001?:
	jnb	_SI,L007001?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:218: input_data = SMB0DAT; // Read the data
	mov	dpl,_SMB0DAT
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:220: return input_data;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_start'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:223: void I2C_start (void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:225: ACK = 1;
	setb	_ACK
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:226: STA = 1;     // Send I2C start
	setb	_STA
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:227: STO = 0;
	clr	_STO
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:228: SI = 0;
	clr	_SI
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:229: while (!SI); // Wait until start sent
L008001?:
	jnb	_SI,L008001?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:230: STA = 0;     // Reset I2C start
	clr	_STA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_stop'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:233: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:235: STO = 1;  	// Perform I2C stop
	setb	_STO
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:236: SI = 0;	// Clear SI
	clr	_SI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:240: void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:243: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:244: if (on_count != 0) {
	mov	a,_on_count
	orl	a,(_on_count + 1)
	jz	L010005?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:245: OUT0=!OUT0;
	cpl	_P2_0
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:246: OUT1=!OUT0;
	mov	c,_P2_0
	cpl	c
	mov	_P2_1,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:247: on_count--;
	dec	_on_count
	mov	a,#0xff
	cjne	a,_on_count,L010012?
	dec	(_on_count + 1)
L010012?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:248: P1_7 = 1;
	setb	_P1_7
	sjmp	L010007?
L010005?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:249: } else if (off_count != 0) {
	mov	a,_off_count
	orl	a,(_off_count + 1)
	jz	L010002?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:250: off_count--;
	dec	_off_count
	mov	a,#0xff
	cjne	a,_off_count,L010014?
	dec	(_off_count + 1)
L010014?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:251: P1_7 = 0;
	clr	_P1_7
	sjmp	L010007?
L010002?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:253: on_count = ON_TIME;
	mov	_on_count,#0x30
	clr	a
	mov	(_on_count + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:254: off_count = off_period;
	mov	_off_count,_off_period
	mov	(_off_count + 1),(_off_period + 1)
L010007?:
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'nunchuck_init'
;------------------------------------------------------------
;i                         Allocated to registers r2 
;buf                       Allocated with name '_nunchuck_init_buf_1_48'
;sloc0                     Allocated with name '_nunchuck_init_sloc0_1_0'
;sloc1                     Allocated with name '_nunchuck_init_sloc1_1_0'
;sloc2                     Allocated with name '_nunchuck_init_sloc2_1_0'
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:258: void nunchuck_init(bit print_extension_type)
;	-----------------------------------------
;	 function nunchuck_init
;	-----------------------------------------
_nunchuck_init:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:263: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:264: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:265: I2C_write(0xF0);
	mov	dpl,#0xF0
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:266: I2C_write(0x55);
	mov	dpl,#0x55
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:267: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:268: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:270: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:271: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:272: I2C_write(0xFB);
	mov	dpl,#0xFB
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:273: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:274: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:275: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:279: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:280: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:281: I2C_write(0xFA); // extension type register
	mov	dpl,#0xFA
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:282: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:283: Timer4ms(3); // 3 ms required to complete acquisition
	mov	dpl,#0x03
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:285: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:286: I2C_write(0xA5);
	mov	dpl,#0xA5
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:289: for(i=0; i<6; i++)
	mov	r2,#0x00
L011003?:
	cjne	r2,#0x06,L011013?
L011013?:
	jnc	L011006?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:291: buf[i]=I2C_read();
	mov	a,r2
	add	a,#_nunchuck_init_buf_1_48
	mov	r0,a
	push	ar2
	push	ar0
	lcall	_I2C_read
	mov	a,dpl
	pop	ar0
	pop	ar2
	mov	@r0,a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:289: for(i=0; i<6; i++)
	inc	r2
	sjmp	L011003?
L011006?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:293: ACK=0;
	clr	_ACK
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:294: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:295: Timer4ms(3);
	mov	dpl,#0x03
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:297: if(print_extension_type)
	jnb	_nunchuck_init_PARM_1,L011002?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:300: buf[0],  buf[1], buf[2], buf[3], buf[4], buf[5]);
	mov	r2,(_nunchuck_init_buf_1_48 + 0x0005)
	mov	r3,#0x00
	mov	r4,(_nunchuck_init_buf_1_48 + 0x0004)
	mov	r5,#0x00
	mov	_nunchuck_init_sloc0_1_0,(_nunchuck_init_buf_1_48 + 0x0003)
	mov	(_nunchuck_init_sloc0_1_0 + 1),#0x00
	mov	_nunchuck_init_sloc1_1_0,(_nunchuck_init_buf_1_48 + 0x0002)
	mov	(_nunchuck_init_sloc1_1_0 + 1),#0x00
	mov	_nunchuck_init_sloc2_1_0,(_nunchuck_init_buf_1_48 + 0x0001)
	mov	(_nunchuck_init_sloc2_1_0 + 1),#0x00
	mov	r6,_nunchuck_init_buf_1_48
	mov	r7,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:299: printf("Extension type: %02x  %02x  %02x  %02x  %02x  %02x\n", 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_nunchuck_init_sloc0_1_0
	push	(_nunchuck_init_sloc0_1_0 + 1)
	push	_nunchuck_init_sloc1_1_0
	push	(_nunchuck_init_sloc1_1_0 + 1)
	push	_nunchuck_init_sloc2_1_0
	push	(_nunchuck_init_sloc2_1_0 + 1)
	push	ar6
	push	ar7
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
L011002?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:305: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:306: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:307: I2C_write(0xF0);
	mov	dpl,#0xF0
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:308: I2C_write(0xAA);
	mov	dpl,#0xAA
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:309: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:310: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:312: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:313: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:314: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:315: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:316: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:317: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:318: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:319: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:320: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:321: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:322: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:324: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:325: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:326: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:327: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:328: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:329: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:330: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:331: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:332: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:333: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:334: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:336: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:337: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:338: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:339: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:340: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:341: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:342: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:343: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:344: Timer4ms(1);
	mov	dpl,#0x01
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'nunchuck_getdata'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;i                         Allocated to registers r5 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:347: void nunchuck_getdata(unsigned char * s)
;	-----------------------------------------
;	 function nunchuck_getdata
;	-----------------------------------------
_nunchuck_getdata:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:352: I2C_start();
	push	ar2
	push	ar3
	push	ar4
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:353: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:354: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:355: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:356: Timer4ms(3); 	// 3 ms required to complete acquisition
	mov	dpl,#0x03
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:359: I2C_start();
	lcall	_I2C_start
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:360: I2C_write(0xA5);
	mov	dpl,#0xA5
	lcall	_I2C_write
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:363: for(i=0; i<6; i++)
	mov	r5,#0x00
L012001?:
	cjne	r5,#0x06,L012010?
L012010?:
	jnc	L012004?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:365: s[i]=(I2C_read()^0x17)+0x17; // Read and decrypt
	mov	a,r5
	add	a,r2
	mov	r6,a
	clr	a
	addc	a,r3
	mov	r7,a
	mov	ar0,r4
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	_I2C_read
	mov	a,dpl
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	xrl	a,#0x17
	add	a,#0x17
	mov	r1,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	lcall	__gptrput
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:363: for(i=0; i<6; i++)
	inc	r5
	sjmp	L012001?
L012004?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:367: ACK=0;
	clr	_ACK
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:368: I2C_stop();
	ljmp	_I2C_stop
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:371: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:373: LCD_E=1;
	setb	_P2_6
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:374: Timer4ms(40);
	mov	dpl,#0x28
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:375: LCD_E=0;
	clr	_P2_6
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:378: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:381: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:382: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P2_2,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:383: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P2_3,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:384: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P2_4,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:385: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_5,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:386: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:387: Timer4ms(40);
	mov	dpl,#0x28
	lcall	_Timer4ms
	pop	ar2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:388: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:389: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P2_2,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:390: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P2_3,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:391: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P2_4,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:392: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P2_5,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:393: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:396: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:398: LCD_RS=1;
	setb	_P3_0
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:399: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:400: Timer4ms(2);
	mov	dpl,#0x02
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:403: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:405: LCD_RS=0;
	clr	_P3_0
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:406: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:407: Timer4ms(5);
	mov	dpl,#0x05
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:410: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:412: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_6
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:414: Timer4ms(20);
	mov	dpl,#0x14
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:416: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:417: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:418: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:421: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:422: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:423: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:424: Timer4ms(20); // Wait for clear screen command to finsih.
	mov	dpl,#0x14
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:427: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:431: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L018013?
	mov	r5,#0xC0
	sjmp	L018014?
L018013?:
	mov	r5,#0x80
L018014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:432: Timer4ms(5);
	mov	dpl,#0x05
	lcall	_Timer4ms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:433: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L018003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L018006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L018003?
	inc	r6
	sjmp	L018003?
L018006?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:434: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L018011?
	mov	ar2,r5
	mov	ar3,r6
L018007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L018011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L018007?
	inc	r3
	sjmp	L018007?
L018011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;rbuf                      Allocated with name '_main_rbuf_1_67'
;joy_x                     Allocated with name '_main_joy_x_1_67'
;joy_y                     Allocated with name '_main_joy_y_1_67'
;off_x                     Allocated with name '_main_off_x_1_67'
;off_y                     Allocated with name '_main_off_y_1_67'
;acc_x                     Allocated to registers 
;acc_y                     Allocated to registers 
;acc_z                     Allocated to registers 
;buff                      Allocated with name '_main_buff_1_67'
;new_off_period            Allocated to registers r2 r3 
;c                         Allocated with name '_main_c_1_67'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;------------------------------------------------------------
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:437: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:446: Timer4ms(200);
	mov	dpl,#0xC8
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:447: nunchuck_init(1);
	setb	_nunchuck_init_PARM_1
	lcall	_nunchuck_init
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:448: Timer4ms(200);
	mov	dpl,#0xC8
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:449: LCD_4BIT();
	lcall	_LCD_4BIT
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:451: LCDprint("D  R  <=  =>", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_1
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:453: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_67
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:455: off_x=(int)rbuf[0]-128;
	mov	r2,_main_rbuf_1_67
	mov	r3,#0x00
	mov	a,r2
	add	a,#0x80
	mov	_main_off_x_1_67,a
	mov	a,r3
	addc	a,#0xff
	mov	(_main_off_x_1_67 + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:456: off_y=(int)rbuf[1]-128;
	mov	r4,(_main_rbuf_1_67 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	_main_off_y_1_67,a
	mov	a,r5
	addc	a,#0xff
	mov	(_main_off_y_1_67 + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:458: Timer4ms(1000); // Give PuTTY a chance to start before sending text
	mov	dpl,#0xE8
	lcall	_Timer4ms
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:460: printf("\x1b[2J\x1b[1;1H"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:464: __FILE__, __DATE__, __TIME__);
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:463: "Compiled: %s, %s\r\n\r\n",
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:466: while(1) {
L019074?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:467: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_67
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:469: joy_x=(int)rbuf[0]-128-off_x;
	mov	r6,_main_rbuf_1_67
	mov	r7,#0x00
	mov	a,r6
	add	a,#0x80
	mov	r6,a
	mov	a,r7
	addc	a,#0xff
	mov	r7,a
	mov	a,r6
	clr	c
	subb	a,_main_off_x_1_67
	mov	_main_joy_x_1_67,a
	mov	a,r7
	subb	a,(_main_off_x_1_67 + 1)
	mov	(_main_joy_x_1_67 + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:470: joy_y=(int)rbuf[1]-128-off_y;
	mov	r4,(_main_rbuf_1_67 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_y_1_67
	mov	_main_joy_y_1_67,a
	mov	a,r5
	subb	a,(_main_off_y_1_67 + 1)
	mov	(_main_joy_y_1_67 + 1),a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:475: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_67 + 0x0005)
	rrc	a
	mov	_main_but1_1_67,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:476: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_67 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_67,c
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:484: c = '\0';
	mov	_main_c_1_67,#0x00
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:485: printf("\nControl:\r");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:486: if (RI){
	jnb	_RI,L019014?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:487: c = getchar();
	lcall	_getchar
	mov	_main_c_1_67,dpl
L019014?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:489: printf("\ncontrol is: %c\r",c);
	mov	a,_main_c_1_67
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r2,a
	push	ar3
	push	ar2
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:492: if (!but1) { flags |= FOLLOW_MODE;}
	jb	_main_but1_1_67,L019016?
	orl	_flags,#0x01
	sjmp	L019017?
L019016?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:493: else { flags &= ~FOLLOW_MODE;}
	anl	_flags,#0xFE
L019017?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:494: if (!but2) { flags |= LIGHTS;}
	jb	_main_but2_1_67,L019019?
	orl	_flags,#0x02
	sjmp	L019020?
L019019?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:495: else { flags &= ~LIGHTS;}
	anl	_flags,#0xFD
L019020?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:497: if (flags&FOLLOW_MODE) {	//  tracking
	mov	a,_flags
	jnb	acc.0,L019071?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:499: LCDprint(" tracking  mode ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_9
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:500: new_off_period = MIN_OFF_TIME + 1 * TIME_STEP;
	mov	r2,#0x28
	mov	r3,#0x00
	ljmp	L019072?
L019071?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:502: else if (flags&LIGHTS) {	//  tracking
	mov	a,_flags
	jnb	acc.1,L019068?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:504: LCDprint("                ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_10
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:505: new_off_period = MIN_OFF_TIME + 11 * TIME_STEP;
	mov	r2,#0x78
	mov	r3,#0x00
	ljmp	L019072?
L019068?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:507: else if (joy_x >= 50 && (joy_y * 2 < joy_x && -joy_y * 2 < joy_x) || c == 'd') { // right
	clr	c
	mov	a,_main_joy_x_1_67
	subb	a,#0x32
	mov	a,(_main_joy_x_1_67 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	clr	a
	rlc	a
	mov	r6,a
	jnz	L019066?
	mov	a,_main_joy_y_1_67
	add	a,_main_joy_y_1_67
	mov	r7,a
	mov	a,(_main_joy_y_1_67 + 1)
	rlc	a
	mov	r4,a
	clr	c
	mov	a,r7
	subb	a,_main_joy_x_1_67
	mov	a,r4
	xrl	a,#0x80
	mov	b,(_main_joy_x_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L019066?
	clr	c
	clr	a
	subb	a,_main_joy_y_1_67
	mov	r4,a
	clr	a
	subb	a,(_main_joy_y_1_67 + 1)
	xch	a,r4
	add	a,acc
	xch	a,r4
	rlc	a
	mov	r5,a
	clr	c
	mov	a,r4
	subb	a,_main_joy_x_1_67
	mov	a,r5
	xrl	a,#0x80
	mov	b,(_main_joy_x_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L019061?
L019066?:
	mov	a,#0x64
	cjne	a,_main_c_1_67,L019062?
L019061?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:508: LCDprint("          ^     ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_11
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:509: new_off_period = MIN_OFF_TIME + 2 * TIME_STEP;
	mov	r2,#0x30
	mov	r3,#0x00
	ljmp	L019072?
L019062?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:511: else if (joy_y >= 50 && (joy_x * 2 < joy_y && -joy_x * 2 < joy_y) || c == 'w') { // forward
	clr	c
	mov	a,_main_joy_y_1_67
	subb	a,#0x32
	mov	a,(_main_joy_y_1_67 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	clr	a
	rlc	a
	mov	r4,a
	jnz	L019060?
	mov	a,_main_joy_x_1_67
	add	a,_main_joy_x_1_67
	mov	r5,a
	mov	a,(_main_joy_x_1_67 + 1)
	rlc	a
	mov	r7,a
	clr	c
	mov	a,r5
	subb	a,_main_joy_y_1_67
	mov	a,r7
	xrl	a,#0x80
	mov	b,(_main_joy_y_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L019060?
	clr	c
	clr	a
	subb	a,_main_joy_x_1_67
	mov	r5,a
	clr	a
	subb	a,(_main_joy_x_1_67 + 1)
	xch	a,r5
	add	a,acc
	xch	a,r5
	rlc	a
	mov	r7,a
	clr	c
	mov	a,r5
	subb	a,_main_joy_y_1_67
	mov	a,r7
	xrl	a,#0x80
	mov	b,(_main_joy_y_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L019055?
L019060?:
	mov	a,#0x77
	cjne	a,_main_c_1_67,L019056?
L019055?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:512: LCDprint("^               ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_12
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:513: new_off_period = MIN_OFF_TIME + 3 * TIME_STEP;
	mov	r2,#0x38
	mov	r3,#0x00
	ljmp	L019072?
L019056?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:515: else if (joy_x <= -50 && (joy_y * 2 < -joy_x && -joy_y * 2 < -joy_x) || c == 'a') { // left
	clr	c
	mov	a,#0xCE
	subb	a,_main_joy_x_1_67
	mov	a,#(0xFF ^ 0x80)
	mov	b,(_main_joy_x_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	clr	a
	rlc	a
	mov	_main_sloc1_1_0,a
	jnz	L019054?
	mov	a,_main_joy_y_1_67
	add	a,_main_joy_y_1_67
	mov	r7,a
	mov	a,(_main_joy_y_1_67 + 1)
	rlc	a
	mov	r5,a
	clr	c
	clr	a
	subb	a,_main_joy_x_1_67
	mov	_main_sloc0_1_0,a
	clr	a
	subb	a,(_main_joy_x_1_67 + 1)
	mov	(_main_sloc0_1_0 + 1),a
	clr	c
	mov	a,r7
	subb	a,_main_sloc0_1_0
	mov	a,r5
	xrl	a,#0x80
	mov	b,(_main_sloc0_1_0 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L019054?
	clr	c
	clr	a
	subb	a,_main_joy_y_1_67
	mov	r7,a
	clr	a
	subb	a,(_main_joy_y_1_67 + 1)
	xch	a,r7
	add	a,acc
	xch	a,r7
	rlc	a
	mov	r5,a
	clr	c
	mov	a,r7
	subb	a,_main_sloc0_1_0
	mov	a,r5
	xrl	a,#0x80
	mov	b,(_main_sloc0_1_0 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L019049?
L019054?:
	mov	a,#0x61
	cjne	a,_main_c_1_67,L019050?
L019049?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:516: LCDprint("      ^         ", 2, 1);\
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_13
	mov	b,#0x80
	lcall	_LCDprint
	mov	r2,#0x40
	mov	r3,#0x00
	ljmp	L019072?
L019050?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:519: else if (joy_y <= -50 && (joy_x * 2 < -joy_y && -joy_x * 2 < -joy_y) || c == 's') { // back
	clr	c
	mov	a,#0xCE
	subb	a,_main_joy_y_1_67
	mov	a,#(0xFF ^ 0x80)
	mov	b,(_main_joy_y_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	clr	a
	rlc	a
	mov	r7,a
	jnz	L019048?
	push	ar7
	mov	a,_main_joy_x_1_67
	add	a,_main_joy_x_1_67
	mov	r7,a
	mov	a,(_main_joy_x_1_67 + 1)
	rlc	a
	mov	r5,a
	clr	c
	clr	a
	subb	a,_main_joy_y_1_67
	mov	_main_sloc0_1_0,a
	clr	a
	subb	a,(_main_joy_y_1_67 + 1)
	mov	(_main_sloc0_1_0 + 1),a
	clr	c
	mov	a,r7
	subb	a,_main_sloc0_1_0
	mov	a,r5
	xrl	a,#0x80
	mov	b,(_main_sloc0_1_0 + 1)
	xrl	b,#0x80
	subb	a,b
	pop	ar7
	jnc	L019048?
	push	ar7
	clr	c
	clr	a
	subb	a,_main_joy_x_1_67
	mov	r5,a
	clr	a
	subb	a,(_main_joy_x_1_67 + 1)
	xch	a,r5
	add	a,acc
	xch	a,r5
	rlc	a
	mov	r7,a
	clr	c
	mov	a,r5
	subb	a,_main_sloc0_1_0
	mov	a,r7
	xrl	a,#0x80
	mov	b,(_main_sloc0_1_0 + 1)
	xrl	b,#0x80
	subb	a,b
	pop	ar7
	jc	L019043?
L019048?:
	mov	a,#0x73
	cjne	a,_main_c_1_67,L019044?
L019043?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:520: LCDprint("   ^            ", 2, 5);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_14
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:521: new_off_period = MIN_OFF_TIME + 5 * TIME_STEP;
	mov	r2,#0x48
	mov	r3,#0x00
	ljmp	L019072?
L019044?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:523: else if (joy_x > -50 && joy_x < 50 && joy_y > -50 && joy_y < 50) {	// stop
	mov	a,_main_sloc1_1_0
	jz	L019038?
	mov	a,r6
	jz	L019038?
	mov	a,r7
	jz	L019038?
	mov	a,r4
	jz	L019038?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:524: LCDprint("                ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_10
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:525: new_off_period = MIN_OFF_TIME + 6 * TIME_STEP;
	mov	r2,#0x50
	mov	r3,#0x00
	ljmp	L019072?
L019038?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:527: else if (joy_x > 0 && joy_y > 0) {	// forward right
	clr	c
	clr	a
	subb	a,_main_joy_x_1_67
	clr	a
	xrl	a,#0x80
	mov	b,(_main_joy_x_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	clr	a
	rlc	a
	mov	r4,a
	jz	L019034?
	clr	c
	clr	a
	subb	a,_main_joy_y_1_67
	clr	a
	xrl	a,#0x80
	mov	b,(_main_joy_y_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L019034?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:528: LCDprint("^         ^     ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_15
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:529: new_off_period = MIN_OFF_TIME + 7 * TIME_STEP;
	mov	r2,#0x58
	mov	r3,#0x00
	ljmp	L019072?
L019034?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:531: else if (joy_x < 0 && joy_y > 0) {	// forward left
	mov	a,(_main_joy_x_1_67 + 1)
	rlc	a
	clr	a
	rlc	a
	mov	r5,a
	jz	L019030?
	clr	c
	clr	a
	subb	a,_main_joy_y_1_67
	clr	a
	xrl	a,#0x80
	mov	b,(_main_joy_y_1_67 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L019030?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:532: LCDprint("      ^   ^     ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_16
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:533: new_off_period = MIN_OFF_TIME + 8 * TIME_STEP;
	mov	r2,#0x60
	mov	r3,#0x00
	sjmp	L019072?
L019030?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:535: else if (joy_x > 0 && joy_y < 0) {	// back right
	mov	a,r4
	jz	L019026?
	mov	a,(_main_joy_y_1_67 + 1)
	jnb	acc.7,L019026?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:536: LCDprint("   ^      ^     ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_17
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:537: new_off_period = MIN_OFF_TIME + 9 * TIME_STEP;
	mov	r2,#0x68
	mov	r3,#0x00
	sjmp	L019072?
L019026?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:539: else if (joy_x < 0 && joy_y < 0) {	// back left
	mov	a,r5
	jz	L019022?
	mov	a,(_main_joy_y_1_67 + 1)
	jnb	acc.7,L019022?
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:540: LCDprint("   ^  ^         ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_18
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:541: new_off_period = MIN_OFF_TIME + 10 * TIME_STEP;
	mov	r2,#0x70
	mov	r3,#0x00
	sjmp	L019072?
L019022?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:544: LCDprint("                ", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_10
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:545: new_off_period = MIN_OFF_TIME + 0 * TIME_STEP;
	mov	r2,#0x20
	mov	r3,#0x00
L019072?:
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:547: off_period = new_off_period;		
	mov	_off_period,r2
	mov	(_off_period + 1),r3
;	C:\Users\ducth\Documents\ELEC291\Project2\Transmitter\Final_transmitter.c:552: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
	ljmp	L019074?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Extension type: %02x  %02x  %02x  %02x  %02x  %02x'
	db 0x0A
	db 0x00
__str_1:
	db 'D  R  <=  =>'
	db 0x00
__str_2:
	db 0x1B
	db '[2J'
	db 0x1B
	db '[1;1H'
	db 0x00
__str_3:
	db 'PIC32MX130 I2C WII Nunchuck test program'
	db 0x0D
	db 0x0A
	db 'File: %s'
	db 0x0D
	db 0x0A
	db 'Compiled'
	db ': %s, %s'
	db 0x0D
	db 0x0A
	db 0x0D
	db 0x0A
	db 0x00
__str_4:
	db 'C:'
	db 0x5C
	db 'Users'
	db 0x5C
	db 'ducth'
	db 0x5C
	db 'Documents'
	db 0x5C
	db 'ELEC291'
	db 0x5C
	db 'Project2'
	db 0x5C
	db 'Transmitter'
	db 0x5C
	db 'Final_'
	db 'transmitter.c'
	db 0x00
__str_5:
	db 'Apr 12 2023'
	db 0x00
__str_6:
	db '13:10:57'
	db 0x00
__str_7:
	db 0x0A
	db 'Control:'
	db 0x0D
	db 0x00
__str_8:
	db 0x0A
	db 'control is: %c'
	db 0x0D
	db 0x00
__str_9:
	db ' tracking  mode '
	db 0x00
__str_10:
	db '                '
	db 0x00
__str_11:
	db '          ^     '
	db 0x00
__str_12:
	db '^               '
	db 0x00
__str_13:
	db '      ^         '
	db 0x00
__str_14:
	db '   ^            '
	db 0x00
__str_15:
	db '^         ^     '
	db 0x00
__str_16:
	db '      ^   ^     '
	db 0x00
__str_17:
	db '   ^      ^     '
	db 0x00
__str_18:
	db '   ^  ^         '
	db 0x00

	CSEG

end
