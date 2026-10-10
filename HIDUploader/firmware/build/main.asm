;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (MINGW64)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _memset
	.globl _IAP_CalculateCRC16
	.globl _IAP_ReadWord
	.globl _IAP_WriteWord
	.globl _USB_Shutdown
	.globl _USB_SendReport
	.globl _USB_ReleaseRx
	.globl _USB_GetRxBuffer
	.globl _USB_Available
	.globl _USB_Process
	.globl _USB_Init
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P3_7
	.globl _P3_6
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _UEP1_DMA_H
	.globl _UEP1_DMA_L
	.globl _UEP0_DMA_H
	.globl _UEP0_DMA_L
	.globl _UEP2_3_MOD
	.globl _UEP4_1_MOD
	.globl _USB_INT_ST
	.globl _USB_INT_FG
	.globl _USB_MIS_ST
	.globl _USB_FBVAL
	.globl _USB_DEV_AD
	.globl _USB_INT_EN
	.globl _UDEV_CTRL
	.globl _USB_CTRL
	.globl _B
	.globl _UEP3_CTRL
	.globl _UEP2_T_LEN
	.globl _UEP2_CTRL
	.globl _UEP1_T_LEN
	.globl _UEP1_CTRL
	.globl _ACC
	.globl _CLOCK_CFG
	.globl _USB_C_CTRL
	.globl _PSW
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2MOD
	.globl _T2CON
	.globl _WDT_ACT
	.globl _RESET_KEEP
	.globl _WDOG_WAIT
	.globl _IP
	.globl _P3_PU
	.globl _P3_DIR
	.globl _GLOBAL_CFG
	.globl _P3
	.globl _IE
	.globl _SAFE_MOD
	.globl _P2
	.globl _P3_MOD_OC
	.globl _P1_MOD_OC
	.globl _SBUF
	.globl _SCON
	.globl _P1_PU
	.globl _P1_DIR
	.globl _P1
	.globl _ROM_DATA_H
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _ROM_STATUS
	.globl _ROM_CTRL
	.globl _ROM_DATA_L
	.globl _ROM_ADDR_H
	.globl _ROM_ADDR_L
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_ROM_ADDR_L	=	0x0084
_ROM_ADDR_H	=	0x0085
_ROM_DATA_L	=	0x0086
_ROM_CTRL	=	0x0086
_ROM_STATUS	=	0x0086
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_ROM_DATA_H	=	0x008e
_P1	=	0x0090
_P1_DIR	=	0x0091
_P1_PU	=	0x0092
_SCON	=	0x0098
_SBUF	=	0x0099
_P1_MOD_OC	=	0x009a
_P3_MOD_OC	=	0x009b
_P2	=	0x00a0
_SAFE_MOD	=	0x00a1
_IE	=	0x00a8
_P3	=	0x00b0
_GLOBAL_CFG	=	0x00b1
_P3_DIR	=	0x00b2
_P3_PU	=	0x00b3
_IP	=	0x00b8
_WDOG_WAIT	=	0x00c0
_RESET_KEEP	=	0x00c6
_WDT_ACT	=	0x00c7
_T2CON	=	0x00c8
_T2MOD	=	0x00c9
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_PSW	=	0x00d0
_USB_C_CTRL	=	0x00d1
_CLOCK_CFG	=	0x00d8
_ACC	=	0x00e0
_UEP1_CTRL	=	0x00eb
_UEP1_T_LEN	=	0x00ec
_UEP2_CTRL	=	0x00ed
_UEP2_T_LEN	=	0x00ee
_UEP3_CTRL	=	0x00ef
_B	=	0x00f0
_USB_CTRL	=	0x00f1
_UDEV_CTRL	=	0x00f2
_USB_INT_EN	=	0x00f3
_USB_DEV_AD	=	0x00f4
_USB_FBVAL	=	0x00f5
_USB_MIS_ST	=	0x00f6
_USB_INT_FG	=	0x00f7
_USB_INT_ST	=	0x00f8
_UEP4_1_MOD	=	0x00f9
_UEP2_3_MOD	=	0x00fa
_UEP0_DMA_L	=	0x00fb
_UEP0_DMA_H	=	0x00fc
_UEP1_DMA_L	=	0x00fd
_UEP1_DMA_H	=	0x00fe
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_is_unlocked:
	.ds 1
_ProcessPacket_rx_10000_46:
	.ds 3
_ProcessPacket_cmd_10000_46:
	.ds 1
_ProcessPacket_seq_10000_46:
	.ds 1
_ProcessPacket_addr_10000_46:
	.ds 2
_ProcessPacket_len_10000_46:
	.ds 1
_ProcessPacket_err_40000_56:
	.ds 1
_ProcessPacket_i_50000_57:
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
;	src/main.c:23: static uint8_t is_unlocked = 0;
	mov	_is_unlocked,#0x00
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
;Allocation info for local variables in function 'DelayMs'
;------------------------------------------------------------
;ms            Allocated to registers 
;i             Allocated to registers r4 r5 
;------------------------------------------------------------
;	src/main.c:26: static void DelayMs(uint16_t ms) {
;	-----------------------------------------
;	 function DelayMs
;	-----------------------------------------
_DelayMs:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r6, dpl
	mov	r7, dph
;	src/main.c:27: while (ms--) {
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
;	src/main.c:28: for (uint16_t i = 0; i < 2400; i++) {
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
;	src/main.c:29: __asm nop __endasm;
	nop	
;	src/main.c:28: for (uint16_t i = 0; i < 2400; i++) {
	inc	r4
	cjne	r4,#0x00,00106$
	inc	r5
	sjmp	00106$
00108$:
;	src/main.c:32: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'JumpToApp'
;------------------------------------------------------------
;	src/main.c:34: static void JumpToApp(void) {
;	-----------------------------------------
;	 function JumpToApp
;	-----------------------------------------
_JumpToApp:
;	src/main.c:35: USB_Shutdown();
	lcall	_USB_Shutdown
;	src/main.c:36: DelayMs(10);
	mov	dptr,#0x000a
	lcall	_DelayMs
;	src/main.c:40: __endasm;
	ljmp 0x0000
;	src/main.c:41: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ProcessPacket'
;------------------------------------------------------------
;rx            Allocated with name '_ProcessPacket_rx_10000_46'
;cmd           Allocated with name '_ProcessPacket_cmd_10000_46'
;seq           Allocated with name '_ProcessPacket_seq_10000_46'
;addr          Allocated with name '_ProcessPacket_addr_10000_46'
;len           Allocated with name '_ProcessPacket_len_10000_46'
;err           Allocated with name '_ProcessPacket_err_40000_56'
;i             Allocated with name '_ProcessPacket_i_50000_57'
;word          Allocated to registers 
;expected_crc  Allocated to registers r4 r7 
;calc_crc      Allocated to registers r5 r6 
;sloc0         Allocated with name '_ProcessPacket_sloc0_1_0'
;sloc1         Allocated with name '_ProcessPacket_sloc1_1_0'
;sloc2         Allocated with name '_ProcessPacket_sloc2_1_0'
;------------------------------------------------------------
;	src/main.c:43: static void ProcessPacket(void) {
;	-----------------------------------------
;	 function ProcessPacket
;	-----------------------------------------
_ProcessPacket:
;	src/main.c:44: uint8_t *rx = USB_GetRxBuffer();
	lcall	_USB_GetRxBuffer
;	src/main.c:45: uint8_t cmd = rx[0];
	mov	_ProcessPacket_rx_10000_46,dpl
	mov	(_ProcessPacket_rx_10000_46 + 1),dph
	mov	(_ProcessPacket_rx_10000_46 + 2),b
	lcall	__gptrget
	mov	_ProcessPacket_cmd_10000_46,a
;	src/main.c:46: uint8_t seq = rx[1];
	mov	a,#0x01
	add	a, _ProcessPacket_rx_10000_46
	mov	r1,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r2,a
	mov	r3,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	_ProcessPacket_seq_10000_46,a
;	src/main.c:47: uint16_t addr = rx[2] | ((uint16_t)rx[3] << 8);
	mov	a,#0x02
	add	a, _ProcessPacket_rx_10000_46
	mov	r0,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r2,a
	mov	r3,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r0
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	_ProcessPacket_sloc0_1_0,a
	mov	a,#0x03
	add	a, _ProcessPacket_rx_10000_46
	mov	_ProcessPacket_sloc2_1_0,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	(_ProcessPacket_sloc2_1_0 + 1),a
	mov	(_ProcessPacket_sloc2_1_0 + 2),(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,_ProcessPacket_sloc2_1_0
	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
	lcall	__gptrget
	mov	r1,a
	mov	r5,#0x00
	mov	(_ProcessPacket_sloc1_1_0 + 1),r1
	mov	_ProcessPacket_sloc1_1_0,r5
	mov	r1,_ProcessPacket_sloc0_1_0
	mov	_ProcessPacket_addr_10000_46,r1
	mov	a,(_ProcessPacket_sloc1_1_0 + 1)
	orl	a,r5
	mov	(_ProcessPacket_addr_10000_46 + 1),a
;	src/main.c:48: uint8_t len = rx[4];
	mov	a,#0x04
	add	a, _ProcessPacket_rx_10000_46
	mov	r1,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r5,a
	mov	r7,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r1
	mov	dph,r5
	mov	b,r7
	lcall	__gptrget
	mov	_ProcessPacket_len_10000_46,a
;	src/main.c:50: memset(reply_buf, 0, 64);
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
;	src/main.c:51: reply_buf[0] = cmd;
	mov	dptr,#_reply_buf
	mov	a,_ProcessPacket_cmd_10000_46
	movx	@dptr,a
;	src/main.c:52: reply_buf[1] = seq;
	mov	dptr,#(_reply_buf + 0x0001)
	mov	a,_ProcessPacket_seq_10000_46
	movx	@dptr,a
;	src/main.c:53: reply_buf[2] = rx[2];
	mov	dpl,r0
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	r0,a
	mov	dptr,#(_reply_buf + 0x0002)
	movx	@dptr,a
;	src/main.c:54: reply_buf[3] = rx[3];
	mov	dpl,_ProcessPacket_sloc2_1_0
	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
	lcall	__gptrget
	mov	r6,a
	mov	dptr,#(_reply_buf + 0x0003)
	movx	@dptr,a
;	src/main.c:55: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
;	src/main.c:57: switch (cmd) {
	mov	a,_ProcessPacket_cmd_10000_46
	add	a,#0xff - 0x06
	jnc	00214$
	ljmp	00119$
00214$:
;	free result
	mov	a,_ProcessPacket_cmd_10000_46
	mov	b,#0x03
	mul	ab
	mov	dptr,#00215$
	jmp	@a+dptr
00215$:
	ljmp	00119$
	ljmp	00101$
	ljmp	00102$
	ljmp	00119$
	ljmp	00109$
	ljmp	00117$
	ljmp	00118$
;	src/main.c:58: case CMD_HELLO:
00101$:
;	src/main.c:59: reply_buf[4] = 0x52; // Chip ID: CH552
	mov	dptr,#(_reply_buf + 0x0004)
	mov	a,#0x52
	movx	@dptr,a
;	src/main.c:60: reply_buf[5] = 0x01; // Bootloader v1.0
	mov	dptr,#(_reply_buf + 0x0005)
	mov	a,#0x01
	movx	@dptr,a
;	src/main.c:61: reply_buf[6] = (uint8_t)(USER_FLASH_END & 0xFF);
	mov	dptr,#(_reply_buf + 0x0006)
	mov	a,#0xff
	movx	@dptr,a
;	src/main.c:62: reply_buf[7] = (uint8_t)((USER_FLASH_END >> 8) & 0xFF); // 11 KB usable
	mov	dptr,#(_reply_buf + 0x0007)
	mov	a,#0x2b
	movx	@dptr,a
;	src/main.c:63: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
;	src/main.c:64: break;
	ljmp	00120$
;	src/main.c:66: case CMD_UNLOCK:
00102$:
;	src/main.c:67: if (rx[5] == 0x5A && rx[6] == 0xC3 && rx[7] == 0x3C && rx[8] == 0xA5) {
	mov	a,#0x05
	add	a, _ProcessPacket_rx_10000_46
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x5a,00104$
	mov	a,#0x06
	add	a, _ProcessPacket_rx_10000_46
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0xc3,00104$
	mov	a,#0x07
	add	a, _ProcessPacket_rx_10000_46
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0x3c,00104$
	mov	a,#0x08
	add	a, _ProcessPacket_rx_10000_46
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r5,a
	mov	r6,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	cjne	r4,#0xa5,00104$
;	src/main.c:68: is_unlocked = 1;
	mov	_is_unlocked,#0x01
;	src/main.c:69: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
	ljmp	00120$
00104$:
;	src/main.c:71: is_unlocked = 0;
	mov	_is_unlocked,#0x00
;	src/main.c:72: reply_buf[59] = STATUS_LOCKED;
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0x02
	movx	@dptr,a
;	src/main.c:74: break;
	ljmp	00120$
;	src/main.c:76: case CMD_WRITE_BLOCK:
00109$:
;	src/main.c:77: if (!is_unlocked) {
	mov	a,_is_unlocked
	jnz	00111$
;	src/main.c:78: reply_buf[59] = STATUS_LOCKED;
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0x02
	movx	@dptr,a
;	src/main.c:79: break;
	ljmp	00120$
00111$:
;	src/main.c:82: if (addr + len > BOOTLOADER_START) {
	mov	r5,_ProcessPacket_len_10000_46
	mov	r6,#0x00
	mov	r1,_ProcessPacket_addr_10000_46
	mov	r4,(_ProcessPacket_addr_10000_46 + 1)
	mov	a,r5
	add	a, r1
	mov	r5,a
	mov	a,r6
	addc	a, r4
	mov	r6,a
	clr	c
	clr	a
	subb	a,r5
	mov	a,#0x2c
	subb	a,r6
	jnc	00113$
;	free result
;	src/main.c:83: reply_buf[59] = STATUS_OOB; // Protect bootloader
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0x03
	movx	@dptr,a
;	src/main.c:84: break;
	ljmp	00120$
00113$:
;	src/main.c:89: uint8_t err = 0;
	mov	_ProcessPacket_err_40000_56,#0x00
;	src/main.c:90: for (uint8_t i = 0; i < len; i += 2) {
	mov	_ProcessPacket_i_50000_57,#0x00
00122$:
	clr	c
	mov	a,_ProcessPacket_i_50000_57
	subb	a,_ProcessPacket_len_10000_46
	jnc	00116$
;	src/main.c:91: uint16_t word = rx[5 + i] | ((uint16_t)rx[6 + i] << 8);
	mov	r2,_ProcessPacket_i_50000_57
	mov	r3,#0x00
	mov	a,#0x05
	add	a, r2
	mov	r0,a
	clr	a
	addc	a, r3
	mov	r6,a
	mov	a,r0
	add	a, _ProcessPacket_rx_10000_46
	mov	r0,a
	mov	a,r6
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r6,a
	mov	r7,(_ProcessPacket_rx_10000_46 + 2)
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
	add	a, _ProcessPacket_rx_10000_46
	mov	r6,a
	mov	a,r7
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r5,a
	mov	r7,(_ProcessPacket_rx_10000_46 + 2)
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
;	src/main.c:92: if (IAP_WriteWord(addr + i, word) != 0) {
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
	jz	00123$
;	src/main.c:93: err = 1;
	mov	_ProcessPacket_err_40000_56,#0x01
;	src/main.c:94: break;
	sjmp	00116$
00123$:
;	src/main.c:90: for (uint8_t i = 0; i < len; i += 2) {
	mov	r5,_ProcessPacket_i_50000_57
	mov	a,#0x02
	add	a, r5
	mov	_ProcessPacket_i_50000_57,a
	sjmp	00122$
00116$:
;	src/main.c:97: reply_buf[59] = err ? STATUS_WRITE_ERR : STATUS_OK;
	mov	a,_ProcessPacket_err_40000_56
	jz	00126$
	mov	a,#0x04
00126$:
	mov	dptr,#(_reply_buf + 0x003b)
	movx	@dptr,a
;	src/main.c:99: break;
	ljmp	00120$
;	src/main.c:101: case CMD_VERIFY_CRC:
00117$:
;	src/main.c:103: uint16_t expected_crc = rx[5] | ((uint16_t)rx[6] << 8);
	mov	a,#0x05
	add	a, _ProcessPacket_rx_10000_46
	mov	r5,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r6,a
	mov	r7,(_ProcessPacket_rx_10000_46 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r5,a
	mov	a,#0x06
	add	a, _ProcessPacket_rx_10000_46
	mov	r4,a
	clr	a
	addc	a, (_ProcessPacket_rx_10000_46 + 1)
	mov	r6,a
	mov	r7,(_ProcessPacket_rx_10000_46 + 2)
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
;	src/main.c:104: uint16_t calc_crc = IAP_CalculateCRC16(0x0000, addr); // addr represents end of code
	mov	_IAP_CalculateCRC16_PARM_2,_ProcessPacket_addr_10000_46
	mov	(_IAP_CalculateCRC16_PARM_2 + 1),(_ProcessPacket_addr_10000_46 + 1)
	mov	dptr,#0x0000
	push	ar7
	push	ar4
	lcall	_IAP_CalculateCRC16
	mov	r5, dpl
	mov	r6, dph
	pop	ar4
	pop	ar7
;	src/main.c:105: reply_buf[4] = (uint8_t)(calc_crc & 0xFF);
	mov	ar3,r5
	mov	dptr,#(_reply_buf + 0x0004)
	mov	a,r3
	movx	@dptr,a
;	src/main.c:106: reply_buf[5] = (uint8_t)((calc_crc >> 8) & 0xFF);
	mov	ar3,r6
	mov	dptr,#(_reply_buf + 0x0005)
	mov	a,r3
	movx	@dptr,a
;	src/main.c:107: reply_buf[59] = (calc_crc == expected_crc) ? STATUS_OK : STATUS_BAD_CRC;
	mov	a,r5
	cjne	a,ar4,00128$
	mov	a,r6
	cjne	a,ar7,00128$
	mov	r7,#0x00
	sjmp	00129$
00128$:
	mov	r7,#0x01
00129$:
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,r7
	movx	@dptr,a
;	src/main.c:109: break;
;	src/main.c:111: case CMD_REBOOT:
	sjmp	00120$
00118$:
;	src/main.c:112: reply_buf[59] = STATUS_OK;
	mov	dptr,#(_reply_buf + 0x003b)
	clr	a
	movx	@dptr,a
;	src/main.c:113: USB_SendReport(reply_buf, 64);
	mov	_USB_SendReport_PARM_2,#0x40
	mov	dptr,#_reply_buf
	mov	b,a
	lcall	_USB_SendReport
;	src/main.c:114: DelayMs(50);
	mov	dptr,#0x0032
	lcall	_DelayMs
;	src/main.c:115: JumpToApp();
;	src/main.c:116: return;
;	src/main.c:118: default:
	ljmp	_JumpToApp
00119$:
;	src/main.c:119: reply_buf[59] = STATUS_UNKNOWN;
	mov	dptr,#(_reply_buf + 0x003b)
	mov	a,#0xff
	movx	@dptr,a
;	src/main.c:121: }
00120$:
;	src/main.c:123: USB_SendReport(reply_buf, 64);
	mov	_USB_SendReport_PARM_2,#0x40
	mov	dptr,#_reply_buf
	mov	b, #0x00
	lcall	_USB_SendReport
;	src/main.c:124: USB_ReleaseRx();
;	src/main.c:125: }
	ljmp	_USB_ReleaseRx
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;button_pressed Allocated to registers r7 
;first_word    Allocated to registers 
;is_blank      Allocated to registers r6 
;timeout       Allocated to registers 
;stay_in_bootloader Allocated to registers r7 
;------------------------------------------------------------
;	src/main.c:127: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	src/main.c:129: P3_DIR &= ~(1 << BOOT_PIN_BIT);
	anl	_P3_DIR,#0xfb
;	src/main.c:130: P3_PU  |=  (1 << BOOT_PIN_BIT);
	orl	_P3_PU,#0x04
;	src/main.c:132: uint8_t button_pressed = ((P3 & (1 << BOOT_PIN_BIT)) == 0);
	mov	a,#0x04
	anl	a,_P3
	mov	r7,a
	clr	a
	cjne	r7,#0x00,00157$
	inc	a
00157$:
	mov	r7,a
;	src/main.c:133: uint16_t first_word = IAP_ReadWord(0x0000);
	mov	dptr,#0x0000
	push	ar7
	lcall	_IAP_ReadWord
	mov	r5, dpl
	mov	r6, dph
	pop	ar7
;	src/main.c:134: uint8_t is_blank = (first_word == 0xFFFF);
	clr	a
	cjne	r5,#0xff,00159$
	cjne	r6,#0xff,00159$
	inc	a
00159$:
	mov	r6,a
;	src/main.c:137: USB_Init();
	push	ar7
	push	ar6
	lcall	_USB_Init
	pop	ar6
	pop	ar7
;	src/main.c:141: uint8_t stay_in_bootloader = button_pressed || is_blank;
	mov	a,r7
	jnz	00113$
	mov	a,r6
	jnz	00113$
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
;	src/main.c:143: while (1) {
	mov	r3,#0x00
	mov	r4,#0x00
	mov	r5,#0x00
	mov	r6,#0x00
00108$:
;	src/main.c:144: USB_Process();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_USB_Process
;	src/main.c:146: if (USB_Available()) {
	lcall	_USB_Available
	mov	a, dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	jz	00102$
;	src/main.c:147: stay_in_bootloader = 1; // Handshake received, cancel timeout
	mov	r7,#0x01
;	src/main.c:148: ProcessPacket();
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
;	src/main.c:151: if (!stay_in_bootloader) {
	mov	a,r7
	jnz	00108$
;	src/main.c:152: timeout++;
	inc	r3
	cjne	r3,#0x00,00165$
	inc	r4
	cjne	r4,#0x00,00165$
	inc	r5
	cjne	r5,#0x00,00165$
	inc	r6
00165$:
;	src/main.c:153: if (timeout > 400000UL) { // Approx 1.5s timeout at 24MHz
	clr	c
	mov	a,#0x80
	subb	a,r3
	mov	a,#0x1a
	subb	a,r4
	mov	a,#0x06
	subb	a,r5
	clr	a
	subb	a,r6
	jnc	00108$
;	free result
;	src/main.c:154: JumpToApp();
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
;	src/main.c:158: }
	ljmp	00108$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
