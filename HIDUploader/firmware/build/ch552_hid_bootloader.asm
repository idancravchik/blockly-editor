;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module bootloader
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _IAP_CalculateCRC16_PARM_2
	.globl _IAP_WriteWord_PARM_2
	.globl _main
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
	.globl _USB_SendReport_PARM_2
	.globl _IAP_ErasePage
	.globl _IAP_WriteWord
	.globl _IAP_ReadWord
	.globl _IAP_CalculateCRC16
	.globl _USB_Init
	.globl _USB_Process
	.globl _USB_Available
	.globl _USB_GetRxBuffer
	.globl _USB_ReleaseRx
	.globl _USB_SendReport
	.globl _USB_Shutdown
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
_rx_ready:
	.ds 1
_usb_dev_addr:
	.ds 1
_usb_config:
	.ds 1
_setup_tx_ptr:
	.ds 2
_setup_tx_len:
	.ds 2
_USB_SendReport_PARM_2:
	.ds 1
_is_unlocked:
	.ds 1
_last_erased_page:
	.ds 2
_ProcessPacket_rx_10000_126:
	.ds 3
_ProcessPacket_cmd_10000_126:
	.ds 1
_ProcessPacket_seq_10000_126:
	.ds 1
_ProcessPacket_addr_10000_126:
	.ds 2
_ProcessPacket_len_10000_126:
	.ds 1
_ProcessPacket_erase_err_40000_136:
	.ds 1
_ProcessPacket_end_page_40000_136:
	.ds 2
_ProcessPacket_err_40000_144:
	.ds 1
_ProcessPacket_i_50000_145:
	.ds 1
_ProcessPacket_sloc0_1_0:
	.ds 1
_ProcessPacket_sloc1_1_0:
	.ds 2
_ProcessPacket_sloc2_1_0:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_IAP_WriteWord_PARM_2:
	.ds 2
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_IAP_CalculateCRC16_PARM_2:
	.ds 2
_IAP_CalculateCRC16_i_20000_28:
	.ds 2
	.area	OSEG    (OVR,DATA)
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
_main_sloc0_1_0:
	.ds 1
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
_reply_buf:
	.ds 64
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
;	usb_hid.c:10: static volatile uint8_t rx_ready = 0;
	mov	_rx_ready,#0x00
;	usb_hid.c:11: static uint8_t usb_dev_addr = 0;
	mov	_usb_dev_addr,#0x00
;	usb_hid.c:12: static uint8_t usb_config = 0;
	mov	_usb_config,#0x00
;	usb_hid.c:117: static __code const uint8_t *setup_tx_ptr = 0;
	clr	a
	mov	_setup_tx_ptr,a
	mov	(_setup_tx_ptr + 1),a
;	usb_hid.c:118: static uint16_t setup_tx_len = 0;
	mov	_setup_tx_len,a
	mov	(_setup_tx_len + 1),a
;	bootloader.c:27: static uint8_t is_unlocked = 0;
	mov	_is_unlocked,a
;	bootloader.c:28: static uint16_t last_erased_page = 0xFFFF;
	mov	_last_erased_page,#0xff
	mov	(_last_erased_page + 1),#0xff
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
;Allocation info for local variables in function 'IAP_ErasePage'
;------------------------------------------------------------
;addr          Allocated to registers r6 r7 
;status        Allocated to registers r7 
;ea_saved      Allocated to registers r5 
;------------------------------------------------------------
;	iap_flash.c:11: uint8_t IAP_ErasePage(uint16_t addr) {
;	-----------------------------------------
;	 function IAP_ErasePage
;	-----------------------------------------
_IAP_ErasePage:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7, dph
;	iap_flash.c:16: if (addr >= BOOTLOADER_START) {
	mov	a,#0x100 - 0x2c
	add	a,r7
	jnc	00102$
;	iap_flash.c:17: return 0x03; // Out of bounds error
	mov	dpl, #0x03
	ret
00102$:
;	iap_flash.c:21: addr &= ~0x03FF;
	mov	r6,#0x00
	anl	ar7,#0xfc
;	iap_flash.c:24: ea_saved = EA;
	mov	c,_EA
	clr	a
	rlc	a
	mov	r5,a
;	iap_flash.c:25: EA = 0;
;	assignBit
	clr	_EA
;	iap_flash.c:28: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	iap_flash.c:29: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	iap_flash.c:30: GLOBAL_CFG |= bCODE_WE;
	orl	_GLOBAL_CFG,#0x08
;	iap_flash.c:33: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
	mov	_ROM_ADDR_L,r6
;	iap_flash.c:34: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
	mov	_ROM_ADDR_H,r7
;	iap_flash.c:37: ROM_CTRL = ROM_CMD_ERASE;
	mov	_ROM_CTRL,#0xa6
;	iap_flash.c:40: status = ROM_STATUS;
	mov	r7,_ROM_CTRL
;	iap_flash.c:43: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	iap_flash.c:44: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	iap_flash.c:45: GLOBAL_CFG &= ~bCODE_WE;
	anl	_GLOBAL_CFG,#0xf7
;	iap_flash.c:46: SAFE_MOD = 0x00;
	mov	_SAFE_MOD,#0x00
;	iap_flash.c:49: EA = ea_saved;
;	assignBit
	mov	a,r5
	add	a,#0xff
	mov	_EA,c
;	iap_flash.c:52: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
	mov	a,r7
	jb	acc.1,00103$
	mov	a,r7
	jb	acc.6,00104$
00103$:
;	iap_flash.c:53: return 0x04; // Erase error
	mov	dpl, #0x04
	ret
00104$:
;	iap_flash.c:55: return 0x00;
	mov	dpl, #0x00
;	iap_flash.c:56: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IAP_WriteWord'
;------------------------------------------------------------
;data_word     Allocated with name '_IAP_WriteWord_PARM_2'
;addr          Allocated to registers r6 r7 
;status        Allocated to registers r7 
;ea_saved      Allocated to registers r5 
;------------------------------------------------------------
;	iap_flash.c:58: uint8_t IAP_WriteWord(uint16_t addr, uint16_t data_word) {
;	-----------------------------------------
;	 function IAP_WriteWord
;	-----------------------------------------
_IAP_WriteWord:
	mov	r6, dpl
	mov	r7, dph
;	iap_flash.c:63: if (addr >= BOOTLOADER_START) {
	mov	a,#0x100 - 0x2c
	add	a,r7
	jnc	00102$
;	iap_flash.c:64: return 0x03; // Out of bounds error
	mov	dpl, #0x03
	ret
00102$:
;	iap_flash.c:68: addr &= ~0x0001;
	anl	ar6,#0xfe
;	iap_flash.c:71: ea_saved = EA;
	mov	c,_EA
	clr	a
	rlc	a
	mov	r5,a
;	iap_flash.c:72: EA = 0;
;	assignBit
	clr	_EA
;	iap_flash.c:75: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	iap_flash.c:76: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	iap_flash.c:77: GLOBAL_CFG |= bCODE_WE;
	orl	_GLOBAL_CFG,#0x08
;	iap_flash.c:80: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
	mov	_ROM_ADDR_L,r6
;	iap_flash.c:81: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
	mov	_ROM_ADDR_H,r7
;	iap_flash.c:82: ROM_DATA_L = (uint8_t)(data_word & 0xFF);
	mov	_ROM_DATA_L,_IAP_WriteWord_PARM_2
;	iap_flash.c:83: ROM_DATA_H = (uint8_t)((data_word >> 8) & 0xFF);
	mov	_ROM_DATA_H,(_IAP_WriteWord_PARM_2 + 1)
;	iap_flash.c:86: ROM_CTRL = ROM_CMD_WRITE;
	mov	_ROM_CTRL,#0x9a
;	iap_flash.c:89: status = ROM_STATUS;
	mov	r7,_ROM_CTRL
;	iap_flash.c:92: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	iap_flash.c:93: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	iap_flash.c:94: GLOBAL_CFG &= ~bCODE_WE;
	anl	_GLOBAL_CFG,#0xf7
;	iap_flash.c:95: SAFE_MOD = 0x00;
	mov	_SAFE_MOD,#0x00
;	iap_flash.c:98: EA = ea_saved;
;	assignBit
	mov	a,r5
	add	a,#0xff
	mov	_EA,c
;	iap_flash.c:101: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
	mov	a,r7
	jb	acc.1,00103$
	mov	a,r7
	jb	acc.6,00104$
00103$:
;	iap_flash.c:102: return 0x04; // Write error
	mov	dpl, #0x04
	ret
00104$:
;	iap_flash.c:104: return 0x00;
	mov	dpl, #0x00
;	iap_flash.c:105: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IAP_ReadWord'
;------------------------------------------------------------
;addr          Allocated to registers r6 r7 
;low           Allocated to registers r5 
;high          Allocated to registers 
;ptr           Allocated to registers r6 r7 
;------------------------------------------------------------
;	iap_flash.c:107: uint16_t IAP_ReadWord(uint16_t addr) {
;	-----------------------------------------
;	 function IAP_ReadWord
;	-----------------------------------------
_IAP_ReadWord:
;	iap_flash.c:109: __code const uint8_t *ptr = (__code const uint8_t *)addr;
;	iap_flash.c:110: low = *ptr;
	mov	r6,dpl
	mov  r7,dph
	clr	a
	movc	a,@a+dptr
	mov	r5,a
;	iap_flash.c:111: high = *(ptr + 1);
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	clr	a
	movc	a,@a+dptr
;	iap_flash.c:112: return ((uint16_t)high << 8) | low;
	mov	r6,a
	clr	a
	mov	r7,a
	mov	r4,a
	mov	a,r5
	orl	a,r7
	mov	dpl,a
	mov	a,r4
	orl	a,r6
	mov	dph,a
;	iap_flash.c:113: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'IAP_CalculateCRC16'
;------------------------------------------------------------
;length        Allocated with name '_IAP_CalculateCRC16_PARM_2'
;start_addr    Allocated to registers r6 r7 
;crc           Allocated to registers r4 r5 
;ptr           Allocated to registers 
;i             Allocated with name '_IAP_CalculateCRC16_i_20000_28'
;byte          Allocated to registers 
;b             Allocated to registers r1 
;------------------------------------------------------------
;	iap_flash.c:115: uint16_t IAP_CalculateCRC16(uint16_t start_addr, uint16_t length) {
;	-----------------------------------------
;	 function IAP_CalculateCRC16
;	-----------------------------------------
_IAP_CalculateCRC16:
	mov	r6, dpl
	mov	r7, dph
;	iap_flash.c:116: uint16_t crc = 0xFFFF;
	mov	r4,#0xff
	mov	r5,#0xff
;	iap_flash.c:117: __code const uint8_t *ptr = (__code const uint8_t *)start_addr;
;	iap_flash.c:119: for (uint16_t i = 0; i < length; i++) {
	clr	a
	mov	_IAP_CalculateCRC16_i_20000_28,a
	mov	(_IAP_CalculateCRC16_i_20000_28 + 1),a
00110$:
	clr	c
	mov	a,_IAP_CalculateCRC16_i_20000_28
	subb	a,_IAP_CalculateCRC16_PARM_2
	mov	a,(_IAP_CalculateCRC16_i_20000_28 + 1)
	subb	a,(_IAP_CalculateCRC16_PARM_2 + 1)
	jnc	00105$
;	iap_flash.c:120: uint8_t byte = *ptr++;
	mov	dpl,r6
	mov	dph,r7
	clr	a
	movc	a,@a+dptr
	mov	r1,a
	inc	dptr
	mov	r6,dpl
	mov	r7,dph
;	iap_flash.c:121: crc ^= ((uint16_t)byte << 8);
	mov	ar0,r1
	mov	ar1,r0
	clr	a
	xrl	ar4,a
	mov	a,r1
	xrl	ar5,a
;	iap_flash.c:122: for (uint8_t b = 0; b < 8; b++) {
	mov	r1,#0x00
00107$:
	cjne	r1,#0x08,00152$
00152$:
	jnc	00111$
;	iap_flash.c:123: if (crc & 0x8000) {
	mov	a,r5
	jnb	acc.7,00102$
;	iap_flash.c:124: crc = (crc << 1) ^ 0x1021;
	mov	a,r4
	add	a,r4
	mov	r0,a
	mov	a,r5
	rlc	a
	mov	r3,a
	xrl	ar0,#0x21
	xrl	ar3,#0x10
	mov	ar4,r0
	mov	ar5,r3
	sjmp	00108$
00102$:
;	iap_flash.c:126: crc <<= 1;
	mov	a,r4
	add	a,r4
	mov	r4,a
	mov	a,r5
	rlc	a
	mov	r5,a
00108$:
;	iap_flash.c:122: for (uint8_t b = 0; b < 8; b++) {
	inc	r1
	sjmp	00107$
00111$:
;	iap_flash.c:119: for (uint16_t i = 0; i < length; i++) {
	inc	_IAP_CalculateCRC16_i_20000_28
	clr	a
	cjne	a,_IAP_CalculateCRC16_i_20000_28,00110$
	inc	(_IAP_CalculateCRC16_i_20000_28 + 1)
	sjmp	00110$
00105$:
;	iap_flash.c:130: return crc;
	mov	dpl, r4
	mov	dph, r5
;	iap_flash.c:131: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_Init'
;------------------------------------------------------------
;	usb_hid.c:120: void USB_Init(void) {
;	-----------------------------------------
;	 function USB_Init
;	-----------------------------------------
_USB_Init:
;	usb_hid.c:122: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	usb_hid.c:123: SAFE_MOD = 0xAA;
	mov	_SAFE_MOD,#0xaa
;	usb_hid.c:124: CLOCK_CFG = 0x86; // 24MHz internal clock
	mov	_CLOCK_CFG,#0x86
;	usb_hid.c:125: SAFE_MOD = 0x00;
	mov	_SAFE_MOD,#0x00
;	usb_hid.c:128: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL;
	mov	_USB_CTRL,#0x06
;	usb_hid.c:129: USB_CTRL = 0x00;
	mov	_USB_CTRL,#0x00
;	usb_hid.c:132: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
	mov	_UEP0_DMA_L,#_Ep0Buffer
;	usb_hid.c:133: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
	mov	r6,#_Ep0Buffer
	mov	r7,#(_Ep0Buffer >> 8)
	mov	_UEP0_DMA_H,r7
;	usb_hid.c:135: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
	mov	_UEP1_DMA_L,#_Ep1Buffer
;	usb_hid.c:136: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
	mov	r6,#_Ep1Buffer
	mov	r7,#(_Ep1Buffer >> 8)
	mov	_UEP1_DMA_H,r7
;	usb_hid.c:139: UEP4_1_MOD = 0xC0;
	mov	_UEP4_1_MOD,#0xc0
;	usb_hid.c:140: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
	mov	_UEP1_CTRL,#0x12
;	usb_hid.c:141: UEP1_T_LEN = 0;
	mov	_UEP1_T_LEN,#0x00
;	usb_hid.c:144: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	usb_hid.c:147: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
	mov	_USB_CTRL,#0x29
;	usb_hid.c:148: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN; // Full speed 12Mbps
	mov	_UDEV_CTRL,#0x81
;	usb_hid.c:149: USB_DEV_AD = 0x00;
	mov	_USB_DEV_AD,#0x00
;	usb_hid.c:151: rx_ready = 0;
	mov	_rx_ready,#0x00
;	usb_hid.c:152: usb_dev_addr = 0;
	mov	_usb_dev_addr,#0x00
;	usb_hid.c:153: usb_config = 0;
	mov	_usb_config,#0x00
;	usb_hid.c:154: }
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
;	usb_hid.c:156: static void Handle_EP0_Setup(void) {
;	-----------------------------------------
;	 function Handle_EP0_Setup
;	-----------------------------------------
_Handle_EP0_Setup:
;	usb_hid.c:157: uint8_t req_type = Ep0Buffer[0];
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	mov	r7,a
;	usb_hid.c:158: uint8_t req = Ep0Buffer[1];
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	a,@dptr
	mov	r6,a
;	usb_hid.c:159: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
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
	mov	r5,a
;	usb_hid.c:160: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
	mov	dptr,#(_Ep0Buffer + 0x0006)
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#(_Ep0Buffer + 0x0007)
	movx	a,@dptr
	mov	r2,a
	clr	a
	mov	r1,a
	mov	r0,a
	orl	a,r3
	mov	r3,a
	mov	a,r2
	orl	a,r0
	mov	r2,a
;	usb_hid.c:162: setup_tx_ptr = 0;
	clr	a
	mov	_setup_tx_ptr,a
	mov	(_setup_tx_ptr + 1),a
;	usb_hid.c:163: setup_tx_len = 0;
	mov	_setup_tx_len,a
	mov	(_setup_tx_len + 1),a
;	usb_hid.c:165: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
	mov	a,r7
	anl	a,#0x60
	jz	00234$
	ljmp	00123$
00234$:
;	usb_hid.c:166: switch (req) {
	mov	a,r6
	jnz	00235$
	ljmp	00114$
00235$:
	cjne	r6,#0x05,00236$
	ljmp	00112$
00236$:
	cjne	r6,#0x06,00237$
	sjmp	00101$
00237$:
	cjne	r6,#0x09,00238$
	ljmp	00113$
00238$:
	ljmp	00123$
;	usb_hid.c:167: case USB_GET_DESCRIPTOR:
00101$:
;	usb_hid.c:168: switch (Ep0Buffer[3]) {
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x01,00239$
	sjmp	00102$
00239$:
	cjne	r7,#0x02,00240$
	sjmp	00103$
00240$:
	cjne	r7,#0x03,00241$
	sjmp	00104$
00241$:
	cjne	r7,#0x22,00242$
	sjmp	00110$
00242$:
	ljmp	00123$
;	usb_hid.c:169: case 0x01: // Device Descriptor
00102$:
;	usb_hid.c:170: setup_tx_ptr = DevDesc;
	mov	_setup_tx_ptr,#_DevDesc
	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
;	usb_hid.c:171: setup_tx_len = sizeof(DevDesc);
	mov	_setup_tx_len,#0x12
	mov	(_setup_tx_len + 1),#0x00
;	usb_hid.c:172: break;
	ljmp	00123$
;	usb_hid.c:173: case 0x02: // Configuration Descriptor
00103$:
;	usb_hid.c:174: setup_tx_ptr = CfgDesc;
	mov	_setup_tx_ptr,#_CfgDesc
	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
;	usb_hid.c:175: setup_tx_len = sizeof(CfgDesc);
	mov	_setup_tx_len,#0x29
	mov	(_setup_tx_len + 1),#0x00
;	usb_hid.c:176: break;
;	usb_hid.c:177: case 0x03: // String Descriptor
	sjmp	00123$
00104$:
;	usb_hid.c:178: switch (Ep0Buffer[2]) {
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov  r7,a
	add	a,#0xff - 0x03
	jc	00123$
;	free result
	mov	a,r7
	add	a,r7
;	usb_hid.c:179: case 0: setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); break;
	mov	dptr,#00244$
	jmp	@a+dptr
00244$:
	sjmp	00105$
	sjmp	00106$
	sjmp	00107$
	sjmp	00108$
00105$:
	mov	_setup_tx_ptr,#_Str0Desc
	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
	mov	_setup_tx_len,#0x04
	mov	(_setup_tx_len + 1),#0x00
;	usb_hid.c:180: case 1: setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); break;
	sjmp	00123$
00106$:
	mov	_setup_tx_ptr,#_Str1Desc
	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
	mov	_setup_tx_len,#0x0e
	mov	(_setup_tx_len + 1),#0x00
;	usb_hid.c:181: case 2: setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); break;
	sjmp	00123$
00107$:
	mov	_setup_tx_ptr,#_Str2Desc
	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
	mov	_setup_tx_len,#0x20
	mov	(_setup_tx_len + 1),#0x00
;	usb_hid.c:182: case 3: setup_tx_ptr = Str3Desc; setup_tx_len = sizeof(Str3Desc); break;
	sjmp	00123$
00108$:
	mov	_setup_tx_ptr,#_Str3Desc
	mov	(_setup_tx_ptr + 1),#(_Str3Desc >> 8)
	mov	_setup_tx_len,#0x0a
	mov	(_setup_tx_len + 1),#0x00
;	usb_hid.c:184: break;
;	usb_hid.c:185: case 0x22: // HID Report Descriptor
	sjmp	00123$
00110$:
;	usb_hid.c:186: setup_tx_ptr = ReportDesc;
	mov	_setup_tx_ptr,#_ReportDesc
	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
;	usb_hid.c:187: setup_tx_len = sizeof(ReportDesc);
	mov	_setup_tx_len,#0x22
	mov	(_setup_tx_len + 1),#0x00
;	usb_hid.c:190: break;
;	usb_hid.c:192: case USB_SET_ADDRESS:
	sjmp	00123$
00112$:
;	usb_hid.c:193: usb_dev_addr = (uint8_t)value;
	mov	_usb_dev_addr,r4
;	usb_hid.c:194: break;
;	usb_hid.c:196: case USB_SET_CONFIGURATION:
	sjmp	00123$
00113$:
;	usb_hid.c:197: usb_config = (uint8_t)value;
	mov	_usb_config,r4
;	usb_hid.c:198: break;
;	usb_hid.c:200: case USB_GET_STATUS:
	sjmp	00123$
00114$:
;	usb_hid.c:201: Ep0Buffer[0] = 0x00;
	mov	dptr,#_Ep0Buffer
	clr	a
	movx	@dptr,a
;	usb_hid.c:202: Ep0Buffer[1] = 0x00;
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	@dptr,a
;	usb_hid.c:203: setup_tx_len = 2;
	mov	_setup_tx_len,#0x02
	mov	(_setup_tx_len + 1),a
;	usb_hid.c:212: }
00123$:
;	usb_hid.c:215: if (setup_tx_len > length) {
	clr	c
	mov	a,r3
	subb	a,_setup_tx_len
	mov	a,r2
	subb	a,(_setup_tx_len + 1)
	jnc	00125$
;	free result
;	usb_hid.c:216: setup_tx_len = length;
	mov	_setup_tx_len,r3
	mov	(_setup_tx_len + 1),r2
00125$:
;	usb_hid.c:219: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
	mov	r6,_setup_tx_len
	mov	r7,(_setup_tx_len + 1)
	clr	c
	mov	a,#0x40
	subb	a,r6
	clr	a
	subb	a,r7
	jnc	00131$
;	free result
	mov	r7,#0x40
	sjmp	00132$
00131$:
	mov	r6,_setup_tx_len
	mov	ar7,r6
00132$:
;	usb_hid.c:220: if (setup_tx_ptr && send_len > 0) {
	mov	a,_setup_tx_ptr
	orl	a,(_setup_tx_ptr + 1)
	jz	00127$
	mov	a,r7
	jz	00127$
;	usb_hid.c:221: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
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
;	usb_hid.c:222: setup_tx_ptr += send_len;
	mov	a,r7
	add	a, _setup_tx_ptr
	mov	_setup_tx_ptr,a
	clr	a
	addc	a, (_setup_tx_ptr + 1)
	mov	(_setup_tx_ptr + 1),a
;	usb_hid.c:223: setup_tx_len -= send_len;
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
00127$:
;	usb_hid.c:226: UEP0_T_LEN = send_len;
	mov	_UEP0_T_LEN,r7
;	usb_hid.c:227: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
	mov	_UEP0_CTRL,#0xc0
;	usb_hid.c:228: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_Process'
;------------------------------------------------------------
;token         Allocated to registers r7 
;endp          Allocated to registers r5 
;send_len      Allocated to registers r6 
;------------------------------------------------------------
;	usb_hid.c:230: void USB_Process(void) {
;	-----------------------------------------
;	 function USB_Process
;	-----------------------------------------
_USB_Process:
;	usb_hid.c:231: if (UIF_BUS_RST) {
	jnb	_UIF_BUS_RST,00102$
;	usb_hid.c:232: USB_DEV_AD = 0x00;
	mov	_USB_DEV_AD,#0x00
;	usb_hid.c:233: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	usb_hid.c:234: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
	mov	_UEP1_CTRL,#0x12
;	usb_hid.c:235: UIF_BUS_RST = 0; // Clear reset flag
;	assignBit
	clr	_UIF_BUS_RST
;	usb_hid.c:236: rx_ready = 0;
	mov	_rx_ready,#0x00
;	usb_hid.c:237: return;
	ret
00102$:
;	usb_hid.c:240: if (UIF_TRANSFER) {
	jb	_UIF_TRANSFER,00225$
	ret
00225$:
;	usb_hid.c:241: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
	mov	a,_USB_INT_ST
	anl	a,#0x30
	mov	r7,a
;	usb_hid.c:242: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
	mov	a,_USB_INT_ST
	anl	a,#0x0f
;	usb_hid.c:244: if (endp == 0) { // Endpoint 0
	mov	r5,a
	jz	00226$
	ljmp	00125$
00226$:
;	usb_hid.c:245: if (token == UIS_TOKEN_SETUP) {
	cjne	r7,#0x30,00115$
;	usb_hid.c:246: Handle_EP0_Setup();
	lcall	_Handle_EP0_Setup
	ljmp	00126$
00115$:
;	usb_hid.c:247: } else if (token == UIS_TOKEN_IN) {
	cjne	r7,#0x20,00112$
;	usb_hid.c:248: if (usb_dev_addr != 0 && USB_DEV_AD == 0) {
	mov	a,_usb_dev_addr
	jz	00104$
	mov	a,_USB_DEV_AD
	jnz	00104$
;	usb_hid.c:249: USB_DEV_AD = usb_dev_addr;
	mov	_USB_DEV_AD,_usb_dev_addr
00104$:
;	usb_hid.c:251: if (setup_tx_len > 0) {
	mov	a,_setup_tx_len
	orl	a,(_setup_tx_len + 1)
	jz	00107$
;	usb_hid.c:252: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
	mov	r4,_setup_tx_len
	mov	r6,(_setup_tx_len + 1)
	clr	c
	mov	a,#0x40
	subb	a,r4
	clr	a
	subb	a,r6
	jnc	00131$
;	free result
	mov	r6,#0x40
	sjmp	00132$
00131$:
	mov	r4,_setup_tx_len
	mov	ar6,r4
00132$:
;	usb_hid.c:253: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
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
;	usb_hid.c:254: setup_tx_ptr += send_len;
	mov	a,r6
	add	a, _setup_tx_ptr
	mov	_setup_tx_ptr,a
	clr	a
	addc	a, (_setup_tx_ptr + 1)
	mov	(_setup_tx_ptr + 1),a
;	usb_hid.c:255: setup_tx_len -= send_len;
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
;	usb_hid.c:256: UEP0_T_LEN = send_len;
	mov	_UEP0_T_LEN,r6
;	usb_hid.c:257: UEP0_CTRL ^= bUEP_T_TOG;
	xrl	_UEP0_CTRL,#0x40
;	usb_hid.c:258: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
	anl	_UEP0_CTRL,#0xfc
	sjmp	00126$
00107$:
;	usb_hid.c:260: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	usb_hid.c:261: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
	sjmp	00126$
00112$:
;	usb_hid.c:263: } else if (token == UIS_TOKEN_OUT) {
	mov	a,r7
	jnz	00126$
;	usb_hid.c:264: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
	sjmp	00126$
00125$:
;	usb_hid.c:266: } else if (endp == 1) { // Endpoint 1 (HID Data)
	cjne	r5,#0x01,00126$
;	usb_hid.c:267: if (token == UIS_TOKEN_OUT) {
	mov	a,r7
	jnz	00120$
;	usb_hid.c:268: rx_ready = 1;
	mov	_rx_ready,#0x01
;	usb_hid.c:269: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_NAK;
	mov	a,#0xf3
	anl	a,_UEP1_CTRL
	orl	a,#0x08
	mov	_UEP1_CTRL,a
	sjmp	00126$
00120$:
;	usb_hid.c:270: } else if (token == UIS_TOKEN_IN) {
	cjne	r7,#0x20,00126$
;	usb_hid.c:271: UEP1_T_LEN = 0;
	mov	_UEP1_T_LEN,#0x00
;	usb_hid.c:272: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
	mov	a,#0xfc
	anl	a,_UEP1_CTRL
	orl	a,#0x02
	mov	_UEP1_CTRL,a
00126$:
;	usb_hid.c:276: UIF_TRANSFER = 0; // Clear transfer flag
;	assignBit
	clr	_UIF_TRANSFER
;	usb_hid.c:278: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_Available'
;------------------------------------------------------------
;	usb_hid.c:280: uint8_t USB_Available(void) {
;	-----------------------------------------
;	 function USB_Available
;	-----------------------------------------
_USB_Available:
;	usb_hid.c:281: return rx_ready;
	mov	dpl, _rx_ready
;	usb_hid.c:282: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_GetRxBuffer'
;------------------------------------------------------------
;	usb_hid.c:284: uint8_t *USB_GetRxBuffer(void) {
;	-----------------------------------------
;	 function USB_GetRxBuffer
;	-----------------------------------------
_USB_GetRxBuffer:
;	usb_hid.c:285: return &Ep1Buffer[0];
	mov	dptr,#_Ep1Buffer
	mov	b, #0x00
;	usb_hid.c:286: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_ReleaseRx'
;------------------------------------------------------------
;	usb_hid.c:288: void USB_ReleaseRx(void) {
;	-----------------------------------------
;	 function USB_ReleaseRx
;	-----------------------------------------
_USB_ReleaseRx:
;	usb_hid.c:289: rx_ready = 0;
	mov	_rx_ready,#0x00
;	usb_hid.c:290: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_ACK;
	anl	_UEP1_CTRL,#0xf3
;	usb_hid.c:291: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_SendReport'
;------------------------------------------------------------
;len           Allocated with name '_USB_SendReport_PARM_2'
;buf           Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	usb_hid.c:293: void USB_SendReport(const uint8_t *buf, uint8_t len) {
;	-----------------------------------------
;	 function USB_SendReport
;	-----------------------------------------
_USB_SendReport:
	mov	r5, dpl
	mov	r6, dph
	mov	r7, b
;	usb_hid.c:294: memcpy(&Ep1Buffer[64], buf, len);
	mov	___memcpy_PARM_2,r5
	mov	(___memcpy_PARM_2 + 1),r6
	mov	(___memcpy_PARM_2 + 2),r7
	mov	___memcpy_PARM_3,_USB_SendReport_PARM_2
	mov	(___memcpy_PARM_3 + 1),#0x00
	mov	dptr,#(_Ep1Buffer + 0x0040)
	mov	b, #0x00
	lcall	___memcpy
;	usb_hid.c:295: UEP1_T_LEN = len;
	mov	_UEP1_T_LEN,_USB_SendReport_PARM_2
;	usb_hid.c:296: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
	anl	_UEP1_CTRL,#0xfc
;	usb_hid.c:297: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_Shutdown'
;------------------------------------------------------------
;	usb_hid.c:299: void USB_Shutdown(void) {
;	-----------------------------------------
;	 function USB_Shutdown
;	-----------------------------------------
_USB_Shutdown:
;	usb_hid.c:300: USB_CTRL = 0x00;
	mov	_USB_CTRL,#0x00
;	usb_hid.c:301: UDEV_CTRL = 0x00;
	mov	_UDEV_CTRL,#0x00
;	usb_hid.c:302: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'DelayMs'
;------------------------------------------------------------
;ms            Allocated to registers 
;i             Allocated to registers r4 r5 
;------------------------------------------------------------
;	bootloader.c:31: static void DelayMs(uint16_t ms) {
;	-----------------------------------------
;	 function DelayMs
;	-----------------------------------------
_DelayMs:
	mov	r6, dpl
	mov	r7, dph
;	bootloader.c:32: while (ms--) {
00102$:
	mov	ar4,r6
	mov	ar5,r7
	dec	r6
	cjne	r6,#0xff,00139$
	dec	r7
00139$:
	mov	a,r4
	orl	a,r5
	jz	00108$
;	bootloader.c:33: for (uint16_t i = 0; i < 2400; i++) {
	mov	r4,#0x00
	mov	r5,#0x00
00106$:
	mov	ar2,r4
	mov	ar3,r5
	clr	c
	mov	a,r2
	subb	a,#0x60
	mov	a,r3
	subb	a,#0x09
	jnc	00102$
;	bootloader.c:34: __asm nop __endasm;
	nop	
;	bootloader.c:33: for (uint16_t i = 0; i < 2400; i++) {
	inc	r4
	cjne	r4,#0x00,00106$
	inc	r5
	sjmp	00106$
00108$:
;	bootloader.c:37: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'JumpToApp'
;------------------------------------------------------------
;	bootloader.c:39: static void JumpToApp(void) {
;	-----------------------------------------
;	 function JumpToApp
;	-----------------------------------------
_JumpToApp:
;	bootloader.c:40: USB_Shutdown();
	lcall	_USB_Shutdown
;	bootloader.c:41: DelayMs(10);
	mov	dptr,#0x000a
	lcall	_DelayMs
;	bootloader.c:45: __endasm;
	ljmp 0x0000
;	bootloader.c:46: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ProcessPacket'
;------------------------------------------------------------
;rx            Allocated with name '_ProcessPacket_rx_10000_126'
;cmd           Allocated with name '_ProcessPacket_cmd_10000_126'
;seq           Allocated with name '_ProcessPacket_seq_10000_126'
;addr          Allocated with name '_ProcessPacket_addr_10000_126'
;len           Allocated with name '_ProcessPacket_len_10000_126'
;erase_err     Allocated with name '_ProcessPacket_erase_err_40000_136'
;page          Allocated to registers r0 r2 
;end_page      Allocated with name '_ProcessPacket_end_page_40000_136'
;err           Allocated with name '_ProcessPacket_err_40000_144'
;i             Allocated with name '_ProcessPacket_i_50000_145'
;word          Allocated to registers 
;expected_crc  Allocated to registers r4 r7 
;calc_crc      Allocated to registers r5 r6 
;sloc0         Allocated with name '_ProcessPacket_sloc0_1_0'
;sloc1         Allocated with name '_ProcessPacket_sloc1_1_0'
;sloc2         Allocated with name '_ProcessPacket_sloc2_1_0'
;------------------------------------------------------------
;	bootloader.c:48: static void ProcessPacket(void) {
;	-----------------------------------------
;	 function ProcessPacket
;	-----------------------------------------
_ProcessPacket:
;	bootloader.c:49: uint8_t *rx = USB_GetRxBuffer();
	lcall	_USB_GetRxBuffer
;	bootloader.c:50: uint8_t cmd = rx[0];
	mov	_ProcessPacket_rx_10000_126,dpl
	mov	(_ProcessPacket_rx_10000_126 + 1),dph
	mov	(_ProcessPacket_rx_10000_126 + 2),b
	lcall	__gptrget
	mov	_ProcessPacket_cmd_10000_126,a
;	bootloader.c:51: uint8_t seq = rx[1];
	mov	a,#0x01
	add	a, _ProcessPacket_rx_10000_126
	mov	r1,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r2,a
	mov	r3,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	_ProcessPacket_seq_10000_126,a
;	bootloader.c:52: uint16_t addr = rx[2] | ((uint16_t)rx[3] << 8);
	mov	a,#0x02
	add	a, _ProcessPacket_rx_10000_126
	mov	r0,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r2,a
	mov	r3,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r0
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	_ProcessPacket_sloc0_1_0,a
	mov	a,#0x03
	add	a, _ProcessPacket_rx_10000_126
	mov	_ProcessPacket_sloc2_1_0,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	(_ProcessPacket_sloc2_1_0 + 1),a
	mov	(_ProcessPacket_sloc2_1_0 + 2),(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,_ProcessPacket_sloc2_1_0
	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
	lcall	__gptrget
	mov	r1,a
	mov	r5,#0x00
	mov	(_ProcessPacket_sloc1_1_0 + 1),r1
	mov	_ProcessPacket_sloc1_1_0,r5
	mov	r1,_ProcessPacket_sloc0_1_0
	mov	_ProcessPacket_addr_10000_126,r1
	mov	a,(_ProcessPacket_sloc1_1_0 + 1)
	orl	a,r5
	mov	(_ProcessPacket_addr_10000_126 + 1),a
;	bootloader.c:53: uint8_t len = rx[4];
	mov	a,#0x04
	add	a, _ProcessPacket_rx_10000_126
	mov	r1,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r5,a
	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r1
	mov	dph,r5
	mov	b,r7
	lcall	__gptrget
	mov	_ProcessPacket_len_10000_126,a
;	bootloader.c:55: memset(reply_buf, 0, 64);
	mov	_memset_PARM_2,#0x00
	mov	_memset_PARM_3,#0x40
	mov	(_memset_PARM_3 + 1),#0x00
	mov	dptr,#_reply_buf
	mov	b, #0x00
	push	ar3
	push	ar2
	push	ar0
	lcall	_memset
	pop	ar0
	pop	ar2
	pop	ar3
;	bootloader.c:56: reply_buf[0] = cmd;
	mov	dptr,#_reply_buf
	mov	a,_ProcessPacket_cmd_10000_126
	movx	@dptr,a
;	bootloader.c:57: reply_buf[1] = seq;
	mov	dptr,#(_reply_buf + 0x0001)
	mov	a,_ProcessPacket_seq_10000_126
	movx	@dptr,a
;	bootloader.c:58: reply_buf[2] = rx[2];
	mov	dpl,r0
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	r0,a
	mov	dptr,#(_reply_buf + 0x0002)
	movx	@dptr,a
;	bootloader.c:59: reply_buf[3] = rx[3];
	mov	dpl,_ProcessPacket_sloc2_1_0
	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#(_reply_buf + 0x0003)
	movx	@dptr,a
;	bootloader.c:60: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
;	bootloader.c:62: switch (cmd) {
	mov	a,_ProcessPacket_cmd_10000_126
	add	a,#0xff - 0x06
	jnc	00259$
	ljmp	00129$
00259$:
;	free result
	mov	a,_ProcessPacket_cmd_10000_126
	mov	b,#0x03
	mul	ab
	mov	dptr,#00260$
	jmp	@a+dptr
00260$:
	ljmp	00129$
	ljmp	00101$
	ljmp	00102$
	ljmp	00129$
	ljmp	00109$
	ljmp	00127$
	ljmp	00128$
;	bootloader.c:63: case CMD_HELLO:
00101$:
;	bootloader.c:64: reply_buf[4] = 0x52; // Chip ID: CH552
	mov	dptr,#(_reply_buf + 0x0004)
	mov	a,#0x52
	movx	@dptr,a
;	bootloader.c:65: reply_buf[5] = 0x01; // Bootloader v1.0
	mov	dptr,#(_reply_buf + 0x0005)
	mov	a,#0x01
	movx	@dptr,a
;	bootloader.c:66: reply_buf[6] = (uint8_t)(USER_FLASH_END & 0xFF);
	mov	dptr,#(_reply_buf + 0x0006)
	mov	a,#0xff
	movx	@dptr,a
;	bootloader.c:67: reply_buf[7] = (uint8_t)((USER_FLASH_END >> 8) & 0xFF); // 11 KB usable
	mov	dptr,#(_reply_buf + 0x0007)
	mov	a,#0x2b
	movx	@dptr,a
;	bootloader.c:68: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
;	bootloader.c:69: break;
	ljmp	00130$
;	bootloader.c:71: case CMD_UNLOCK:
00102$:
;	bootloader.c:72: if (rx[5] == 0x5A && rx[6] == 0xC3 && rx[7] == 0x3C && rx[8] == 0xA5) {
	mov	a,#0x05
	add	a, _ProcessPacket_rx_10000_126
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x5a,00104$
	mov	a,#0x06
	add	a, _ProcessPacket_rx_10000_126
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0xc3,00104$
	mov	a,#0x07
	add	a, _ProcessPacket_rx_10000_126
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x3c,00104$
	mov	a,#0x08
	add	a, _ProcessPacket_rx_10000_126
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0xa5,00104$
;	bootloader.c:73: is_unlocked = 1;
	mov	_is_unlocked,#0x01
;	bootloader.c:74: last_erased_page = 0xFFFF; // Reset page erase tracking for new session
	mov	_last_erased_page,#0xff
	mov	(_last_erased_page + 1),#0xff
;	bootloader.c:75: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
	ljmp	00130$
00104$:
;	bootloader.c:77: is_unlocked = 0;
	mov	_is_unlocked,#0x00
;	bootloader.c:78: reply_buf[59] = STATUS_LOCKED;
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0x02
	movx	@dptr,a
;	bootloader.c:80: break;
	ljmp	00130$
;	bootloader.c:82: case CMD_WRITE_BLOCK:
00109$:
;	bootloader.c:83: if (!is_unlocked) {
	mov	a,_is_unlocked
	jnz	00111$
;	bootloader.c:84: reply_buf[59] = STATUS_LOCKED;
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0x02
	movx	@dptr,a
;	bootloader.c:85: break;
	ljmp	00130$
00111$:
;	bootloader.c:88: if (addr + len > BOOTLOADER_START) {
	mov	r5,_ProcessPacket_len_10000_126
	mov	r6,#0x00
	mov	r1,_ProcessPacket_addr_10000_126
	mov	r4,(_ProcessPacket_addr_10000_126 + 1)
	mov	a,r5
	add	a, r1
	mov	r2,a
	mov	a,r6
	addc	a, r4
	mov	r3,a
	clr	c
	clr	a
	subb	a,r2
	mov	a,#0x2c
	subb	a,r3
	jnc	00113$
;	free result
;	bootloader.c:89: reply_buf[59] = STATUS_OOB; // Protect bootloader
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0x03
	movx	@dptr,a
;	bootloader.c:90: break;
	ljmp	00130$
00113$:
;	bootloader.c:95: uint8_t erase_err = 0;
;	bootloader.c:96: uint16_t page = addr & ~0x03FF;
	clr	a
	mov	_ProcessPacket_erase_err_40000_136,a
	mov	r0,a
	mov	a,#0xfc
	anl	a,r4
	mov	r2,a
;	bootloader.c:97: uint16_t end_page = (addr + len - 1) & ~0x03FF;
	mov	a,r5
	add	a, r1
	mov	r5,a
	mov	a,r6
	addc	a, r4
	mov	r6,a
	dec	r5
	cjne	r5,#0xff,00271$
	dec	r6
00271$:
	mov	r5,#0x00
	anl	ar6,#0xfc
	mov	_ProcessPacket_end_page_40000_136,r5
	mov	(_ProcessPacket_end_page_40000_136 + 1),r6
;	bootloader.c:98: while (page <= end_page) {
00119$:
	clr	c
	mov	a,_ProcessPacket_end_page_40000_136
	subb	a,r0
	mov	a,(_ProcessPacket_end_page_40000_136 + 1)
	subb	a,r2
	jc	00121$
;	free result
;	bootloader.c:99: if (last_erased_page == 0xFFFF || page > last_erased_page) {
	mov	r3,_last_erased_page
	mov	r6,(_last_erased_page + 1)
	cjne	r3,#0xff,00273$
	cjne	r6,#0xff,00273$
	sjmp	00116$
00273$:
	clr	c
	mov	a,_last_erased_page
	subb	a,r0
	mov	a,(_last_erased_page + 1)
	subb	a,r2
	jnc	00117$
;	free result
00116$:
;	bootloader.c:100: if (IAP_ErasePage(page) != 0) {
	mov	dpl, r0
	mov	dph, r2
	push	ar4
	push	ar2
	push	ar1
	push	ar0
	lcall	_IAP_ErasePage
	mov	a, dpl
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar4
	jz	00115$
;	bootloader.c:101: erase_err = 1;
	mov	_ProcessPacket_erase_err_40000_136,#0x01
;	bootloader.c:102: break;
	sjmp	00121$
00115$:
;	bootloader.c:104: last_erased_page = page;
	mov	_last_erased_page,r0
	mov	(_last_erased_page + 1),r2
00117$:
;	bootloader.c:106: page += 0x0400;
	mov	ar5,r0
	mov	ar6,r2
	mov	a,#0x04
	add	a, r6
	mov	r6,a
	mov	ar0,r5
	mov	ar2,r6
	sjmp	00119$
00121$:
;	bootloader.c:108: if (erase_err) {
	mov	a,_ProcessPacket_erase_err_40000_136
	jz	00123$
;	bootloader.c:109: reply_buf[59] = STATUS_WRITE_ERR;
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0x04
	movx	@dptr,a
;	bootloader.c:110: break;
	ljmp	00130$
00123$:
;	bootloader.c:116: uint8_t err = 0;
	mov	_ProcessPacket_err_40000_144,#0x00
;	bootloader.c:117: for (uint8_t i = 0; i < len; i += 2) {
	mov	_ProcessPacket_i_50000_145,#0x00
00132$:
	clr	c
	mov	a,_ProcessPacket_i_50000_145
	subb	a,_ProcessPacket_len_10000_126
	jnc	00126$
;	bootloader.c:118: uint16_t word = rx[5 + i] | ((uint16_t)rx[6 + i] << 8);
	mov	r2,_ProcessPacket_i_50000_145
	mov	r3,#0x00
	mov	a,#0x05
	add	a, r2
	mov	r0,a
	clr	a
	addc	a, r3
	mov	r6,a
	mov	a,r0
	add	a, _ProcessPacket_rx_10000_126
	mov	r0,a
	mov	a,r6
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r6,a
	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r0
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r0,a
	mov	a,#0x06
	add	a, r2
	mov	r6,a
	clr	a
	addc	a, r3
	mov	r7,a
	mov	a,r6
	add	a, _ProcessPacket_rx_10000_126
	mov	r6,a
	mov	a,r7
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r5,a
	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r6
	mov	dph,r5
	mov	b,r7
	lcall	__gptrget
	mov	r7,a
	clr	a
	mov	r5,a
	orl	a,r0
	mov	_IAP_WriteWord_PARM_2,a
	mov	a,r7
	orl	a,r5
	mov	(_IAP_WriteWord_PARM_2 + 1),a
;	bootloader.c:119: if (IAP_WriteWord(addr + i, word) != 0) {
	mov	a,r2
	add	a, r1
	mov	r2,a
	mov	a,r3
	addc	a, r4
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	push	ar4
	push	ar1
	lcall	_IAP_WriteWord
	mov	a, dpl
	pop	ar1
	pop	ar4
	jz	00133$
;	bootloader.c:120: err = 1;
	mov	_ProcessPacket_err_40000_144,#0x01
;	bootloader.c:121: break;
	sjmp	00126$
00133$:
;	bootloader.c:117: for (uint8_t i = 0; i < len; i += 2) {
	mov	r5,_ProcessPacket_i_50000_145
	mov	a,#0x02
	add	a, r5
	mov	_ProcessPacket_i_50000_145,a
	sjmp	00132$
00126$:
;	bootloader.c:124: reply_buf[59] = err ? STATUS_WRITE_ERR : STATUS_OK;
	mov	a,_ProcessPacket_err_40000_144
	jz	00136$
	mov	a,#0x04
00136$:
	mov	dptr,#(_reply_buf + 0x003b)
	movx	@dptr,a
;	bootloader.c:126: break;
	ljmp	00130$
;	bootloader.c:128: case CMD_VERIFY_CRC:
00127$:
;	bootloader.c:130: uint16_t expected_crc = rx[5] | ((uint16_t)rx[6] << 8);
	mov	a,#0x05
	add	a, _ProcessPacket_rx_10000_126
	mov	r5,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r6,a
	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,#0x06
	add	a, _ProcessPacket_rx_10000_126
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_126 + 1)
	mov	r6,a
	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
	mov	dpl,r4
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r7,a
	clr	a
	mov	r4,a
	mov	r6,a
	mov	a,r5
	orl	ar4,a
	mov	a,r6
	orl	ar7,a
;	bootloader.c:131: uint16_t calc_crc = IAP_CalculateCRC16(0x0000, addr);
	mov	_IAP_CalculateCRC16_PARM_2,_ProcessPacket_addr_10000_126
	mov	(_IAP_CalculateCRC16_PARM_2 + 1),(_ProcessPacket_addr_10000_126 + 1)
	mov	dptr,#0x0000
	push	ar7
	push	ar4
	lcall	_IAP_CalculateCRC16
	mov	r5, dpl
	mov	r6, dph
	pop	ar4
	pop	ar7
;	bootloader.c:132: reply_buf[4] = (uint8_t)(calc_crc & 0xFF);
	mov	ar3,r5
	mov	dptr,#(_reply_buf + 0x0004)
	mov	a,r3
	movx	@dptr,a
;	bootloader.c:133: reply_buf[5] = (uint8_t)((calc_crc >> 8) & 0xFF);
	mov	ar3,r6
	mov	dptr,#(_reply_buf + 0x0005)
	mov	a,r3
	movx	@dptr,a
;	bootloader.c:134: reply_buf[59] = (calc_crc == expected_crc) ? STATUS_OK : STATUS_BAD_CRC;
	mov	a,r5
	cjne	a,ar4,00138$
	mov	a,r6
	cjne	a,ar7,00138$
	mov	r7,#0x00
	sjmp	00139$
00138$:
	mov	r7,#0x01
00139$:
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,r7
	movx	@dptr,a
;	bootloader.c:136: break;
;	bootloader.c:138: case CMD_REBOOT:
	sjmp	00130$
00128$:
;	bootloader.c:139: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
;	bootloader.c:140: USB_SendReport(reply_buf, 64);
	mov	_USB_SendReport_PARM_2,#0x40
	mov	dptr,#_reply_buf
	mov	b,a
	lcall	_USB_SendReport
;	bootloader.c:141: DelayMs(50);
	mov	dptr,#0x0032
	lcall	_DelayMs
;	bootloader.c:142: JumpToApp();
;	bootloader.c:143: return;
;	bootloader.c:145: default:
	ljmp	_JumpToApp
00129$:
;	bootloader.c:146: reply_buf[59] = STATUS_UNKNOWN;
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0xff
	movx	@dptr,a
;	bootloader.c:148: }
00130$:
;	bootloader.c:150: USB_SendReport(reply_buf, 64);
	mov	_USB_SendReport_PARM_2,#0x40
	mov	dptr,#_reply_buf
	mov	b, #0x00
	lcall	_USB_SendReport
;	bootloader.c:151: USB_ReleaseRx();
;	bootloader.c:152: }
	ljmp	_USB_ReleaseRx
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;button_pressed Allocated to registers r7 
;first_word    Allocated to registers r5 r6 
;vec_word      Allocated to registers r3 r4 
;is_blank      Allocated to registers r6 
;timeout       Allocated to registers 
;stay_in_bootloader Allocated to registers r7 
;------------------------------------------------------------
;	bootloader.c:154: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	bootloader.c:156: P3_MOD_OC &= ~(1 << BOOT_PIN_BIT); // Quasi-bidirectional / pull-up mode
	anl	_P3_MOD_OC,#0xfb
;	bootloader.c:157: P3_DIR_PU |=  (1 << BOOT_PIN_BIT); // Enable pullup
	orl	_P3_DIR_PU,#0x04
;	bootloader.c:158: P3_2 = 1; // High impedance input read
;	assignBit
	setb	_P3_2
;	bootloader.c:161: P1_MOD_OC &= ~(1 << 5);
	anl	_P1_MOD_OC,#0xdf
;	bootloader.c:162: P1_DIR_PU |=  (1 << 5);
	orl	_P1_DIR_PU,#0x20
;	bootloader.c:163: P1_5 = 1;
;	assignBit
	setb	_P1_5
;	bootloader.c:166: uint8_t button_pressed = (P3_2 == 0) || (P1_5 == 0);
	jnb	_P3_2,00113$
	jnb	_P1_5,00113$
;	assignBit
	clr	_main_sloc0_1_0
	sjmp	00114$
00113$:
;	assignBit
	setb	_main_sloc0_1_0
00114$:
	mov	c,_main_sloc0_1_0
	clr	a
	rlc	a
	mov	r7,a
;	bootloader.c:169: uint16_t first_word = IAP_ReadWord(0x0000);
	mov	dptr,#0x0000
	push	ar7
	lcall	_IAP_ReadWord
	mov	r5, dpl
	mov	r6, dph
;	bootloader.c:170: uint16_t vec_word   = IAP_ReadWord(0x0008);
	mov	dptr,#0x0008
	push	ar6
	push	ar5
	lcall	_IAP_ReadWord
	mov	r3, dpl
	mov	r4, dph
	pop	ar5
	pop	ar6
	pop	ar7
;	bootloader.c:171: uint8_t is_blank = (first_word == 0xFFFF) || (vec_word == 0xFFFF);
	cjne	r5,#0xff,00193$
	cjne	r6,#0xff,00193$
	sjmp	00116$
00193$:
	cjne	r3,#0xff,00194$
	cjne	r4,#0xff,00194$
	sjmp	00116$
00194$:
;	assignBit
	clr	_main_sloc0_1_0
	sjmp	00117$
00116$:
;	assignBit
	setb	_main_sloc0_1_0
00117$:
	mov	c,_main_sloc0_1_0
	clr	a
	rlc	a
	mov	r6,a
;	bootloader.c:174: USB_Init();
	push	ar7
	push	ar6
	lcall	_USB_Init
	pop	ar6
	pop	ar7
;	bootloader.c:178: uint8_t stay_in_bootloader = button_pressed || is_blank;
	mov	a,r7
	jnz	00119$
	mov	a,r6
	jnz	00119$
;	assignBit
	clr	_main_sloc0_1_0
	sjmp	00120$
00119$:
;	assignBit
	setb	_main_sloc0_1_0
00120$:
	mov	c,_main_sloc0_1_0
	clr	a
	rlc	a
	mov	r7,a
;	bootloader.c:180: while (1) {
	mov	r3,#0x00
	mov	r4,#0x00
	mov	r5,#0x00
	mov	r6,#0x00
00108$:
;	bootloader.c:181: USB_Process();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_USB_Process
;	bootloader.c:183: if (USB_Available()) {
	lcall	_USB_Available
	mov	a, dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00102$
;	bootloader.c:184: stay_in_bootloader = 1; // Handshake received, cancel timeout
	mov	r7,#0x01
;	bootloader.c:185: ProcessPacket();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_ProcessPacket
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
00102$:
;	bootloader.c:188: if (!stay_in_bootloader) {
	mov	a,r7
	jnz	00108$
;	bootloader.c:189: timeout++;
	inc	r3
	cjne	r3,#0x00,00199$
	inc	r4
	cjne	r4,#0x00,00199$
	inc	r5
	cjne	r5,#0x00,00199$
	inc	r6
00199$:
;	bootloader.c:190: if (timeout > 2000000UL) { // ~4.0s timeout at 24MHz
	clr	c
	mov	a,#0x80
	subb	a,r3
	mov	a,#0x84
	subb	a,r4
	mov	a,#0x1e
	subb	a,r5
	clr	a
	subb	a,r6
	jnc	00108$
;	free result
;	bootloader.c:191: JumpToApp();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_JumpToApp
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	bootloader.c:195: }
	ljmp	00108$
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
	.db #0x03	; 3
	.db #0x01	; 1
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ReportDesc:
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x95	; 149
	.db #0x40	; 64
	.db #0x91	; 145
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x95	; 149
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0xc0	; 192
	.area CSEG    (CODE)
	.area CONST   (CODE)
_CfgDesc:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x01	; 1
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
	.db #0x20	; 32
	.db #0x03	; 3
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x6e	; 110	'n'
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
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
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.area CSEG    (CODE)
	.area CONST   (CODE)
_Str3Desc:
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
