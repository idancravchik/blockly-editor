;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module demo_keyboard_b
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _SendKey
	.globl _USB_Process
	.globl _USB_Init
	.globl ___memcpy
	.globl _memset
	.globl _UIF_BUS_RST
	.globl _UIF_DETECT
	.globl _UIF_TRANSFER
	.globl _UIF_SUSPEND
	.globl _UIF_HST_SOF
	.globl _UIF_FIFO_OV
	.globl _U_SIE_FREE
	.globl _U_TOG_OK
	.globl _U_IS_NAK
	.globl _ADC_CHAN0
	.globl _ADC_CHAN1
	.globl _CMP_CHAN
	.globl _ADC_START
	.globl _ADC_IF
	.globl _CMP_IF
	.globl _CMPO
	.globl _U1RI
	.globl _U1TI
	.globl _U1RB8
	.globl _U1TB8
	.globl _U1REN
	.globl _U1SMOD
	.globl _U1SM0
	.globl _S0_R_FIFO
	.globl _S0_T_FIFO
	.globl _S0_FREE
	.globl _S0_IF_BYTE
	.globl _S0_IF_FIRST
	.globl _S0_IF_OV
	.globl _S0_FST_ACT
	.globl _CP_RL2
	.globl _C_T2
	.globl _TR2
	.globl _EXEN2
	.globl _TCLK
	.globl _RCLK
	.globl _EXF2
	.globl _CAP1F
	.globl _TF2
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _P3_0
	.globl _P3_1
	.globl _P3_2
	.globl _P3_3
	.globl _P3_4
	.globl _P3_5
	.globl _P3_6
	.globl _P3_7
	.globl _RXD
	.globl _PWM1_
	.globl _TXD
	.globl _PWM2_
	.globl _AIN3
	.globl _VBUS1
	.globl _INT0
	.globl _TXD1_
	.globl _INT1
	.globl _T0
	.globl _RXD1_
	.globl _PWM2
	.globl _T1
	.globl _UDP
	.globl _UDM
	.globl _P1_0
	.globl _P1_1
	.globl _P1_2
	.globl _P1_3
	.globl _P1_4
	.globl _P1_5
	.globl _P1_6
	.globl _P1_7
	.globl _TIN0
	.globl _CAP1
	.globl _T2
	.globl _AIN0
	.globl _VBUS2
	.globl _TIN1
	.globl _CAP2
	.globl _T2EX
	.globl _RXD_
	.globl _TXD_
	.globl _AIN1
	.globl _UCC1
	.globl _TIN2
	.globl _SCS
	.globl _CAP1_
	.globl _T2_
	.globl _AIN2
	.globl _UCC2
	.globl _TIN3
	.globl _PWM1
	.globl _MOSI
	.globl _TIN4
	.globl _RXD1
	.globl _MISO
	.globl _TIN5
	.globl _TXD1
	.globl _SCK
	.globl _IE_SPI0
	.globl _IE_TKEY
	.globl _IE_USB
	.globl _IE_ADC
	.globl _IE_UART1
	.globl _IE_PWMX
	.globl _IE_GPIO
	.globl _IE_WDOG
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _PT2
	.globl _PL_FLAG
	.globl _PH_FLAG
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _ET2
	.globl _E_DIS
	.globl _EA
	.globl _P
	.globl _F1
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _UEP1_DMA_H
	.globl _UEP1_DMA_L
	.globl _UEP1_DMA
	.globl _UEP0_DMA_H
	.globl _UEP0_DMA_L
	.globl _UEP0_DMA
	.globl _UEP2_3_MOD
	.globl _UEP4_1_MOD
	.globl _UEP3_DMA_H
	.globl _UEP3_DMA_L
	.globl _UEP3_DMA
	.globl _UEP2_DMA_H
	.globl _UEP2_DMA_L
	.globl _UEP2_DMA
	.globl _USB_DEV_AD
	.globl _USB_CTRL
	.globl _USB_INT_EN
	.globl _UEP4_T_LEN
	.globl _UEP4_CTRL
	.globl _UEP0_T_LEN
	.globl _UEP0_CTRL
	.globl _USB_RX_LEN
	.globl _USB_MIS_ST
	.globl _USB_INT_ST
	.globl _USB_INT_FG
	.globl _UEP3_T_LEN
	.globl _UEP3_CTRL
	.globl _UEP2_T_LEN
	.globl _UEP2_CTRL
	.globl _UEP1_T_LEN
	.globl _UEP1_CTRL
	.globl _UDEV_CTRL
	.globl _USB_C_CTRL
	.globl _TKEY_DATH
	.globl _TKEY_DATL
	.globl _TKEY_DAT
	.globl _TKEY_CTRL
	.globl _ADC_DATA
	.globl _ADC_CFG
	.globl _ADC_CTRL
	.globl _SBAUD1
	.globl _SBUF1
	.globl _SCON1
	.globl _SPI0_SETUP
	.globl _SPI0_CK_SE
	.globl _SPI0_CTRL
	.globl _SPI0_DATA
	.globl _SPI0_STAT
	.globl _PWM_CK_SE
	.globl _PWM_CTRL
	.globl _PWM_DATA1
	.globl _PWM_DATA2
	.globl _T2CAP1H
	.globl _T2CAP1L
	.globl _T2CAP1
	.globl _TH2
	.globl _TL2
	.globl _T2COUNT
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _RCAP2
	.globl _T2MOD
	.globl _T2CON
	.globl _SBUF
	.globl _SCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _XBUS_AUX
	.globl _PIN_FUNC
	.globl _P3_DIR_PU
	.globl _P3_MOD_OC
	.globl _P3
	.globl _P2
	.globl _P1_DIR_PU
	.globl _P1_MOD_OC
	.globl _P1
	.globl _ROM_CTRL
	.globl _ROM_DATA_H
	.globl _ROM_DATA_L
	.globl _ROM_DATA
	.globl _ROM_ADDR_H
	.globl _ROM_ADDR_L
	.globl _ROM_ADDR
	.globl _GPIO_IE
	.globl _IP_EX
	.globl _IE_EX
	.globl _IP
	.globl _IE
	.globl _WDOG_COUNT
	.globl _RESET_KEEP
	.globl _WAKE_CTRL
	.globl _CLOCK_CFG
	.globl _PCON
	.globl _GLOBAL_CFG
	.globl _SAFE_MOD
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _Ep1Buffer
	.globl _Ep0Buffer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_SAFE_MOD	=	0x00a1
_GLOBAL_CFG	=	0x00b1
_PCON	=	0x0087
_CLOCK_CFG	=	0x00b9
_WAKE_CTRL	=	0x00a9
_RESET_KEEP	=	0x00fe
_WDOG_COUNT	=	0x00ff
_IE	=	0x00a8
_IP	=	0x00b8
_IE_EX	=	0x00e8
_IP_EX	=	0x00e9
_GPIO_IE	=	0x00c7
_ROM_ADDR	=	0x8584
_ROM_ADDR_L	=	0x0084
_ROM_ADDR_H	=	0x0085
_ROM_DATA	=	0x8f8e
_ROM_DATA_L	=	0x008e
_ROM_DATA_H	=	0x008f
_ROM_CTRL	=	0x0086
_P1	=	0x0090
_P1_MOD_OC	=	0x0092
_P1_DIR_PU	=	0x0093
_P2	=	0x00a0
_P3	=	0x00b0
_P3_MOD_OC	=	0x0096
_P3_DIR_PU	=	0x0097
_PIN_FUNC	=	0x00c6
_XBUS_AUX	=	0x00a2
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_SCON	=	0x0098
_SBUF	=	0x0099
_T2CON	=	0x00c8
_T2MOD	=	0x00c9
_RCAP2	=	0xcbca
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_T2COUNT	=	0xcdcc
_TL2	=	0x00cc
_TH2	=	0x00cd
_T2CAP1	=	0xcfce
_T2CAP1L	=	0x00ce
_T2CAP1H	=	0x00cf
_PWM_DATA2	=	0x009b
_PWM_DATA1	=	0x009c
_PWM_CTRL	=	0x009d
_PWM_CK_SE	=	0x009e
_SPI0_STAT	=	0x00f8
_SPI0_DATA	=	0x00f9
_SPI0_CTRL	=	0x00fa
_SPI0_CK_SE	=	0x00fb
_SPI0_SETUP	=	0x00fc
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_SBAUD1	=	0x00c2
_ADC_CTRL	=	0x0080
_ADC_CFG	=	0x009a
_ADC_DATA	=	0x009f
_TKEY_CTRL	=	0x00c3
_TKEY_DAT	=	0xc5c4
_TKEY_DATL	=	0x00c4
_TKEY_DATH	=	0x00c5
_USB_C_CTRL	=	0x0091
_UDEV_CTRL	=	0x00d1
_UEP1_CTRL	=	0x00d2
_UEP1_T_LEN	=	0x00d3
_UEP2_CTRL	=	0x00d4
_UEP2_T_LEN	=	0x00d5
_UEP3_CTRL	=	0x00d6
_UEP3_T_LEN	=	0x00d7
_USB_INT_FG	=	0x00d8
_USB_INT_ST	=	0x00d9
_USB_MIS_ST	=	0x00da
_USB_RX_LEN	=	0x00db
_UEP0_CTRL	=	0x00dc
_UEP0_T_LEN	=	0x00dd
_UEP4_CTRL	=	0x00de
_UEP4_T_LEN	=	0x00df
_USB_INT_EN	=	0x00e1
_USB_CTRL	=	0x00e2
_USB_DEV_AD	=	0x00e3
_UEP2_DMA	=	0xe5e4
_UEP2_DMA_L	=	0x00e4
_UEP2_DMA_H	=	0x00e5
_UEP3_DMA	=	0xe7e6
_UEP3_DMA_L	=	0x00e6
_UEP3_DMA_H	=	0x00e7
_UEP4_1_MOD	=	0x00ea
_UEP2_3_MOD	=	0x00eb
_UEP0_DMA	=	0xedec
_UEP0_DMA_L	=	0x00ec
_UEP0_DMA_H	=	0x00ed
_UEP1_DMA	=	0xefee
_UEP1_DMA_L	=	0x00ee
_UEP1_DMA_H	=	0x00ef
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_F1	=	0x00d1
_P	=	0x00d0
_EA	=	0x00af
_E_DIS	=	0x00ae
_ET2	=	0x00ad
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PH_FLAG	=	0x00bf
_PL_FLAG	=	0x00be
_PT2	=	0x00bd
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_IE_WDOG	=	0x00ef
_IE_GPIO	=	0x00ee
_IE_PWMX	=	0x00ed
_IE_UART1	=	0x00ec
_IE_ADC	=	0x00eb
_IE_USB	=	0x00ea
_IE_TKEY	=	0x00e9
_IE_SPI0	=	0x00e8
_SCK	=	0x0097
_TXD1	=	0x0097
_TIN5	=	0x0097
_MISO	=	0x0096
_RXD1	=	0x0096
_TIN4	=	0x0096
_MOSI	=	0x0095
_PWM1	=	0x0095
_TIN3	=	0x0095
_UCC2	=	0x0095
_AIN2	=	0x0095
_T2_	=	0x0094
_CAP1_	=	0x0094
_SCS	=	0x0094
_TIN2	=	0x0094
_UCC1	=	0x0094
_AIN1	=	0x0094
_TXD_	=	0x0093
_RXD_	=	0x0092
_T2EX	=	0x0091
_CAP2	=	0x0091
_TIN1	=	0x0091
_VBUS2	=	0x0091
_AIN0	=	0x0091
_T2	=	0x0090
_CAP1	=	0x0090
_TIN0	=	0x0090
_P1_7	=	0x0097
_P1_6	=	0x0096
_P1_5	=	0x0095
_P1_4	=	0x0094
_P1_3	=	0x0093
_P1_2	=	0x0092
_P1_1	=	0x0091
_P1_0	=	0x0090
_UDM	=	0x00b7
_UDP	=	0x00b6
_T1	=	0x00b5
_PWM2	=	0x00b4
_RXD1_	=	0x00b4
_T0	=	0x00b4
_INT1	=	0x00b3
_TXD1_	=	0x00b2
_INT0	=	0x00b2
_VBUS1	=	0x00b2
_AIN3	=	0x00b2
_PWM2_	=	0x00b1
_TXD	=	0x00b1
_PWM1_	=	0x00b0
_RXD	=	0x00b0
_P3_7	=	0x00b7
_P3_6	=	0x00b6
_P3_5	=	0x00b5
_P3_4	=	0x00b4
_P3_3	=	0x00b3
_P3_2	=	0x00b2
_P3_1	=	0x00b1
_P3_0	=	0x00b0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
_TF2	=	0x00cf
_CAP1F	=	0x00cf
_EXF2	=	0x00ce
_RCLK	=	0x00cd
_TCLK	=	0x00cc
_EXEN2	=	0x00cb
_TR2	=	0x00ca
_C_T2	=	0x00c9
_CP_RL2	=	0x00c8
_S0_FST_ACT	=	0x00ff
_S0_IF_OV	=	0x00fe
_S0_IF_FIRST	=	0x00fd
_S0_IF_BYTE	=	0x00fc
_S0_FREE	=	0x00fb
_S0_T_FIFO	=	0x00fa
_S0_R_FIFO	=	0x00f8
_U1SM0	=	0x00c7
_U1SMOD	=	0x00c5
_U1REN	=	0x00c4
_U1TB8	=	0x00c3
_U1RB8	=	0x00c2
_U1TI	=	0x00c1
_U1RI	=	0x00c0
_CMPO	=	0x0087
_CMP_IF	=	0x0086
_ADC_IF	=	0x0085
_ADC_START	=	0x0084
_CMP_CHAN	=	0x0083
_ADC_CHAN1	=	0x0081
_ADC_CHAN0	=	0x0080
_U_IS_NAK	=	0x00df
_U_TOG_OK	=	0x00de
_U_SIE_FREE	=	0x00dd
_UIF_FIFO_OV	=	0x00dc
_UIF_HST_SOF	=	0x00db
_UIF_SUSPEND	=	0x00da
_UIF_TRANSFER	=	0x00d9
_UIF_DETECT	=	0x00d8
_UIF_BUS_RST	=	0x00d8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_usb_dev_addr:
	.ds 1
_usb_config:
	.ds 1
_setup_tx_ptr:
	.ds 2
_setup_tx_len:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_Ep0Buffer	=	0x0000
_Ep1Buffer	=	0x0040
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
; restartable atomic support routines
	.ds	5
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	demo_keyboard_b.c:10: static uint8_t usb_dev_addr = 0;
	mov	_usb_dev_addr,#0x00
;	demo_keyboard_b.c:11: static uint8_t usb_config = 0;
	mov	_usb_config,#0x00
;	demo_keyboard_b.c:12: static const __code uint8_t *setup_tx_ptr = 0;
	clr	a
	mov	_setup_tx_ptr,a
	mov	(_setup_tx_ptr + 1),a
;	demo_keyboard_b.c:13: static uint16_t setup_tx_len = 0;
	mov	_setup_tx_len,a
	mov	(_setup_tx_len + 1),a
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
__sdcc_program_exit:
	sjmp	.
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_Init'
;------------------------------------------------------------
;	demo_keyboard_b.c:45: void USB_Init(void) {
;	-----------------------------------------
;	 function USB_Init
;	-----------------------------------------
_USB_Init:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	demo_keyboard_b.c:46: SAFE_MOD = 0x55; SAFE_MOD = 0xAA; CLOCK_CFG = 0x86; SAFE_MOD = 0x00; // 24MHz
	mov	_SAFE_MOD,#0x55
	mov	_SAFE_MOD,#0xaa
	mov	_CLOCK_CFG,#0x86
	mov	_SAFE_MOD,#0x00
;	demo_keyboard_b.c:47: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL; USB_CTRL = 0x00;
	mov	_USB_CTRL,#0x06
	mov	_USB_CTRL,#0x00
;	demo_keyboard_b.c:48: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
	mov	_UEP0_DMA_L,#_Ep0Buffer
;	demo_keyboard_b.c:49: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
	mov	r6,#_Ep0Buffer
	mov	r7,#(_Ep0Buffer >> 8)
	mov	_UEP0_DMA_H,r7
;	demo_keyboard_b.c:50: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
	mov	_UEP1_DMA_L,#_Ep1Buffer
;	demo_keyboard_b.c:51: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
	mov	r6,#_Ep1Buffer
	mov	r7,#(_Ep1Buffer >> 8)
	mov	_UEP1_DMA_H,r7
;	demo_keyboard_b.c:52: UEP4_1_MOD = 0x40; // EP1 IN enable
	mov	_UEP4_1_MOD,#0x40
;	demo_keyboard_b.c:53: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
	mov	_UEP1_CTRL,#0x12
;	demo_keyboard_b.c:54: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	demo_keyboard_b.c:55: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
	mov	_USB_CTRL,#0x29
;	demo_keyboard_b.c:56: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN;
	mov	_UDEV_CTRL,#0x81
;	demo_keyboard_b.c:57: USB_DEV_AD = 0x00;
	mov	_USB_DEV_AD,#0x00
;	demo_keyboard_b.c:58: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Handle_EP0_Setup'
;------------------------------------------------------------
;req_type      Allocated to registers r7 
;req           Allocated to registers r6 
;value         Allocated to registers r4 r5 
;length        Allocated to registers r3 r2 
;send_len      Allocated to registers r7 
;------------------------------------------------------------
;	demo_keyboard_b.c:60: static void Handle_EP0_Setup(void) {
;	-----------------------------------------
;	 function Handle_EP0_Setup
;	-----------------------------------------
_Handle_EP0_Setup:
;	demo_keyboard_b.c:61: uint8_t req_type = Ep0Buffer[0];
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	mov	r7,a
;	demo_keyboard_b.c:62: uint8_t req = Ep0Buffer[1];
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	a,@dptr
	mov	r6,a
;	demo_keyboard_b.c:63: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r3,a
	mov	r4,#0x00
	mov	ar2,r5
	mov	r5,#0x00
	mov	a,r4
	orl	a,r2
	mov	r4,a
	mov	a,r3
	orl	a,r5
;	demo_keyboard_b.c:64: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
	mov	dptr,#(_Ep0Buffer + 0x0006)
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#(_Ep0Buffer + 0x0007)
	movx	a,@dptr
	mov	r2,a
	clr	a
	mov	r0,a
	orl	a,r3
	mov	r3,a
	mov	a,r2
	orl	a,r0
	mov	r2,a
;	demo_keyboard_b.c:65: setup_tx_ptr = 0; setup_tx_len = 0;
	clr	a
	mov	_setup_tx_ptr,a
	mov	(_setup_tx_ptr + 1),a
	mov	_setup_tx_len,a
	mov	(_setup_tx_len + 1),a
;	demo_keyboard_b.c:67: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
	mov	a,r7
	anl	a,#0x60
	jz	00243$
	ljmp	00120$
00243$:
;	demo_keyboard_b.c:68: switch (req) {
	mov	a,r6
	jnz	00244$
	ljmp	00117$
00244$:
	cjne	r6,#0x05,00245$
	ljmp	00115$
00245$:
	cjne	r6,#0x06,00246$
	sjmp	00101$
00246$:
	cjne	r6,#0x09,00247$
	ljmp	00116$
00247$:
	ljmp	00120$
;	demo_keyboard_b.c:69: case USB_GET_DESCRIPTOR:
00101$:
;	demo_keyboard_b.c:70: switch (Ep0Buffer[3]) {
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00248$
	sjmp	00102$
00248$:
	cjne	r7,#0x02,00249$
	sjmp	00103$
00249$:
	cjne	r7,#0x03,00250$
	sjmp	00104$
00250$:
	cjne	r7,#0x22,00251$
	sjmp	00113$
00251$:
	ljmp	00120$
;	demo_keyboard_b.c:71: case 0x01: setup_tx_ptr = DevDesc; setup_tx_len = sizeof(DevDesc); break;
00102$:
	mov	_setup_tx_ptr,#_DevDesc
	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
	mov	_setup_tx_len,#0x12
	mov	(_setup_tx_len + 1),#0x00
;	demo_keyboard_b.c:72: case 0x02: setup_tx_ptr = CfgDesc; setup_tx_len = sizeof(CfgDesc); break;
	sjmp	00120$
00103$:
	mov	_setup_tx_ptr,#_CfgDesc
	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
	mov	_setup_tx_len,#0x22
	mov	(_setup_tx_len + 1),#0x00
;	demo_keyboard_b.c:73: case 0x03:
	sjmp	00120$
00104$:
;	demo_keyboard_b.c:74: if (Ep0Buffer[2] == 0) { setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); }
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	jnz	00111$
	mov	_setup_tx_ptr,#_Str0Desc
	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
	mov	_setup_tx_len,#0x04
	mov	(_setup_tx_len + 1),a
	sjmp	00120$
00111$:
;	demo_keyboard_b.c:75: else if (Ep0Buffer[2] == 1) { setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); }
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00108$
	mov	_setup_tx_ptr,#_Str1Desc
	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
	mov	_setup_tx_len,#0x0e
	mov	(_setup_tx_len + 1),#0x00
	sjmp	00120$
00108$:
;	demo_keyboard_b.c:76: else if (Ep0Buffer[2] == 2) { setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); }
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x02,00120$
	mov	_setup_tx_ptr,#_Str2Desc
	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
	mov	_setup_tx_len,#0x18
	mov	(_setup_tx_len + 1),#0x00
;	demo_keyboard_b.c:77: break;
;	demo_keyboard_b.c:78: case 0x22: setup_tx_ptr = ReportDesc; setup_tx_len = sizeof(ReportDesc); break;
	sjmp	00120$
00113$:
	mov	_setup_tx_ptr,#_ReportDesc
	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
	mov	_setup_tx_len,#0x3f
	mov	(_setup_tx_len + 1),#0x00
;	demo_keyboard_b.c:80: break;
;	demo_keyboard_b.c:81: case USB_SET_ADDRESS: usb_dev_addr = (uint8_t)value; break;
	sjmp	00120$
00115$:
	mov	_usb_dev_addr,r4
;	demo_keyboard_b.c:82: case USB_SET_CONFIGURATION: usb_config = (uint8_t)value; break;
	sjmp	00120$
00116$:
	mov	_usb_config,r4
;	demo_keyboard_b.c:83: case USB_GET_STATUS: Ep0Buffer[0] = 0; Ep0Buffer[1] = 0; setup_tx_len = 2; break;
	sjmp	00120$
00117$:
	mov	dptr,#_Ep0Buffer
	clr	a
	movx	@dptr,a
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	@dptr,a
	mov	_setup_tx_len,#0x02
	mov	(_setup_tx_len + 1),a
;	demo_keyboard_b.c:84: }
00120$:
;	demo_keyboard_b.c:87: if (setup_tx_len > length) setup_tx_len = length;
	clr	c
	mov	a,r3
	subb	a,_setup_tx_len
	mov	a,r2
	subb	a,(_setup_tx_len + 1)
	jnc	00122$
;	free result
	mov	_setup_tx_len,r3
	mov	(_setup_tx_len + 1),r2
00122$:
;	demo_keyboard_b.c:88: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
	mov	r6,_setup_tx_len
	mov	r7,(_setup_tx_len + 1)
	clr	c
	mov	a,#0x40
	subb	a,r6
	clr	a
	subb	a,r7
	jnc	00128$
;	free result
	mov	r7,#0x40
	sjmp	00129$
00128$:
	mov	r6,_setup_tx_len
	mov	ar7,r6
00129$:
;	demo_keyboard_b.c:89: if (setup_tx_ptr && send_len > 0) {
	mov	a,_setup_tx_ptr
	orl	a,(_setup_tx_ptr + 1)
	jz	00124$
	mov	a,r7
	jz	00124$
;	demo_keyboard_b.c:90: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
	mov	___memcpy_PARM_2,_setup_tx_ptr
	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
	mov	(___memcpy_PARM_2 + 2),#0x80
	mov	___memcpy_PARM_3,r7
	mov	(___memcpy_PARM_3 + 1),#0x00
	mov	dptr,#_Ep0Buffer
	mov	b, #0x00
	push	ar7
	lcall	___memcpy
	pop	ar7
;	demo_keyboard_b.c:91: setup_tx_ptr += send_len; setup_tx_len -= send_len;
	mov	a,r7
	add	a, _setup_tx_ptr
	mov	_setup_tx_ptr,a
	clr	a
	addc	a, (_setup_tx_ptr + 1)
	mov	(_setup_tx_ptr + 1),a
	mov	ar5,r7
	mov	r6,#0x00
	mov	r3,_setup_tx_len
	mov	r4,(_setup_tx_len + 1)
	mov	a,r3
	clr	c
	subb	a,r5
	mov	r3,a
	mov	a,r4
	subb	a,r6
	mov	r4,a
	mov	_setup_tx_len,r3
	mov	(_setup_tx_len + 1),r4
00124$:
;	demo_keyboard_b.c:93: UEP0_T_LEN = send_len;
	mov	_UEP0_T_LEN,r7
;	demo_keyboard_b.c:94: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
	mov	_UEP0_CTRL,#0xc0
;	demo_keyboard_b.c:95: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_Process'
;------------------------------------------------------------
;token         Allocated to registers r7 
;endp          Allocated to registers r5 
;send_len      Allocated to registers r6 
;------------------------------------------------------------
;	demo_keyboard_b.c:97: void USB_Process(void) {
;	-----------------------------------------
;	 function USB_Process
;	-----------------------------------------
_USB_Process:
;	demo_keyboard_b.c:98: if (UIF_BUS_RST) {
	jnb	_UIF_BUS_RST,00102$
;	demo_keyboard_b.c:99: USB_DEV_AD = 0x00;
	mov	_USB_DEV_AD,#0x00
;	demo_keyboard_b.c:100: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	demo_keyboard_b.c:101: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
	mov	_UEP1_CTRL,#0x12
;	demo_keyboard_b.c:102: UIF_BUS_RST = 0;
;	assignBit
	clr	_UIF_BUS_RST
;	demo_keyboard_b.c:103: return;
	ret
00102$:
;	demo_keyboard_b.c:105: if (UIF_TRANSFER) {
	jb	_UIF_TRANSFER,00215$
	ret
00215$:
;	demo_keyboard_b.c:106: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
	mov	a,_USB_INT_ST
	anl	a,#0x30
	mov	r7,a
;	demo_keyboard_b.c:107: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
	mov	a,_USB_INT_ST
	anl	a,#0x0f
;	demo_keyboard_b.c:108: if (endp == 0) {
	mov	r5,a
	jz	00216$
	ljmp	00122$
00216$:
;	demo_keyboard_b.c:109: if (token == UIS_TOKEN_SETUP) {
	cjne	r7,#0x30,00115$
;	demo_keyboard_b.c:110: Handle_EP0_Setup();
	lcall	_Handle_EP0_Setup
	ljmp	00123$
00115$:
;	demo_keyboard_b.c:111: } else if (token == UIS_TOKEN_IN) {
	cjne	r7,#0x20,00112$
;	demo_keyboard_b.c:112: if (usb_dev_addr != 0 && USB_DEV_AD == 0) USB_DEV_AD = usb_dev_addr;
	mov	a,_usb_dev_addr
	jz	00104$
	mov	a,_USB_DEV_AD
	jnz	00104$
	mov	_USB_DEV_AD,_usb_dev_addr
00104$:
;	demo_keyboard_b.c:113: if (setup_tx_len > 0) {
	mov	a,_setup_tx_len
	orl	a,(_setup_tx_len + 1)
	jz	00107$
;	demo_keyboard_b.c:114: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
	mov	r4,_setup_tx_len
	mov	r6,(_setup_tx_len + 1)
	clr	c
	mov	a,#0x40
	subb	a,r4
	clr	a
	subb	a,r6
	jnc	00128$
;	free result
	mov	r6,#0x40
	sjmp	00129$
00128$:
	mov	r4,_setup_tx_len
	mov	ar6,r4
00129$:
;	demo_keyboard_b.c:115: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
	mov	___memcpy_PARM_2,_setup_tx_ptr
	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
	mov	(___memcpy_PARM_2 + 2),#0x80
	mov	___memcpy_PARM_3,r6
	mov	(___memcpy_PARM_3 + 1),#0x00
	mov	dptr,#_Ep0Buffer
	mov	b, #0x00
	push	ar6
	lcall	___memcpy
	pop	ar6
;	demo_keyboard_b.c:116: setup_tx_ptr += send_len; setup_tx_len -= send_len;
	mov	a,r6
	add	a, _setup_tx_ptr
	mov	_setup_tx_ptr,a
	clr	a
	addc	a, (_setup_tx_ptr + 1)
	mov	(_setup_tx_ptr + 1),a
	mov	ar3,r6
	mov	r4,#0x00
	mov	r1,_setup_tx_len
	mov	r2,(_setup_tx_len + 1)
	mov	a,r1
	clr	c
	subb	a,r3
	mov	r1,a
	mov	a,r2
	subb	a,r4
	mov	r2,a
	mov	_setup_tx_len,r1
	mov	(_setup_tx_len + 1),r2
;	demo_keyboard_b.c:117: UEP0_T_LEN = send_len;
	mov	_UEP0_T_LEN,r6
;	demo_keyboard_b.c:118: UEP0_CTRL ^= bUEP_T_TOG;
	xrl	_UEP0_CTRL,#0x40
;	demo_keyboard_b.c:119: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
	anl	_UEP0_CTRL,#0xfc
	sjmp	00123$
00107$:
;	demo_keyboard_b.c:121: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	demo_keyboard_b.c:122: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
	sjmp	00123$
00112$:
;	demo_keyboard_b.c:124: } else if (token == UIS_TOKEN_OUT) {
	mov	a,r7
	jnz	00123$
;	demo_keyboard_b.c:125: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
	sjmp	00123$
00122$:
;	demo_keyboard_b.c:127: } else if (endp == 1) {
	cjne	r5,#0x01,00123$
;	demo_keyboard_b.c:128: if (token == UIS_TOKEN_IN) {
	cjne	r7,#0x20,00123$
;	demo_keyboard_b.c:129: UEP1_T_LEN = 0;
	mov	_UEP1_T_LEN,#0x00
;	demo_keyboard_b.c:130: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
	mov	a,#0xfc
	anl	a,_UEP1_CTRL
	orl	a,#0x02
	mov	_UEP1_CTRL,a
00123$:
;	demo_keyboard_b.c:133: UIF_TRANSFER = 0;
;	assignBit
	clr	_UIF_TRANSFER
;	demo_keyboard_b.c:135: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SendKey'
;------------------------------------------------------------
;keycode       Allocated to registers r7 
;i             Allocated to registers r6 r7 
;------------------------------------------------------------
;	demo_keyboard_b.c:137: void SendKey(uint8_t keycode) {
;	-----------------------------------------
;	 function SendKey
;	-----------------------------------------
_SendKey:
	mov	r7, dpl
;	demo_keyboard_b.c:138: while (UEP1_CTRL & 0x03) { USB_Process(); }
00101$:
	mov	a,_UEP1_CTRL
	anl	a,#0x03
	jz	00103$
	push	ar7
	lcall	_USB_Process
	pop	ar7
	sjmp	00101$
00103$:
;	demo_keyboard_b.c:139: Ep1Buffer[0] = 0;
	mov	dptr,#_Ep1Buffer
	clr	a
	movx	@dptr,a
;	demo_keyboard_b.c:140: Ep1Buffer[1] = 0;
	mov	dptr,#(_Ep1Buffer + 0x0001)
	movx	@dptr,a
;	demo_keyboard_b.c:141: Ep1Buffer[2] = keycode;
	mov	dptr,#(_Ep1Buffer + 0x0002)
	mov	a,r7
	movx	@dptr,a
;	demo_keyboard_b.c:142: memset(&Ep1Buffer[3], 0, 5);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x05
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#(_Ep1Buffer + 0x0003)
	mov	b, #0x00
	lcall	_memset
;	demo_keyboard_b.c:143: UEP1_T_LEN = 8;
	mov	_UEP1_T_LEN,#0x08
;	demo_keyboard_b.c:144: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
	anl	_UEP1_CTRL,#0xfc
;	demo_keyboard_b.c:146: for (uint16_t i = 0; i < 20000; i++) { USB_Process(); }
	mov	r6,#0x00
	mov	r7,#0x00
00109$:
	mov	ar4,r6
	mov	ar5,r7
	clr	c
	mov	a,r4
	subb	a,#0x20
	mov	a,r5
	subb	a,#0x4e
	jnc	00105$
	push	ar7
	push	ar6
	lcall	_USB_Process
	pop	ar6
	pop	ar7
	inc	r6
;	demo_keyboard_b.c:147: while (UEP1_CTRL & 0x03) { USB_Process(); }
	cjne	r6,#0x00,00109$
	inc	r7
	sjmp	00109$
00105$:
	mov	a,_UEP1_CTRL
	anl	a,#0x03
	jz	00107$
	lcall	_USB_Process
	sjmp	00105$
00107$:
;	demo_keyboard_b.c:148: memset(Ep1Buffer, 0, 8);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x08
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#_Ep1Buffer
	mov	b, #0x00
	lcall	_memset
;	demo_keyboard_b.c:149: UEP1_T_LEN = 8;
	mov	_UEP1_T_LEN,#0x08
;	demo_keyboard_b.c:150: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
	anl	_UEP1_CTRL,#0xfc
;	demo_keyboard_b.c:151: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i             Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	demo_keyboard_b.c:153: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	demo_keyboard_b.c:154: USB_Init();
	lcall	_USB_Init
;	demo_keyboard_b.c:157: for (uint32_t i = 0; i < 180000UL; i++) {
00117$:
	mov	r4,#0x00
	mov	r5,#0x00
	mov	r6,#0x00
	mov	r7,#0x00
00108$:
	clr	c
	mov	a,r4
	subb	a,#0x20
	mov	a,r5
	subb	a,#0xbf
	mov	a,r6
	subb	a,#0x02
	mov	a,r7
	subb	a,#0x00
	jnc	00101$
;	demo_keyboard_b.c:158: USB_Process();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_USB_Process
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	demo_keyboard_b.c:157: for (uint32_t i = 0; i < 180000UL; i++) {
	inc	r4
	cjne	r4,#0x00,00142$
	inc	r5
	cjne	r5,#0x00,00142$
	inc	r6
	cjne	r6,#0x00,00108$
	inc	r7
00142$:
	sjmp	00108$
00101$:
;	demo_keyboard_b.c:162: if (usb_config != 0) {
	mov	a,_usb_config
	jz	00117$
;	demo_keyboard_b.c:163: SendKey(0x05);
	mov	dpl, #0x05
	lcall	_SendKey
;	demo_keyboard_b.c:166: }
	sjmp	00117$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_DevDesc:
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x5d	; 93
	.db #0xc5	; 197
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ReportDesc:
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0xe0	; 224
	.db #0x29	; 41
	.db #0xe7	; 231
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0x05	; 5
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x05	; 5
	.db #0x91	; 145
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x91	; 145
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0x06	; 6
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x65	; 101	'e'
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x65	; 101	'e'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc0	; 192
	.area CSEG    (CODE)
	.area CONST   (CODE)
_CfgDesc:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0a	; 10
	.area CSEG    (CODE)
	.area CONST   (CODE)
_Str0Desc:
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x04	; 4
	.area CSEG    (CODE)
	.area CONST   (CODE)
_Str1Desc:
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.area CSEG    (CODE)
	.area CONST   (CODE)
_Str2Desc:
	.db #0x1a	; 26
	.db #0x03	; 3
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
