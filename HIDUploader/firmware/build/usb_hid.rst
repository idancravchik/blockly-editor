                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.6.0 #16555 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module usb_hid
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl ___memcpy
                                     12 	.globl _UIF_BUS_RST
                                     13 	.globl _UIF_DETECT
                                     14 	.globl _UIF_TRANSFER
                                     15 	.globl _UIF_SUSPEND
                                     16 	.globl _UIF_HST_SOF
                                     17 	.globl _UIF_FIFO_OV
                                     18 	.globl _U_SIE_FREE
                                     19 	.globl _U_TOG_OK
                                     20 	.globl _U_IS_NAK
                                     21 	.globl _ADC_CHAN0
                                     22 	.globl _ADC_CHAN1
                                     23 	.globl _CMP_CHAN
                                     24 	.globl _ADC_START
                                     25 	.globl _ADC_IF
                                     26 	.globl _CMP_IF
                                     27 	.globl _CMPO
                                     28 	.globl _U1RI
                                     29 	.globl _U1TI
                                     30 	.globl _U1RB8
                                     31 	.globl _U1TB8
                                     32 	.globl _U1REN
                                     33 	.globl _U1SMOD
                                     34 	.globl _U1SM0
                                     35 	.globl _S0_R_FIFO
                                     36 	.globl _S0_T_FIFO
                                     37 	.globl _S0_FREE
                                     38 	.globl _S0_IF_BYTE
                                     39 	.globl _S0_IF_FIRST
                                     40 	.globl _S0_IF_OV
                                     41 	.globl _S0_FST_ACT
                                     42 	.globl _CP_RL2
                                     43 	.globl _C_T2
                                     44 	.globl _TR2
                                     45 	.globl _EXEN2
                                     46 	.globl _TCLK
                                     47 	.globl _RCLK
                                     48 	.globl _EXF2
                                     49 	.globl _CAP1F
                                     50 	.globl _TF2
                                     51 	.globl _RI
                                     52 	.globl _TI
                                     53 	.globl _RB8
                                     54 	.globl _TB8
                                     55 	.globl _REN
                                     56 	.globl _SM2
                                     57 	.globl _SM1
                                     58 	.globl _SM0
                                     59 	.globl _IT0
                                     60 	.globl _IE0
                                     61 	.globl _IT1
                                     62 	.globl _IE1
                                     63 	.globl _TR0
                                     64 	.globl _TF0
                                     65 	.globl _TR1
                                     66 	.globl _TF1
                                     67 	.globl _P3_0
                                     68 	.globl _P3_1
                                     69 	.globl _P3_2
                                     70 	.globl _P3_3
                                     71 	.globl _P3_4
                                     72 	.globl _P3_5
                                     73 	.globl _P3_6
                                     74 	.globl _P3_7
                                     75 	.globl _RXD
                                     76 	.globl _PWM1_
                                     77 	.globl _TXD
                                     78 	.globl _PWM2_
                                     79 	.globl _AIN3
                                     80 	.globl _VBUS1
                                     81 	.globl _INT0
                                     82 	.globl _TXD1_
                                     83 	.globl _INT1
                                     84 	.globl _T0
                                     85 	.globl _RXD1_
                                     86 	.globl _PWM2
                                     87 	.globl _T1
                                     88 	.globl _UDP
                                     89 	.globl _UDM
                                     90 	.globl _P1_0
                                     91 	.globl _P1_1
                                     92 	.globl _P1_2
                                     93 	.globl _P1_3
                                     94 	.globl _P1_4
                                     95 	.globl _P1_5
                                     96 	.globl _P1_6
                                     97 	.globl _P1_7
                                     98 	.globl _TIN0
                                     99 	.globl _CAP1
                                    100 	.globl _T2
                                    101 	.globl _AIN0
                                    102 	.globl _VBUS2
                                    103 	.globl _TIN1
                                    104 	.globl _CAP2
                                    105 	.globl _T2EX
                                    106 	.globl _RXD_
                                    107 	.globl _TXD_
                                    108 	.globl _AIN1
                                    109 	.globl _UCC1
                                    110 	.globl _TIN2
                                    111 	.globl _SCS
                                    112 	.globl _CAP1_
                                    113 	.globl _T2_
                                    114 	.globl _AIN2
                                    115 	.globl _UCC2
                                    116 	.globl _TIN3
                                    117 	.globl _PWM1
                                    118 	.globl _MOSI
                                    119 	.globl _TIN4
                                    120 	.globl _RXD1
                                    121 	.globl _MISO
                                    122 	.globl _TIN5
                                    123 	.globl _TXD1
                                    124 	.globl _SCK
                                    125 	.globl _IE_SPI0
                                    126 	.globl _IE_TKEY
                                    127 	.globl _IE_USB
                                    128 	.globl _IE_ADC
                                    129 	.globl _IE_UART1
                                    130 	.globl _IE_PWMX
                                    131 	.globl _IE_GPIO
                                    132 	.globl _IE_WDOG
                                    133 	.globl _PX0
                                    134 	.globl _PT0
                                    135 	.globl _PX1
                                    136 	.globl _PT1
                                    137 	.globl _PS
                                    138 	.globl _PT2
                                    139 	.globl _PL_FLAG
                                    140 	.globl _PH_FLAG
                                    141 	.globl _EX0
                                    142 	.globl _ET0
                                    143 	.globl _EX1
                                    144 	.globl _ET1
                                    145 	.globl _ES
                                    146 	.globl _ET2
                                    147 	.globl _E_DIS
                                    148 	.globl _EA
                                    149 	.globl _P
                                    150 	.globl _F1
                                    151 	.globl _OV
                                    152 	.globl _RS0
                                    153 	.globl _RS1
                                    154 	.globl _F0
                                    155 	.globl _AC
                                    156 	.globl _CY
                                    157 	.globl _UEP1_DMA_H
                                    158 	.globl _UEP1_DMA_L
                                    159 	.globl _UEP1_DMA
                                    160 	.globl _UEP0_DMA_H
                                    161 	.globl _UEP0_DMA_L
                                    162 	.globl _UEP0_DMA
                                    163 	.globl _UEP2_3_MOD
                                    164 	.globl _UEP4_1_MOD
                                    165 	.globl _UEP3_DMA_H
                                    166 	.globl _UEP3_DMA_L
                                    167 	.globl _UEP3_DMA
                                    168 	.globl _UEP2_DMA_H
                                    169 	.globl _UEP2_DMA_L
                                    170 	.globl _UEP2_DMA
                                    171 	.globl _USB_DEV_AD
                                    172 	.globl _USB_CTRL
                                    173 	.globl _USB_INT_EN
                                    174 	.globl _UEP4_T_LEN
                                    175 	.globl _UEP4_CTRL
                                    176 	.globl _UEP0_T_LEN
                                    177 	.globl _UEP0_CTRL
                                    178 	.globl _USB_RX_LEN
                                    179 	.globl _USB_MIS_ST
                                    180 	.globl _USB_INT_ST
                                    181 	.globl _USB_INT_FG
                                    182 	.globl _UEP3_T_LEN
                                    183 	.globl _UEP3_CTRL
                                    184 	.globl _UEP2_T_LEN
                                    185 	.globl _UEP2_CTRL
                                    186 	.globl _UEP1_T_LEN
                                    187 	.globl _UEP1_CTRL
                                    188 	.globl _UDEV_CTRL
                                    189 	.globl _USB_C_CTRL
                                    190 	.globl _TKEY_DATH
                                    191 	.globl _TKEY_DATL
                                    192 	.globl _TKEY_DAT
                                    193 	.globl _TKEY_CTRL
                                    194 	.globl _ADC_DATA
                                    195 	.globl _ADC_CFG
                                    196 	.globl _ADC_CTRL
                                    197 	.globl _SBAUD1
                                    198 	.globl _SBUF1
                                    199 	.globl _SCON1
                                    200 	.globl _SPI0_SETUP
                                    201 	.globl _SPI0_CK_SE
                                    202 	.globl _SPI0_CTRL
                                    203 	.globl _SPI0_DATA
                                    204 	.globl _SPI0_STAT
                                    205 	.globl _PWM_CK_SE
                                    206 	.globl _PWM_CTRL
                                    207 	.globl _PWM_DATA1
                                    208 	.globl _PWM_DATA2
                                    209 	.globl _T2CAP1H
                                    210 	.globl _T2CAP1L
                                    211 	.globl _T2CAP1
                                    212 	.globl _TH2
                                    213 	.globl _TL2
                                    214 	.globl _T2COUNT
                                    215 	.globl _RCAP2H
                                    216 	.globl _RCAP2L
                                    217 	.globl _RCAP2
                                    218 	.globl _T2MOD
                                    219 	.globl _T2CON
                                    220 	.globl _SBUF
                                    221 	.globl _SCON
                                    222 	.globl _TH1
                                    223 	.globl _TH0
                                    224 	.globl _TL1
                                    225 	.globl _TL0
                                    226 	.globl _TMOD
                                    227 	.globl _TCON
                                    228 	.globl _XBUS_AUX
                                    229 	.globl _PIN_FUNC
                                    230 	.globl _P3_DIR_PU
                                    231 	.globl _P3_MOD_OC
                                    232 	.globl _P3
                                    233 	.globl _P2
                                    234 	.globl _P1_DIR_PU
                                    235 	.globl _P1_MOD_OC
                                    236 	.globl _P1
                                    237 	.globl _ROM_CTRL
                                    238 	.globl _ROM_DATA_H
                                    239 	.globl _ROM_DATA_L
                                    240 	.globl _ROM_DATA
                                    241 	.globl _ROM_ADDR_H
                                    242 	.globl _ROM_ADDR_L
                                    243 	.globl _ROM_ADDR
                                    244 	.globl _GPIO_IE
                                    245 	.globl _IP_EX
                                    246 	.globl _IE_EX
                                    247 	.globl _IP
                                    248 	.globl _IE
                                    249 	.globl _WDOG_COUNT
                                    250 	.globl _RESET_KEEP
                                    251 	.globl _WAKE_CTRL
                                    252 	.globl _CLOCK_CFG
                                    253 	.globl _PCON
                                    254 	.globl _GLOBAL_CFG
                                    255 	.globl _SAFE_MOD
                                    256 	.globl _DPH
                                    257 	.globl _DPL
                                    258 	.globl _SP
                                    259 	.globl _B
                                    260 	.globl _ACC
                                    261 	.globl _PSW
                                    262 	.globl _Ep1Buffer
                                    263 	.globl _Ep0Buffer
                                    264 	.globl _USB_SendReport_PARM_2
                                    265 	.globl _USB_Init
                                    266 	.globl _USB_Process
                                    267 	.globl _USB_Available
                                    268 	.globl _USB_GetRxBuffer
                                    269 	.globl _USB_ReleaseRx
                                    270 	.globl _USB_SendReport
                                    271 	.globl _USB_Shutdown
                                    272 ;--------------------------------------------------------
                                    273 ; special function registers
                                    274 ;--------------------------------------------------------
                                    275 	.area RSEG    (ABS,DATA)
      000000                        276 	.org 0x0000
                           0000D0   277 _PSW	=	0x00d0
                           0000E0   278 _ACC	=	0x00e0
                           0000F0   279 _B	=	0x00f0
                           000081   280 _SP	=	0x0081
                           000082   281 _DPL	=	0x0082
                           000083   282 _DPH	=	0x0083
                           0000A1   283 _SAFE_MOD	=	0x00a1
                           0000B1   284 _GLOBAL_CFG	=	0x00b1
                           000087   285 _PCON	=	0x0087
                           0000B9   286 _CLOCK_CFG	=	0x00b9
                           0000A9   287 _WAKE_CTRL	=	0x00a9
                           0000FE   288 _RESET_KEEP	=	0x00fe
                           0000FF   289 _WDOG_COUNT	=	0x00ff
                           0000A8   290 _IE	=	0x00a8
                           0000B8   291 _IP	=	0x00b8
                           0000E8   292 _IE_EX	=	0x00e8
                           0000E9   293 _IP_EX	=	0x00e9
                           0000C7   294 _GPIO_IE	=	0x00c7
                           008584   295 _ROM_ADDR	=	0x8584
                           000084   296 _ROM_ADDR_L	=	0x0084
                           000085   297 _ROM_ADDR_H	=	0x0085
                           008F8E   298 _ROM_DATA	=	0x8f8e
                           00008E   299 _ROM_DATA_L	=	0x008e
                           00008F   300 _ROM_DATA_H	=	0x008f
                           000086   301 _ROM_CTRL	=	0x0086
                           000090   302 _P1	=	0x0090
                           000092   303 _P1_MOD_OC	=	0x0092
                           000093   304 _P1_DIR_PU	=	0x0093
                           0000A0   305 _P2	=	0x00a0
                           0000B0   306 _P3	=	0x00b0
                           000096   307 _P3_MOD_OC	=	0x0096
                           000097   308 _P3_DIR_PU	=	0x0097
                           0000C6   309 _PIN_FUNC	=	0x00c6
                           0000A2   310 _XBUS_AUX	=	0x00a2
                           000088   311 _TCON	=	0x0088
                           000089   312 _TMOD	=	0x0089
                           00008A   313 _TL0	=	0x008a
                           00008B   314 _TL1	=	0x008b
                           00008C   315 _TH0	=	0x008c
                           00008D   316 _TH1	=	0x008d
                           000098   317 _SCON	=	0x0098
                           000099   318 _SBUF	=	0x0099
                           0000C8   319 _T2CON	=	0x00c8
                           0000C9   320 _T2MOD	=	0x00c9
                           00CBCA   321 _RCAP2	=	0xcbca
                           0000CA   322 _RCAP2L	=	0x00ca
                           0000CB   323 _RCAP2H	=	0x00cb
                           00CDCC   324 _T2COUNT	=	0xcdcc
                           0000CC   325 _TL2	=	0x00cc
                           0000CD   326 _TH2	=	0x00cd
                           00CFCE   327 _T2CAP1	=	0xcfce
                           0000CE   328 _T2CAP1L	=	0x00ce
                           0000CF   329 _T2CAP1H	=	0x00cf
                           00009B   330 _PWM_DATA2	=	0x009b
                           00009C   331 _PWM_DATA1	=	0x009c
                           00009D   332 _PWM_CTRL	=	0x009d
                           00009E   333 _PWM_CK_SE	=	0x009e
                           0000F8   334 _SPI0_STAT	=	0x00f8
                           0000F9   335 _SPI0_DATA	=	0x00f9
                           0000FA   336 _SPI0_CTRL	=	0x00fa
                           0000FB   337 _SPI0_CK_SE	=	0x00fb
                           0000FC   338 _SPI0_SETUP	=	0x00fc
                           0000C0   339 _SCON1	=	0x00c0
                           0000C1   340 _SBUF1	=	0x00c1
                           0000C2   341 _SBAUD1	=	0x00c2
                           000080   342 _ADC_CTRL	=	0x0080
                           00009A   343 _ADC_CFG	=	0x009a
                           00009F   344 _ADC_DATA	=	0x009f
                           0000C3   345 _TKEY_CTRL	=	0x00c3
                           00C5C4   346 _TKEY_DAT	=	0xc5c4
                           0000C4   347 _TKEY_DATL	=	0x00c4
                           0000C5   348 _TKEY_DATH	=	0x00c5
                           000091   349 _USB_C_CTRL	=	0x0091
                           0000D1   350 _UDEV_CTRL	=	0x00d1
                           0000D2   351 _UEP1_CTRL	=	0x00d2
                           0000D3   352 _UEP1_T_LEN	=	0x00d3
                           0000D4   353 _UEP2_CTRL	=	0x00d4
                           0000D5   354 _UEP2_T_LEN	=	0x00d5
                           0000D6   355 _UEP3_CTRL	=	0x00d6
                           0000D7   356 _UEP3_T_LEN	=	0x00d7
                           0000D8   357 _USB_INT_FG	=	0x00d8
                           0000D9   358 _USB_INT_ST	=	0x00d9
                           0000DA   359 _USB_MIS_ST	=	0x00da
                           0000DB   360 _USB_RX_LEN	=	0x00db
                           0000DC   361 _UEP0_CTRL	=	0x00dc
                           0000DD   362 _UEP0_T_LEN	=	0x00dd
                           0000DE   363 _UEP4_CTRL	=	0x00de
                           0000DF   364 _UEP4_T_LEN	=	0x00df
                           0000E1   365 _USB_INT_EN	=	0x00e1
                           0000E2   366 _USB_CTRL	=	0x00e2
                           0000E3   367 _USB_DEV_AD	=	0x00e3
                           00E5E4   368 _UEP2_DMA	=	0xe5e4
                           0000E4   369 _UEP2_DMA_L	=	0x00e4
                           0000E5   370 _UEP2_DMA_H	=	0x00e5
                           00E7E6   371 _UEP3_DMA	=	0xe7e6
                           0000E6   372 _UEP3_DMA_L	=	0x00e6
                           0000E7   373 _UEP3_DMA_H	=	0x00e7
                           0000EA   374 _UEP4_1_MOD	=	0x00ea
                           0000EB   375 _UEP2_3_MOD	=	0x00eb
                           00EDEC   376 _UEP0_DMA	=	0xedec
                           0000EC   377 _UEP0_DMA_L	=	0x00ec
                           0000ED   378 _UEP0_DMA_H	=	0x00ed
                           00EFEE   379 _UEP1_DMA	=	0xefee
                           0000EE   380 _UEP1_DMA_L	=	0x00ee
                           0000EF   381 _UEP1_DMA_H	=	0x00ef
                                    382 ;--------------------------------------------------------
                                    383 ; special function bits
                                    384 ;--------------------------------------------------------
                                    385 	.area RSEG    (ABS,DATA)
      000000                        386 	.org 0x0000
                           0000D7   387 _CY	=	0x00d7
                           0000D6   388 _AC	=	0x00d6
                           0000D5   389 _F0	=	0x00d5
                           0000D4   390 _RS1	=	0x00d4
                           0000D3   391 _RS0	=	0x00d3
                           0000D2   392 _OV	=	0x00d2
                           0000D1   393 _F1	=	0x00d1
                           0000D0   394 _P	=	0x00d0
                           0000AF   395 _EA	=	0x00af
                           0000AE   396 _E_DIS	=	0x00ae
                           0000AD   397 _ET2	=	0x00ad
                           0000AC   398 _ES	=	0x00ac
                           0000AB   399 _ET1	=	0x00ab
                           0000AA   400 _EX1	=	0x00aa
                           0000A9   401 _ET0	=	0x00a9
                           0000A8   402 _EX0	=	0x00a8
                           0000BF   403 _PH_FLAG	=	0x00bf
                           0000BE   404 _PL_FLAG	=	0x00be
                           0000BD   405 _PT2	=	0x00bd
                           0000BC   406 _PS	=	0x00bc
                           0000BB   407 _PT1	=	0x00bb
                           0000BA   408 _PX1	=	0x00ba
                           0000B9   409 _PT0	=	0x00b9
                           0000B8   410 _PX0	=	0x00b8
                           0000EF   411 _IE_WDOG	=	0x00ef
                           0000EE   412 _IE_GPIO	=	0x00ee
                           0000ED   413 _IE_PWMX	=	0x00ed
                           0000EC   414 _IE_UART1	=	0x00ec
                           0000EB   415 _IE_ADC	=	0x00eb
                           0000EA   416 _IE_USB	=	0x00ea
                           0000E9   417 _IE_TKEY	=	0x00e9
                           0000E8   418 _IE_SPI0	=	0x00e8
                           000097   419 _SCK	=	0x0097
                           000097   420 _TXD1	=	0x0097
                           000097   421 _TIN5	=	0x0097
                           000096   422 _MISO	=	0x0096
                           000096   423 _RXD1	=	0x0096
                           000096   424 _TIN4	=	0x0096
                           000095   425 _MOSI	=	0x0095
                           000095   426 _PWM1	=	0x0095
                           000095   427 _TIN3	=	0x0095
                           000095   428 _UCC2	=	0x0095
                           000095   429 _AIN2	=	0x0095
                           000094   430 _T2_	=	0x0094
                           000094   431 _CAP1_	=	0x0094
                           000094   432 _SCS	=	0x0094
                           000094   433 _TIN2	=	0x0094
                           000094   434 _UCC1	=	0x0094
                           000094   435 _AIN1	=	0x0094
                           000093   436 _TXD_	=	0x0093
                           000092   437 _RXD_	=	0x0092
                           000091   438 _T2EX	=	0x0091
                           000091   439 _CAP2	=	0x0091
                           000091   440 _TIN1	=	0x0091
                           000091   441 _VBUS2	=	0x0091
                           000091   442 _AIN0	=	0x0091
                           000090   443 _T2	=	0x0090
                           000090   444 _CAP1	=	0x0090
                           000090   445 _TIN0	=	0x0090
                           000097   446 _P1_7	=	0x0097
                           000096   447 _P1_6	=	0x0096
                           000095   448 _P1_5	=	0x0095
                           000094   449 _P1_4	=	0x0094
                           000093   450 _P1_3	=	0x0093
                           000092   451 _P1_2	=	0x0092
                           000091   452 _P1_1	=	0x0091
                           000090   453 _P1_0	=	0x0090
                           0000B7   454 _UDM	=	0x00b7
                           0000B6   455 _UDP	=	0x00b6
                           0000B5   456 _T1	=	0x00b5
                           0000B4   457 _PWM2	=	0x00b4
                           0000B4   458 _RXD1_	=	0x00b4
                           0000B4   459 _T0	=	0x00b4
                           0000B3   460 _INT1	=	0x00b3
                           0000B2   461 _TXD1_	=	0x00b2
                           0000B2   462 _INT0	=	0x00b2
                           0000B2   463 _VBUS1	=	0x00b2
                           0000B2   464 _AIN3	=	0x00b2
                           0000B1   465 _PWM2_	=	0x00b1
                           0000B1   466 _TXD	=	0x00b1
                           0000B0   467 _PWM1_	=	0x00b0
                           0000B0   468 _RXD	=	0x00b0
                           0000B7   469 _P3_7	=	0x00b7
                           0000B6   470 _P3_6	=	0x00b6
                           0000B5   471 _P3_5	=	0x00b5
                           0000B4   472 _P3_4	=	0x00b4
                           0000B3   473 _P3_3	=	0x00b3
                           0000B2   474 _P3_2	=	0x00b2
                           0000B1   475 _P3_1	=	0x00b1
                           0000B0   476 _P3_0	=	0x00b0
                           00008F   477 _TF1	=	0x008f
                           00008E   478 _TR1	=	0x008e
                           00008D   479 _TF0	=	0x008d
                           00008C   480 _TR0	=	0x008c
                           00008B   481 _IE1	=	0x008b
                           00008A   482 _IT1	=	0x008a
                           000089   483 _IE0	=	0x0089
                           000088   484 _IT0	=	0x0088
                           00009F   485 _SM0	=	0x009f
                           00009E   486 _SM1	=	0x009e
                           00009D   487 _SM2	=	0x009d
                           00009C   488 _REN	=	0x009c
                           00009B   489 _TB8	=	0x009b
                           00009A   490 _RB8	=	0x009a
                           000099   491 _TI	=	0x0099
                           000098   492 _RI	=	0x0098
                           0000CF   493 _TF2	=	0x00cf
                           0000CF   494 _CAP1F	=	0x00cf
                           0000CE   495 _EXF2	=	0x00ce
                           0000CD   496 _RCLK	=	0x00cd
                           0000CC   497 _TCLK	=	0x00cc
                           0000CB   498 _EXEN2	=	0x00cb
                           0000CA   499 _TR2	=	0x00ca
                           0000C9   500 _C_T2	=	0x00c9
                           0000C8   501 _CP_RL2	=	0x00c8
                           0000FF   502 _S0_FST_ACT	=	0x00ff
                           0000FE   503 _S0_IF_OV	=	0x00fe
                           0000FD   504 _S0_IF_FIRST	=	0x00fd
                           0000FC   505 _S0_IF_BYTE	=	0x00fc
                           0000FB   506 _S0_FREE	=	0x00fb
                           0000FA   507 _S0_T_FIFO	=	0x00fa
                           0000F8   508 _S0_R_FIFO	=	0x00f8
                           0000C7   509 _U1SM0	=	0x00c7
                           0000C5   510 _U1SMOD	=	0x00c5
                           0000C4   511 _U1REN	=	0x00c4
                           0000C3   512 _U1TB8	=	0x00c3
                           0000C2   513 _U1RB8	=	0x00c2
                           0000C1   514 _U1TI	=	0x00c1
                           0000C0   515 _U1RI	=	0x00c0
                           000087   516 _CMPO	=	0x0087
                           000086   517 _CMP_IF	=	0x0086
                           000085   518 _ADC_IF	=	0x0085
                           000084   519 _ADC_START	=	0x0084
                           000083   520 _CMP_CHAN	=	0x0083
                           000081   521 _ADC_CHAN1	=	0x0081
                           000080   522 _ADC_CHAN0	=	0x0080
                           0000DF   523 _U_IS_NAK	=	0x00df
                           0000DE   524 _U_TOG_OK	=	0x00de
                           0000DD   525 _U_SIE_FREE	=	0x00dd
                           0000DC   526 _UIF_FIFO_OV	=	0x00dc
                           0000DB   527 _UIF_HST_SOF	=	0x00db
                           0000DA   528 _UIF_SUSPEND	=	0x00da
                           0000D9   529 _UIF_TRANSFER	=	0x00d9
                           0000D8   530 _UIF_DETECT	=	0x00d8
                           0000D8   531 _UIF_BUS_RST	=	0x00d8
                                    532 ;--------------------------------------------------------
                                    533 ; overlayable register banks
                                    534 ;--------------------------------------------------------
                                    535 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        536 	.ds 8
                                    537 ;--------------------------------------------------------
                                    538 ; internal ram data
                                    539 ;--------------------------------------------------------
                                    540 	.area DSEG    (DATA)
      000021                        541 _rx_ready:
      000021                        542 	.ds 1
      000022                        543 _usb_dev_addr:
      000022                        544 	.ds 1
      000023                        545 _usb_config:
      000023                        546 	.ds 1
      000024                        547 _setup_tx_ptr:
      000024                        548 	.ds 2
      000026                        549 _setup_tx_len:
      000026                        550 	.ds 2
      000028                        551 _USB_SendReport_PARM_2:
      000028                        552 	.ds 1
                                    553 ;--------------------------------------------------------
                                    554 ; overlayable items in internal ram
                                    555 ;--------------------------------------------------------
                                    556 ;--------------------------------------------------------
                                    557 ; indirectly addressable internal ram data
                                    558 ;--------------------------------------------------------
                                    559 	.area ISEG    (DATA)
                                    560 ;--------------------------------------------------------
                                    561 ; absolute internal ram data
                                    562 ;--------------------------------------------------------
                                    563 	.area IABS    (ABS,DATA)
                                    564 	.area IABS    (ABS,DATA)
                                    565 ;--------------------------------------------------------
                                    566 ; bit data
                                    567 ;--------------------------------------------------------
                                    568 	.area BSEG    (BIT)
                                    569 ;--------------------------------------------------------
                                    570 ; paged external ram data
                                    571 ;--------------------------------------------------------
                                    572 	.area PSEG    (PAG,XDATA)
                                    573 ;--------------------------------------------------------
                                    574 ; uninitialized external ram data
                                    575 ;--------------------------------------------------------
                                    576 	.area XSEG    (XDATA)
                           000000   577 _Ep0Buffer	=	0x0000
                           000040   578 _Ep1Buffer	=	0x0040
                                    579 ;--------------------------------------------------------
                                    580 ; absolute external ram data
                                    581 ;--------------------------------------------------------
                                    582 	.area XABS    (ABS,XDATA)
                                    583 ;--------------------------------------------------------
                                    584 ; initialized external ram data
                                    585 ;--------------------------------------------------------
                                    586 	.area XISEG   (XDATA)
                                    587 	.area HOME    (CODE)
                                    588 	.area GSINIT0 (CODE)
                                    589 	.area GSINIT1 (CODE)
                                    590 	.area GSINIT2 (CODE)
                                    591 	.area GSINIT3 (CODE)
                                    592 	.area GSINIT4 (CODE)
                                    593 	.area GSINIT5 (CODE)
                                    594 	.area GSINIT  (CODE)
                                    595 	.area GSFINAL (CODE)
                                    596 	.area CSEG    (CODE)
                                    597 ;--------------------------------------------------------
                                    598 ; global & static initialisations
                                    599 ;--------------------------------------------------------
                                    600 	.area HOME    (CODE)
                                    601 	.area GSINIT  (CODE)
                                    602 	.area GSFINAL (CODE)
                                    603 	.area GSINIT  (CODE)
                                    604 ;	src/usb_hid.c:10: static volatile uint8_t rx_ready = 0;
      002CAA 75 21 00         [24]  605 	mov	_rx_ready,#0x00
                                    606 ;	src/usb_hid.c:11: static uint8_t usb_dev_addr = 0;
      002CAD 75 22 00         [24]  607 	mov	_usb_dev_addr,#0x00
                                    608 ;	src/usb_hid.c:12: static uint8_t usb_config = 0;
      002CB0 75 23 00         [24]  609 	mov	_usb_config,#0x00
                                    610 ;	src/usb_hid.c:118: static __code const uint8_t *setup_tx_ptr = 0;
      002CB3 E4               [12]  611 	clr	a
      002CB4 F5 24            [12]  612 	mov	_setup_tx_ptr,a
      002CB6 F5 25            [12]  613 	mov	(_setup_tx_ptr + 1),a
                                    614 ;	src/usb_hid.c:119: static uint16_t setup_tx_len = 0;
      002CB8 F5 26            [12]  615 	mov	_setup_tx_len,a
      002CBA F5 27            [12]  616 	mov	(_setup_tx_len + 1),a
                                    617 ;--------------------------------------------------------
                                    618 ; Home
                                    619 ;--------------------------------------------------------
                                    620 	.area HOME    (CODE)
                                    621 	.area HOME    (CODE)
                                    622 ;--------------------------------------------------------
                                    623 ; code
                                    624 ;--------------------------------------------------------
                                    625 	.area CSEG    (CODE)
                                    626 ;------------------------------------------------------------
                                    627 ;Allocation info for local variables in function 'USB_Init'
                                    628 ;------------------------------------------------------------
                                    629 ;	src/usb_hid.c:121: void USB_Init(void) {
                                    630 ;	-----------------------------------------
                                    631 ;	 function USB_Init
                                    632 ;	-----------------------------------------
      003088                        633 _USB_Init:
                           000007   634 	ar7 = 0x07
                           000006   635 	ar6 = 0x06
                           000005   636 	ar5 = 0x05
                           000004   637 	ar4 = 0x04
                           000003   638 	ar3 = 0x03
                           000002   639 	ar2 = 0x02
                           000001   640 	ar1 = 0x01
                           000000   641 	ar0 = 0x00
                                    642 ;	src/usb_hid.c:123: SAFE_MOD = 0x55;
      003088 75 A1 55         [24]  643 	mov	_SAFE_MOD,#0x55
                                    644 ;	src/usb_hid.c:124: SAFE_MOD = 0xAA;
      00308B 75 A1 AA         [24]  645 	mov	_SAFE_MOD,#0xaa
                                    646 ;	src/usb_hid.c:125: CLOCK_CFG = 0x86; // 24MHz internal clock
      00308E 75 B9 86         [24]  647 	mov	_CLOCK_CFG,#0x86
                                    648 ;	src/usb_hid.c:126: SAFE_MOD = 0x00;
      003091 75 A1 00         [24]  649 	mov	_SAFE_MOD,#0x00
                                    650 ;	src/usb_hid.c:129: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL;
      003094 75 E2 06         [24]  651 	mov	_USB_CTRL,#0x06
                                    652 ;	src/usb_hid.c:130: USB_CTRL = 0x00;
      003097 75 E2 00         [24]  653 	mov	_USB_CTRL,#0x00
                                    654 ;	src/usb_hid.c:133: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
      00309A 75 EC 00         [24]  655 	mov	_UEP0_DMA_L,#_Ep0Buffer
                                    656 ;	src/usb_hid.c:134: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
      00309D 7E 00            [12]  657 	mov	r6,#_Ep0Buffer
      00309F 7F 00            [12]  658 	mov	r7,#(_Ep0Buffer >> 8)
      0030A1 8F ED            [24]  659 	mov	_UEP0_DMA_H,r7
                                    660 ;	src/usb_hid.c:136: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
      0030A3 75 EE 40         [24]  661 	mov	_UEP1_DMA_L,#_Ep1Buffer
                                    662 ;	src/usb_hid.c:137: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
      0030A6 7E 40            [12]  663 	mov	r6,#_Ep1Buffer
      0030A8 7F 00            [12]  664 	mov	r7,#(_Ep1Buffer >> 8)
      0030AA 8F EF            [24]  665 	mov	_UEP1_DMA_H,r7
                                    666 ;	src/usb_hid.c:140: UEP4_1_MOD = 0xC0;
      0030AC 75 EA C0         [24]  667 	mov	_UEP4_1_MOD,#0xc0
                                    668 ;	src/usb_hid.c:141: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      0030AF 75 D2 12         [24]  669 	mov	_UEP1_CTRL,#0x12
                                    670 ;	src/usb_hid.c:142: UEP1_T_LEN = 0;
      0030B2 75 D3 00         [24]  671 	mov	_UEP1_T_LEN,#0x00
                                    672 ;	src/usb_hid.c:145: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0030B5 75 DC 02         [24]  673 	mov	_UEP0_CTRL,#0x02
                                    674 ;	src/usb_hid.c:148: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
      0030B8 75 E2 29         [24]  675 	mov	_USB_CTRL,#0x29
                                    676 ;	src/usb_hid.c:149: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN; // Full speed 12Mbps
      0030BB 75 D1 81         [24]  677 	mov	_UDEV_CTRL,#0x81
                                    678 ;	src/usb_hid.c:150: USB_DEV_AD = 0x00;
      0030BE 75 E3 00         [24]  679 	mov	_USB_DEV_AD,#0x00
                                    680 ;	src/usb_hid.c:152: rx_ready = 0;
      0030C1 75 21 00         [24]  681 	mov	_rx_ready,#0x00
                                    682 ;	src/usb_hid.c:153: usb_dev_addr = 0;
      0030C4 75 22 00         [24]  683 	mov	_usb_dev_addr,#0x00
                                    684 ;	src/usb_hid.c:154: usb_config = 0;
      0030C7 75 23 00         [24]  685 	mov	_usb_config,#0x00
                                    686 ;	src/usb_hid.c:155: }
      0030CA 22               [24]  687 	ret
                                    688 ;------------------------------------------------------------
                                    689 ;Allocation info for local variables in function 'Handle_EP0_Setup'
                                    690 ;------------------------------------------------------------
                                    691 ;req_type      Allocated to registers r7 
                                    692 ;req           Allocated to registers r6 
                                    693 ;value         Allocated to registers r4 r5 
                                    694 ;length        Allocated to registers r3 r2 
                                    695 ;send_len      Allocated to registers r7 
                                    696 ;------------------------------------------------------------
                                    697 ;	src/usb_hid.c:157: static void Handle_EP0_Setup(void) {
                                    698 ;	-----------------------------------------
                                    699 ;	 function Handle_EP0_Setup
                                    700 ;	-----------------------------------------
      0030CB                        701 _Handle_EP0_Setup:
                                    702 ;	src/usb_hid.c:158: uint8_t req_type = Ep0Buffer[0];
      0030CB 90 00 00         [24]  703 	mov	dptr,#_Ep0Buffer
      0030CE E0               [24]  704 	movx	a,@dptr
      0030CF FF               [12]  705 	mov	r7,a
                                    706 ;	src/usb_hid.c:159: uint8_t req = Ep0Buffer[1];
      0030D0 90 00 01         [24]  707 	mov	dptr,#(_Ep0Buffer + 0x0001)
      0030D3 E0               [24]  708 	movx	a,@dptr
      0030D4 FE               [12]  709 	mov	r6,a
                                    710 ;	src/usb_hid.c:160: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
      0030D5 90 00 02         [24]  711 	mov	dptr,#(_Ep0Buffer + 0x0002)
      0030D8 E0               [24]  712 	movx	a,@dptr
      0030D9 FD               [12]  713 	mov	r5,a
      0030DA 90 00 03         [24]  714 	mov	dptr,#(_Ep0Buffer + 0x0003)
      0030DD E0               [24]  715 	movx	a,@dptr
      0030DE FB               [12]  716 	mov	r3,a
      0030DF 7C 00            [12]  717 	mov	r4,#0x00
      0030E1 8D 02            [24]  718 	mov	ar2,r5
      0030E3 7D 00            [12]  719 	mov	r5,#0x00
      0030E5 EC               [12]  720 	mov	a,r4
      0030E6 4A               [12]  721 	orl	a,r2
      0030E7 FC               [12]  722 	mov	r4,a
      0030E8 EB               [12]  723 	mov	a,r3
      0030E9 4D               [12]  724 	orl	a,r5
      0030EA FD               [12]  725 	mov	r5,a
                                    726 ;	src/usb_hid.c:161: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
      0030EB 90 00 06         [24]  727 	mov	dptr,#(_Ep0Buffer + 0x0006)
      0030EE E0               [24]  728 	movx	a,@dptr
      0030EF FB               [12]  729 	mov	r3,a
      0030F0 90 00 07         [24]  730 	mov	dptr,#(_Ep0Buffer + 0x0007)
      0030F3 E0               [24]  731 	movx	a,@dptr
      0030F4 FA               [12]  732 	mov	r2,a
      0030F5 E4               [12]  733 	clr	a
      0030F6 F9               [12]  734 	mov	r1,a
      0030F7 F8               [12]  735 	mov	r0,a
      0030F8 4B               [12]  736 	orl	a,r3
      0030F9 FB               [12]  737 	mov	r3,a
      0030FA EA               [12]  738 	mov	a,r2
      0030FB 48               [12]  739 	orl	a,r0
      0030FC FA               [12]  740 	mov	r2,a
                                    741 ;	src/usb_hid.c:163: setup_tx_ptr = 0;
      0030FD E4               [12]  742 	clr	a
      0030FE F5 24            [12]  743 	mov	_setup_tx_ptr,a
      003100 F5 25            [12]  744 	mov	(_setup_tx_ptr + 1),a
                                    745 ;	src/usb_hid.c:164: setup_tx_len = 0;
      003102 F5 26            [12]  746 	mov	_setup_tx_len,a
      003104 F5 27            [12]  747 	mov	(_setup_tx_len + 1),a
                                    748 ;	src/usb_hid.c:166: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
      003106 EF               [12]  749 	mov	a,r7
      003107 54 60            [12]  750 	anl	a,#0x60
      003109 60 03            [24]  751 	jz	00234$
      00310B 02 31 D4         [24]  752 	ljmp	00123$
      00310E                        753 00234$:
                                    754 ;	src/usb_hid.c:167: switch (req) {
      00310E EE               [12]  755 	mov	a,r6
      00310F 70 03            [24]  756 	jnz	00235$
      003111 02 31 C6         [24]  757 	ljmp	00114$
      003114                        758 00235$:
      003114 BE 05 03         [24]  759 	cjne	r6,#0x05,00236$
      003117 02 31 BE         [24]  760 	ljmp	00112$
      00311A                        761 00236$:
      00311A BE 06 02         [24]  762 	cjne	r6,#0x06,00237$
      00311D 80 09            [24]  763 	sjmp	00101$
      00311F                        764 00237$:
      00311F BE 09 03         [24]  765 	cjne	r6,#0x09,00238$
      003122 02 31 C2         [24]  766 	ljmp	00113$
      003125                        767 00238$:
      003125 02 31 D4         [24]  768 	ljmp	00123$
                                    769 ;	src/usb_hid.c:168: case USB_GET_DESCRIPTOR:
      003128                        770 00101$:
                                    771 ;	src/usb_hid.c:169: switch (Ep0Buffer[3]) {
      003128 90 00 03         [24]  772 	mov	dptr,#(_Ep0Buffer + 0x0003)
      00312B E0               [24]  773 	movx	a,@dptr
      00312C FF               [12]  774 	mov	r7,a
      00312D BF 01 02         [24]  775 	cjne	r7,#0x01,00239$
      003130 80 12            [24]  776 	sjmp	00102$
      003132                        777 00239$:
      003132 BF 02 02         [24]  778 	cjne	r7,#0x02,00240$
      003135 80 1C            [24]  779 	sjmp	00103$
      003137                        780 00240$:
      003137 BF 03 02         [24]  781 	cjne	r7,#0x03,00241$
      00313A 80 25            [24]  782 	sjmp	00104$
      00313C                        783 00241$:
      00313C BF 22 02         [24]  784 	cjne	r7,#0x22,00242$
      00313F 80 6F            [24]  785 	sjmp	00110$
      003141                        786 00242$:
      003141 02 31 D4         [24]  787 	ljmp	00123$
                                    788 ;	src/usb_hid.c:170: case 0x01: // Device Descriptor
      003144                        789 00102$:
                                    790 ;	src/usb_hid.c:171: setup_tx_ptr = DevDesc;
      003144 75 24 B4         [24]  791 	mov	_setup_tx_ptr,#_DevDesc
      003147 75 25 34         [24]  792 	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
                                    793 ;	src/usb_hid.c:172: setup_tx_len = sizeof(DevDesc);
      00314A 75 26 12         [24]  794 	mov	_setup_tx_len,#0x12
      00314D 75 27 00         [24]  795 	mov	(_setup_tx_len + 1),#0x00
                                    796 ;	src/usb_hid.c:173: break;
      003150 02 31 D4         [24]  797 	ljmp	00123$
                                    798 ;	src/usb_hid.c:174: case 0x02: // Configuration Descriptor
      003153                        799 00103$:
                                    800 ;	src/usb_hid.c:175: setup_tx_ptr = CfgDesc;
      003153 75 24 E8         [24]  801 	mov	_setup_tx_ptr,#_CfgDesc
      003156 75 25 34         [24]  802 	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
                                    803 ;	src/usb_hid.c:176: setup_tx_len = sizeof(CfgDesc);
      003159 75 26 29         [24]  804 	mov	_setup_tx_len,#0x29
      00315C 75 27 00         [24]  805 	mov	(_setup_tx_len + 1),#0x00
                                    806 ;	src/usb_hid.c:177: break;
                                    807 ;	src/usb_hid.c:178: case 0x03: // String Descriptor
      00315F 80 73            [24]  808 	sjmp	00123$
      003161                        809 00104$:
                                    810 ;	src/usb_hid.c:179: switch (Ep0Buffer[2]) {
      003161 90 00 02         [24]  811 	mov	dptr,#(_Ep0Buffer + 0x0002)
      003164 E0               [24]  812 	movx	a,@dptr
      003165 FF               [12]  813 	mov  r7,a
      003166 24 FC            [12]  814 	add	a,#0xff - 0x03
      003168 40 6A            [24]  815 	jc	00123$
                                    816 ;	free result
      00316A EF               [12]  817 	mov	a,r7
      00316B 2F               [12]  818 	add	a,r7
                                    819 ;	src/usb_hid.c:180: case 0: setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); break;
      00316C 90 31 70         [24]  820 	mov	dptr,#00244$
      00316F 73               [24]  821 	jmp	@a+dptr
      003170                        822 00244$:
      003170 80 06            [24]  823 	sjmp	00105$
      003172 80 12            [24]  824 	sjmp	00106$
      003174 80 1E            [24]  825 	sjmp	00107$
      003176 80 2A            [24]  826 	sjmp	00108$
      003178                        827 00105$:
      003178 75 24 11         [24]  828 	mov	_setup_tx_ptr,#_Str0Desc
      00317B 75 25 35         [24]  829 	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
      00317E 75 26 04         [24]  830 	mov	_setup_tx_len,#0x04
      003181 75 27 00         [24]  831 	mov	(_setup_tx_len + 1),#0x00
                                    832 ;	src/usb_hid.c:181: case 1: setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); break;
      003184 80 4E            [24]  833 	sjmp	00123$
      003186                        834 00106$:
      003186 75 24 15         [24]  835 	mov	_setup_tx_ptr,#_Str1Desc
      003189 75 25 35         [24]  836 	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
      00318C 75 26 0E         [24]  837 	mov	_setup_tx_len,#0x0e
      00318F 75 27 00         [24]  838 	mov	(_setup_tx_len + 1),#0x00
                                    839 ;	src/usb_hid.c:182: case 2: setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); break;
      003192 80 40            [24]  840 	sjmp	00123$
      003194                        841 00107$:
      003194 75 24 23         [24]  842 	mov	_setup_tx_ptr,#_Str2Desc
      003197 75 25 35         [24]  843 	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
      00319A 75 26 24         [24]  844 	mov	_setup_tx_len,#0x24
      00319D 75 27 00         [24]  845 	mov	(_setup_tx_len + 1),#0x00
                                    846 ;	src/usb_hid.c:183: case 3: setup_tx_ptr = Str3Desc; setup_tx_len = sizeof(Str3Desc); break;
      0031A0 80 32            [24]  847 	sjmp	00123$
      0031A2                        848 00108$:
      0031A2 75 24 47         [24]  849 	mov	_setup_tx_ptr,#_Str3Desc
      0031A5 75 25 35         [24]  850 	mov	(_setup_tx_ptr + 1),#(_Str3Desc >> 8)
      0031A8 75 26 0A         [24]  851 	mov	_setup_tx_len,#0x0a
      0031AB 75 27 00         [24]  852 	mov	(_setup_tx_len + 1),#0x00
                                    853 ;	src/usb_hid.c:185: break;
                                    854 ;	src/usb_hid.c:186: case 0x22: // HID Report Descriptor
      0031AE 80 24            [24]  855 	sjmp	00123$
      0031B0                        856 00110$:
                                    857 ;	src/usb_hid.c:187: setup_tx_ptr = ReportDesc;
      0031B0 75 24 C6         [24]  858 	mov	_setup_tx_ptr,#_ReportDesc
      0031B3 75 25 34         [24]  859 	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
                                    860 ;	src/usb_hid.c:188: setup_tx_len = sizeof(ReportDesc);
      0031B6 75 26 22         [24]  861 	mov	_setup_tx_len,#0x22
      0031B9 75 27 00         [24]  862 	mov	(_setup_tx_len + 1),#0x00
                                    863 ;	src/usb_hid.c:191: break;
                                    864 ;	src/usb_hid.c:193: case USB_SET_ADDRESS:
      0031BC 80 16            [24]  865 	sjmp	00123$
      0031BE                        866 00112$:
                                    867 ;	src/usb_hid.c:194: usb_dev_addr = (uint8_t)value;
      0031BE 8C 22            [24]  868 	mov	_usb_dev_addr,r4
                                    869 ;	src/usb_hid.c:195: break;
                                    870 ;	src/usb_hid.c:197: case USB_SET_CONFIGURATION:
      0031C0 80 12            [24]  871 	sjmp	00123$
      0031C2                        872 00113$:
                                    873 ;	src/usb_hid.c:198: usb_config = (uint8_t)value;
      0031C2 8C 23            [24]  874 	mov	_usb_config,r4
                                    875 ;	src/usb_hid.c:199: break;
                                    876 ;	src/usb_hid.c:201: case USB_GET_STATUS:
      0031C4 80 0E            [24]  877 	sjmp	00123$
      0031C6                        878 00114$:
                                    879 ;	src/usb_hid.c:202: Ep0Buffer[0] = 0x00;
      0031C6 90 00 00         [24]  880 	mov	dptr,#_Ep0Buffer
      0031C9 E4               [12]  881 	clr	a
      0031CA F0               [24]  882 	movx	@dptr,a
                                    883 ;	src/usb_hid.c:203: Ep0Buffer[1] = 0x00;
      0031CB 90 00 01         [24]  884 	mov	dptr,#(_Ep0Buffer + 0x0001)
      0031CE F0               [24]  885 	movx	@dptr,a
                                    886 ;	src/usb_hid.c:204: setup_tx_len = 2;
      0031CF 75 26 02         [24]  887 	mov	_setup_tx_len,#0x02
      0031D2 F5 27            [12]  888 	mov	(_setup_tx_len + 1),a
                                    889 ;	src/usb_hid.c:213: }
      0031D4                        890 00123$:
                                    891 ;	src/usb_hid.c:216: if (setup_tx_len > length) {
      0031D4 C3               [12]  892 	clr	c
      0031D5 EB               [12]  893 	mov	a,r3
      0031D6 95 26            [12]  894 	subb	a,_setup_tx_len
      0031D8 EA               [12]  895 	mov	a,r2
      0031D9 95 27            [12]  896 	subb	a,(_setup_tx_len + 1)
      0031DB 50 04            [24]  897 	jnc	00125$
                                    898 ;	free result
                                    899 ;	src/usb_hid.c:217: setup_tx_len = length;
      0031DD 8B 26            [24]  900 	mov	_setup_tx_len,r3
      0031DF 8A 27            [24]  901 	mov	(_setup_tx_len + 1),r2
      0031E1                        902 00125$:
                                    903 ;	src/usb_hid.c:220: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      0031E1 AE 26            [24]  904 	mov	r6,_setup_tx_len
      0031E3 AF 27            [24]  905 	mov	r7,(_setup_tx_len + 1)
      0031E5 C3               [12]  906 	clr	c
      0031E6 74 40            [12]  907 	mov	a,#0x40
      0031E8 9E               [12]  908 	subb	a,r6
      0031E9 E4               [12]  909 	clr	a
      0031EA 9F               [12]  910 	subb	a,r7
      0031EB 50 04            [24]  911 	jnc	00131$
                                    912 ;	free result
      0031ED 7F 40            [12]  913 	mov	r7,#0x40
      0031EF 80 04            [24]  914 	sjmp	00132$
      0031F1                        915 00131$:
      0031F1 AE 26            [24]  916 	mov	r6,_setup_tx_len
      0031F3 8E 07            [24]  917 	mov	ar7,r6
      0031F5                        918 00132$:
                                    919 ;	src/usb_hid.c:221: if (setup_tx_ptr && send_len > 0) {
      0031F5 E5 24            [12]  920 	mov	a,_setup_tx_ptr
      0031F7 45 25            [12]  921 	orl	a,(_setup_tx_ptr + 1)
      0031F9 60 3B            [24]  922 	jz	00127$
      0031FB EF               [12]  923 	mov	a,r7
      0031FC 60 38            [24]  924 	jz	00127$
                                    925 ;	src/usb_hid.c:222: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      0031FE 85 24 29         [24]  926 	mov	___memcpy_PARM_2,_setup_tx_ptr
      003201 85 25 2A         [24]  927 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      003204 75 2B 80         [24]  928 	mov	(___memcpy_PARM_2 + 2),#0x80
      003207 8F 2C            [24]  929 	mov	___memcpy_PARM_3,r7
      003209 75 2D 00         [24]  930 	mov	(___memcpy_PARM_3 + 1),#0x00
      00320C 90 00 00         [24]  931 	mov	dptr,#_Ep0Buffer
      00320F 75 F0 00         [24]  932 	mov	b, #0x00
      003212 C0 07            [24]  933 	push	ar7
      003214 12 34 05         [24]  934 	lcall	___memcpy
      003217 D0 07            [24]  935 	pop	ar7
                                    936 ;	src/usb_hid.c:223: setup_tx_ptr += send_len;
      003219 EF               [12]  937 	mov	a,r7
      00321A 25 24            [12]  938 	add	a, _setup_tx_ptr
      00321C F5 24            [12]  939 	mov	_setup_tx_ptr,a
      00321E E4               [12]  940 	clr	a
      00321F 35 25            [12]  941 	addc	a, (_setup_tx_ptr + 1)
      003221 F5 25            [12]  942 	mov	(_setup_tx_ptr + 1),a
                                    943 ;	src/usb_hid.c:224: setup_tx_len -= send_len;
      003223 8F 05            [24]  944 	mov	ar5,r7
      003225 7E 00            [12]  945 	mov	r6,#0x00
      003227 AB 26            [24]  946 	mov	r3,_setup_tx_len
      003229 AC 27            [24]  947 	mov	r4,(_setup_tx_len + 1)
      00322B EB               [12]  948 	mov	a,r3
      00322C C3               [12]  949 	clr	c
      00322D 9D               [12]  950 	subb	a,r5
      00322E FB               [12]  951 	mov	r3,a
      00322F EC               [12]  952 	mov	a,r4
      003230 9E               [12]  953 	subb	a,r6
      003231 FC               [12]  954 	mov	r4,a
      003232 8B 26            [24]  955 	mov	_setup_tx_len,r3
      003234 8C 27            [24]  956 	mov	(_setup_tx_len + 1),r4
      003236                        957 00127$:
                                    958 ;	src/usb_hid.c:227: UEP0_T_LEN = send_len;
      003236 8F DD            [24]  959 	mov	_UEP0_T_LEN,r7
                                    960 ;	src/usb_hid.c:228: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
      003238 75 DC C0         [24]  961 	mov	_UEP0_CTRL,#0xc0
                                    962 ;	src/usb_hid.c:229: }
      00323B 22               [24]  963 	ret
                                    964 ;------------------------------------------------------------
                                    965 ;Allocation info for local variables in function 'USB_Process'
                                    966 ;------------------------------------------------------------
                                    967 ;token         Allocated to registers r7 
                                    968 ;endp          Allocated to registers r5 
                                    969 ;send_len      Allocated to registers r6 
                                    970 ;------------------------------------------------------------
                                    971 ;	src/usb_hid.c:231: void USB_Process(void) {
                                    972 ;	-----------------------------------------
                                    973 ;	 function USB_Process
                                    974 ;	-----------------------------------------
      00323C                        975 _USB_Process:
                                    976 ;	src/usb_hid.c:232: if (UIF_BUS_RST) {
      00323C 30 D8 0F         [24]  977 	jnb	_UIF_BUS_RST,00102$
                                    978 ;	src/usb_hid.c:233: USB_DEV_AD = 0x00;
      00323F 75 E3 00         [24]  979 	mov	_USB_DEV_AD,#0x00
                                    980 ;	src/usb_hid.c:234: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      003242 75 DC 02         [24]  981 	mov	_UEP0_CTRL,#0x02
                                    982 ;	src/usb_hid.c:235: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      003245 75 D2 12         [24]  983 	mov	_UEP1_CTRL,#0x12
                                    984 ;	src/usb_hid.c:236: UIF_BUS_RST = 0; // Clear reset flag
                                    985 ;	assignBit
      003248 C2 D8            [12]  986 	clr	_UIF_BUS_RST
                                    987 ;	src/usb_hid.c:237: rx_ready = 0;
      00324A 75 21 00         [24]  988 	mov	_rx_ready,#0x00
                                    989 ;	src/usb_hid.c:238: return;
      00324D 22               [24]  990 	ret
      00324E                        991 00102$:
                                    992 ;	src/usb_hid.c:241: if (UIF_TRANSFER) {
      00324E 20 D9 01         [24]  993 	jb	_UIF_TRANSFER,00225$
      003251 22               [24]  994 	ret
      003252                        995 00225$:
                                    996 ;	src/usb_hid.c:242: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
      003252 E5 D9            [12]  997 	mov	a,_USB_INT_ST
      003254 54 30            [12]  998 	anl	a,#0x30
      003256 FF               [12]  999 	mov	r7,a
                                   1000 ;	src/usb_hid.c:243: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
      003257 E5 D9            [12] 1001 	mov	a,_USB_INT_ST
      003259 54 0F            [12] 1002 	anl	a,#0x0f
                                   1003 ;	src/usb_hid.c:245: if (endp == 0) { // Endpoint 0
      00325B FD               [12] 1004 	mov	r5,a
      00325C 60 03            [24] 1005 	jz	00226$
      00325E 02 32 E4         [24] 1006 	ljmp	00125$
      003261                       1007 00226$:
                                   1008 ;	src/usb_hid.c:246: if (token == UIS_TOKEN_SETUP) {
      003261 BF 30 06         [24] 1009 	cjne	r7,#0x30,00115$
                                   1010 ;	src/usb_hid.c:247: Handle_EP0_Setup();
      003264 12 30 CB         [24] 1011 	lcall	_Handle_EP0_Setup
      003267 02 33 05         [24] 1012 	ljmp	00126$
      00326A                       1013 00115$:
                                   1014 ;	src/usb_hid.c:248: } else if (token == UIS_TOKEN_IN) {
      00326A BF 20 6F         [24] 1015 	cjne	r7,#0x20,00112$
                                   1016 ;	src/usb_hid.c:249: if (usb_dev_addr != 0 && USB_DEV_AD == 0) {
      00326D E5 22            [12] 1017 	mov	a,_usb_dev_addr
      00326F 60 07            [24] 1018 	jz	00104$
      003271 E5 E3            [12] 1019 	mov	a,_USB_DEV_AD
      003273 70 03            [24] 1020 	jnz	00104$
                                   1021 ;	src/usb_hid.c:250: USB_DEV_AD = usb_dev_addr;
      003275 85 22 E3         [24] 1022 	mov	_USB_DEV_AD,_usb_dev_addr
      003278                       1023 00104$:
                                   1024 ;	src/usb_hid.c:252: if (setup_tx_len > 0) {
      003278 E5 26            [12] 1025 	mov	a,_setup_tx_len
      00327A 45 27            [12] 1026 	orl	a,(_setup_tx_len + 1)
      00327C 60 56            [24] 1027 	jz	00107$
                                   1028 ;	src/usb_hid.c:253: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      00327E AC 26            [24] 1029 	mov	r4,_setup_tx_len
      003280 AE 27            [24] 1030 	mov	r6,(_setup_tx_len + 1)
      003282 C3               [12] 1031 	clr	c
      003283 74 40            [12] 1032 	mov	a,#0x40
      003285 9C               [12] 1033 	subb	a,r4
      003286 E4               [12] 1034 	clr	a
      003287 9E               [12] 1035 	subb	a,r6
      003288 50 04            [24] 1036 	jnc	00131$
                                   1037 ;	free result
      00328A 7E 40            [12] 1038 	mov	r6,#0x40
      00328C 80 04            [24] 1039 	sjmp	00132$
      00328E                       1040 00131$:
      00328E AC 26            [24] 1041 	mov	r4,_setup_tx_len
      003290 8C 06            [24] 1042 	mov	ar6,r4
      003292                       1043 00132$:
                                   1044 ;	src/usb_hid.c:254: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      003292 85 24 29         [24] 1045 	mov	___memcpy_PARM_2,_setup_tx_ptr
      003295 85 25 2A         [24] 1046 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      003298 75 2B 80         [24] 1047 	mov	(___memcpy_PARM_2 + 2),#0x80
      00329B 8E 2C            [24] 1048 	mov	___memcpy_PARM_3,r6
      00329D 75 2D 00         [24] 1049 	mov	(___memcpy_PARM_3 + 1),#0x00
      0032A0 90 00 00         [24] 1050 	mov	dptr,#_Ep0Buffer
      0032A3 75 F0 00         [24] 1051 	mov	b, #0x00
      0032A6 C0 06            [24] 1052 	push	ar6
      0032A8 12 34 05         [24] 1053 	lcall	___memcpy
      0032AB D0 06            [24] 1054 	pop	ar6
                                   1055 ;	src/usb_hid.c:255: setup_tx_ptr += send_len;
      0032AD EE               [12] 1056 	mov	a,r6
      0032AE 25 24            [12] 1057 	add	a, _setup_tx_ptr
      0032B0 F5 24            [12] 1058 	mov	_setup_tx_ptr,a
      0032B2 E4               [12] 1059 	clr	a
      0032B3 35 25            [12] 1060 	addc	a, (_setup_tx_ptr + 1)
      0032B5 F5 25            [12] 1061 	mov	(_setup_tx_ptr + 1),a
                                   1062 ;	src/usb_hid.c:256: setup_tx_len -= send_len;
      0032B7 8E 03            [24] 1063 	mov	ar3,r6
      0032B9 7C 00            [12] 1064 	mov	r4,#0x00
      0032BB A9 26            [24] 1065 	mov	r1,_setup_tx_len
      0032BD AA 27            [24] 1066 	mov	r2,(_setup_tx_len + 1)
      0032BF E9               [12] 1067 	mov	a,r1
      0032C0 C3               [12] 1068 	clr	c
      0032C1 9B               [12] 1069 	subb	a,r3
      0032C2 F9               [12] 1070 	mov	r1,a
      0032C3 EA               [12] 1071 	mov	a,r2
      0032C4 9C               [12] 1072 	subb	a,r4
      0032C5 FA               [12] 1073 	mov	r2,a
      0032C6 89 26            [24] 1074 	mov	_setup_tx_len,r1
      0032C8 8A 27            [24] 1075 	mov	(_setup_tx_len + 1),r2
                                   1076 ;	src/usb_hid.c:257: UEP0_T_LEN = send_len;
      0032CA 8E DD            [24] 1077 	mov	_UEP0_T_LEN,r6
                                   1078 ;	src/usb_hid.c:258: UEP0_CTRL ^= bUEP_T_TOG;
      0032CC 63 DC 40         [24] 1079 	xrl	_UEP0_CTRL,#0x40
                                   1080 ;	src/usb_hid.c:259: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      0032CF 53 DC FC         [24] 1081 	anl	_UEP0_CTRL,#0xfc
      0032D2 80 31            [24] 1082 	sjmp	00126$
      0032D4                       1083 00107$:
                                   1084 ;	src/usb_hid.c:261: UEP0_T_LEN = 0;
      0032D4 75 DD 00         [24] 1085 	mov	_UEP0_T_LEN,#0x00
                                   1086 ;	src/usb_hid.c:262: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0032D7 75 DC 02         [24] 1087 	mov	_UEP0_CTRL,#0x02
      0032DA 80 29            [24] 1088 	sjmp	00126$
      0032DC                       1089 00112$:
                                   1090 ;	src/usb_hid.c:264: } else if (token == UIS_TOKEN_OUT) {
      0032DC EF               [12] 1091 	mov	a,r7
      0032DD 70 26            [24] 1092 	jnz	00126$
                                   1093 ;	src/usb_hid.c:265: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0032DF 75 DC 02         [24] 1094 	mov	_UEP0_CTRL,#0x02
      0032E2 80 21            [24] 1095 	sjmp	00126$
      0032E4                       1096 00125$:
                                   1097 ;	src/usb_hid.c:267: } else if (endp == 1) { // Endpoint 1 (HID Data)
      0032E4 BD 01 1E         [24] 1098 	cjne	r5,#0x01,00126$
                                   1099 ;	src/usb_hid.c:268: if (token == UIS_TOKEN_OUT) {
      0032E7 EF               [12] 1100 	mov	a,r7
      0032E8 70 0D            [24] 1101 	jnz	00120$
                                   1102 ;	src/usb_hid.c:269: rx_ready = 1;
      0032EA 75 21 01         [24] 1103 	mov	_rx_ready,#0x01
                                   1104 ;	src/usb_hid.c:270: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_NAK;
      0032ED 74 F3            [12] 1105 	mov	a,#0xf3
      0032EF 55 D2            [12] 1106 	anl	a,_UEP1_CTRL
      0032F1 44 08            [12] 1107 	orl	a,#0x08
      0032F3 F5 D2            [12] 1108 	mov	_UEP1_CTRL,a
      0032F5 80 0E            [24] 1109 	sjmp	00126$
      0032F7                       1110 00120$:
                                   1111 ;	src/usb_hid.c:271: } else if (token == UIS_TOKEN_IN) {
      0032F7 BF 20 0B         [24] 1112 	cjne	r7,#0x20,00126$
                                   1113 ;	src/usb_hid.c:272: UEP1_T_LEN = 0;
      0032FA 75 D3 00         [24] 1114 	mov	_UEP1_T_LEN,#0x00
                                   1115 ;	src/usb_hid.c:273: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
      0032FD 74 FC            [12] 1116 	mov	a,#0xfc
      0032FF 55 D2            [12] 1117 	anl	a,_UEP1_CTRL
      003301 44 02            [12] 1118 	orl	a,#0x02
      003303 F5 D2            [12] 1119 	mov	_UEP1_CTRL,a
      003305                       1120 00126$:
                                   1121 ;	src/usb_hid.c:277: UIF_TRANSFER = 0; // Clear transfer flag
                                   1122 ;	assignBit
      003305 C2 D9            [12] 1123 	clr	_UIF_TRANSFER
                                   1124 ;	src/usb_hid.c:279: }
      003307 22               [24] 1125 	ret
                                   1126 ;------------------------------------------------------------
                                   1127 ;Allocation info for local variables in function 'USB_Available'
                                   1128 ;------------------------------------------------------------
                                   1129 ;	src/usb_hid.c:281: uint8_t USB_Available(void) {
                                   1130 ;	-----------------------------------------
                                   1131 ;	 function USB_Available
                                   1132 ;	-----------------------------------------
      003308                       1133 _USB_Available:
                                   1134 ;	src/usb_hid.c:282: return rx_ready;
      003308 85 21 82         [24] 1135 	mov	dpl, _rx_ready
                                   1136 ;	src/usb_hid.c:283: }
      00330B 22               [24] 1137 	ret
                                   1138 ;------------------------------------------------------------
                                   1139 ;Allocation info for local variables in function 'USB_GetRxBuffer'
                                   1140 ;------------------------------------------------------------
                                   1141 ;	src/usb_hid.c:285: uint8_t *USB_GetRxBuffer(void) {
                                   1142 ;	-----------------------------------------
                                   1143 ;	 function USB_GetRxBuffer
                                   1144 ;	-----------------------------------------
      00330C                       1145 _USB_GetRxBuffer:
                                   1146 ;	src/usb_hid.c:286: return &Ep1Buffer[0];
      00330C 90 00 40         [24] 1147 	mov	dptr,#_Ep1Buffer
      00330F 75 F0 00         [24] 1148 	mov	b, #0x00
                                   1149 ;	src/usb_hid.c:287: }
      003312 22               [24] 1150 	ret
                                   1151 ;------------------------------------------------------------
                                   1152 ;Allocation info for local variables in function 'USB_ReleaseRx'
                                   1153 ;------------------------------------------------------------
                                   1154 ;	src/usb_hid.c:289: void USB_ReleaseRx(void) {
                                   1155 ;	-----------------------------------------
                                   1156 ;	 function USB_ReleaseRx
                                   1157 ;	-----------------------------------------
      003313                       1158 _USB_ReleaseRx:
                                   1159 ;	src/usb_hid.c:290: rx_ready = 0;
      003313 75 21 00         [24] 1160 	mov	_rx_ready,#0x00
                                   1161 ;	src/usb_hid.c:291: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_ACK;
      003316 53 D2 F3         [24] 1162 	anl	_UEP1_CTRL,#0xf3
                                   1163 ;	src/usb_hid.c:292: }
      003319 22               [24] 1164 	ret
                                   1165 ;------------------------------------------------------------
                                   1166 ;Allocation info for local variables in function 'USB_SendReport'
                                   1167 ;------------------------------------------------------------
                                   1168 ;len           Allocated with name '_USB_SendReport_PARM_2'
                                   1169 ;buf           Allocated to registers r5 r6 r7 
                                   1170 ;------------------------------------------------------------
                                   1171 ;	src/usb_hid.c:294: void USB_SendReport(const uint8_t *buf, uint8_t len) {
                                   1172 ;	-----------------------------------------
                                   1173 ;	 function USB_SendReport
                                   1174 ;	-----------------------------------------
      00331A                       1175 _USB_SendReport:
      00331A AD 82            [24] 1176 	mov	r5, dpl
      00331C AE 83            [24] 1177 	mov	r6, dph
      00331E AF F0            [24] 1178 	mov	r7, b
                                   1179 ;	src/usb_hid.c:295: memcpy(&Ep1Buffer[64], buf, len);
      003320 8D 29            [24] 1180 	mov	___memcpy_PARM_2,r5
      003322 8E 2A            [24] 1181 	mov	(___memcpy_PARM_2 + 1),r6
      003324 8F 2B            [24] 1182 	mov	(___memcpy_PARM_2 + 2),r7
      003326 85 28 2C         [24] 1183 	mov	___memcpy_PARM_3,_USB_SendReport_PARM_2
      003329 75 2D 00         [24] 1184 	mov	(___memcpy_PARM_3 + 1),#0x00
      00332C 90 00 80         [24] 1185 	mov	dptr,#(_Ep1Buffer + 0x0040)
      00332F 75 F0 00         [24] 1186 	mov	b, #0x00
      003332 12 34 05         [24] 1187 	lcall	___memcpy
                                   1188 ;	src/usb_hid.c:296: UEP1_T_LEN = len;
      003335 85 28 D3         [24] 1189 	mov	_UEP1_T_LEN,_USB_SendReport_PARM_2
                                   1190 ;	src/usb_hid.c:297: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      003338 53 D2 FC         [24] 1191 	anl	_UEP1_CTRL,#0xfc
                                   1192 ;	src/usb_hid.c:298: }
      00333B 22               [24] 1193 	ret
                                   1194 ;------------------------------------------------------------
                                   1195 ;Allocation info for local variables in function 'USB_Shutdown'
                                   1196 ;------------------------------------------------------------
                                   1197 ;	src/usb_hid.c:300: void USB_Shutdown(void) {
                                   1198 ;	-----------------------------------------
                                   1199 ;	 function USB_Shutdown
                                   1200 ;	-----------------------------------------
      00333C                       1201 _USB_Shutdown:
                                   1202 ;	src/usb_hid.c:301: USB_CTRL = 0x00;
      00333C 75 E2 00         [24] 1203 	mov	_USB_CTRL,#0x00
                                   1204 ;	src/usb_hid.c:302: UDEV_CTRL = 0x00;
      00333F 75 D1 00         [24] 1205 	mov	_UDEV_CTRL,#0x00
                                   1206 ;	src/usb_hid.c:303: }
      003342 22               [24] 1207 	ret
                                   1208 	.area CSEG    (CODE)
                                   1209 	.area CONST   (CODE)
                                   1210 	.area CONST   (CODE)
      0034B4                       1211 _DevDesc:
      0034B4 12                    1212 	.db #0x12	; 18
      0034B5 01                    1213 	.db #0x01	; 1
      0034B6 10                    1214 	.db #0x10	; 16
      0034B7 01                    1215 	.db #0x01	; 1
      0034B8 00                    1216 	.db #0x00	; 0
      0034B9 00                    1217 	.db #0x00	; 0
      0034BA 00                    1218 	.db #0x00	; 0
      0034BB 40                    1219 	.db #0x40	; 64
      0034BC 09                    1220 	.db #0x09	; 9
      0034BD 12                    1221 	.db #0x12	; 18
      0034BE 5D                    1222 	.db #0x5d	; 93
      0034BF C5                    1223 	.db #0xc5	; 197
      0034C0 00                    1224 	.db #0x00	; 0
      0034C1 01                    1225 	.db #0x01	; 1
      0034C2 01                    1226 	.db #0x01	; 1
      0034C3 02                    1227 	.db #0x02	; 2
      0034C4 03                    1228 	.db #0x03	; 3
      0034C5 01                    1229 	.db #0x01	; 1
                                   1230 	.area CSEG    (CODE)
                                   1231 	.area CONST   (CODE)
      0034C6                       1232 _ReportDesc:
      0034C6 06                    1233 	.db #0x06	; 6
      0034C7 00                    1234 	.db #0x00	; 0
      0034C8 FF                    1235 	.db #0xff	; 255
      0034C9 09                    1236 	.db #0x09	; 9
      0034CA 01                    1237 	.db #0x01	; 1
      0034CB A1                    1238 	.db #0xa1	; 161
      0034CC 01                    1239 	.db #0x01	; 1
      0034CD 09                    1240 	.db #0x09	; 9
      0034CE 02                    1241 	.db #0x02	; 2
      0034CF 15                    1242 	.db #0x15	; 21
      0034D0 00                    1243 	.db #0x00	; 0
      0034D1 26                    1244 	.db #0x26	; 38
      0034D2 FF                    1245 	.db #0xff	; 255
      0034D3 00                    1246 	.db #0x00	; 0
      0034D4 75                    1247 	.db #0x75	; 117	'u'
      0034D5 08                    1248 	.db #0x08	; 8
      0034D6 95                    1249 	.db #0x95	; 149
      0034D7 40                    1250 	.db #0x40	; 64
      0034D8 91                    1251 	.db #0x91	; 145
      0034D9 02                    1252 	.db #0x02	; 2
      0034DA 09                    1253 	.db #0x09	; 9
      0034DB 03                    1254 	.db #0x03	; 3
      0034DC 15                    1255 	.db #0x15	; 21
      0034DD 00                    1256 	.db #0x00	; 0
      0034DE 26                    1257 	.db #0x26	; 38
      0034DF FF                    1258 	.db #0xff	; 255
      0034E0 00                    1259 	.db #0x00	; 0
      0034E1 75                    1260 	.db #0x75	; 117	'u'
      0034E2 08                    1261 	.db #0x08	; 8
      0034E3 95                    1262 	.db #0x95	; 149
      0034E4 40                    1263 	.db #0x40	; 64
      0034E5 81                    1264 	.db #0x81	; 129
      0034E6 02                    1265 	.db #0x02	; 2
      0034E7 C0                    1266 	.db #0xc0	; 192
                                   1267 	.area CSEG    (CODE)
                                   1268 	.area CONST   (CODE)
      0034E8                       1269 _CfgDesc:
      0034E8 09                    1270 	.db #0x09	; 9
      0034E9 02                    1271 	.db #0x02	; 2
      0034EA 29                    1272 	.db #0x29	; 41
      0034EB 00                    1273 	.db #0x00	; 0
      0034EC 01                    1274 	.db #0x01	; 1
      0034ED 01                    1275 	.db #0x01	; 1
      0034EE 00                    1276 	.db #0x00	; 0
      0034EF 80                    1277 	.db #0x80	; 128
      0034F0 32                    1278 	.db #0x32	; 50	'2'
      0034F1 09                    1279 	.db #0x09	; 9
      0034F2 04                    1280 	.db #0x04	; 4
      0034F3 00                    1281 	.db #0x00	; 0
      0034F4 00                    1282 	.db #0x00	; 0
      0034F5 02                    1283 	.db #0x02	; 2
      0034F6 03                    1284 	.db #0x03	; 3
      0034F7 00                    1285 	.db #0x00	; 0
      0034F8 00                    1286 	.db #0x00	; 0
      0034F9 00                    1287 	.db #0x00	; 0
      0034FA 09                    1288 	.db #0x09	; 9
      0034FB 21                    1289 	.db #0x21	; 33
      0034FC 11                    1290 	.db #0x11	; 17
      0034FD 01                    1291 	.db #0x01	; 1
      0034FE 00                    1292 	.db #0x00	; 0
      0034FF 01                    1293 	.db #0x01	; 1
      003500 22                    1294 	.db #0x22	; 34
      003501 22                    1295 	.db #0x22	; 34
      003502 00                    1296 	.db #0x00	; 0
      003503 07                    1297 	.db #0x07	; 7
      003504 05                    1298 	.db #0x05	; 5
      003505 01                    1299 	.db #0x01	; 1
      003506 03                    1300 	.db #0x03	; 3
      003507 40                    1301 	.db #0x40	; 64
      003508 00                    1302 	.db #0x00	; 0
      003509 01                    1303 	.db #0x01	; 1
      00350A 07                    1304 	.db #0x07	; 7
      00350B 05                    1305 	.db #0x05	; 5
      00350C 81                    1306 	.db #0x81	; 129
      00350D 03                    1307 	.db #0x03	; 3
      00350E 40                    1308 	.db #0x40	; 64
      00350F 00                    1309 	.db #0x00	; 0
      003510 01                    1310 	.db #0x01	; 1
                                   1311 	.area CSEG    (CODE)
                                   1312 	.area CONST   (CODE)
      003511                       1313 _Str0Desc:
      003511 04                    1314 	.db #0x04	; 4
      003512 03                    1315 	.db #0x03	; 3
      003513 09                    1316 	.db #0x09	; 9
      003514 04                    1317 	.db #0x04	; 4
                                   1318 	.area CSEG    (CODE)
                                   1319 	.area CONST   (CODE)
      003515                       1320 _Str1Desc:
      003515 0E                    1321 	.db #0x0e	; 14
      003516 03                    1322 	.db #0x03	; 3
      003517 44                    1323 	.db #0x44	; 68	'D'
      003518 00                    1324 	.db #0x00	; 0
      003519 65                    1325 	.db #0x65	; 101	'e'
      00351A 00                    1326 	.db #0x00	; 0
      00351B 76                    1327 	.db #0x76	; 118	'v'
      00351C 00                    1328 	.db #0x00	; 0
      00351D 42                    1329 	.db #0x42	; 66	'B'
      00351E 00                    1330 	.db #0x00	; 0
      00351F 6F                    1331 	.db #0x6f	; 111	'o'
      003520 00                    1332 	.db #0x00	; 0
      003521 78                    1333 	.db #0x78	; 120	'x'
      003522 00                    1334 	.db #0x00	; 0
                                   1335 	.area CSEG    (CODE)
                                   1336 	.area CONST   (CODE)
      003523                       1337 _Str2Desc:
      003523 24                    1338 	.db #0x24	; 36
      003524 03                    1339 	.db #0x03	; 3
      003525 43                    1340 	.db #0x43	; 67	'C'
      003526 00                    1341 	.db #0x00	; 0
      003527 48                    1342 	.db #0x48	; 72	'H'
      003528 00                    1343 	.db #0x00	; 0
      003529 35                    1344 	.db #0x35	; 53	'5'
      00352A 00                    1345 	.db #0x00	; 0
      00352B 35                    1346 	.db #0x35	; 53	'5'
      00352C 00                    1347 	.db #0x00	; 0
      00352D 32                    1348 	.db #0x32	; 50	'2'
      00352E 00                    1349 	.db #0x00	; 0
      00352F 20                    1350 	.db #0x20	; 32
      003530 00                    1351 	.db #0x00	; 0
      003531 48                    1352 	.db #0x48	; 72	'H'
      003532 00                    1353 	.db #0x00	; 0
      003533 49                    1354 	.db #0x49	; 73	'I'
      003534 00                    1355 	.db #0x00	; 0
      003535 44                    1356 	.db #0x44	; 68	'D'
      003536 00                    1357 	.db #0x00	; 0
      003537 20                    1358 	.db #0x20	; 32
      003538 00                    1359 	.db #0x00	; 0
      003539 46                    1360 	.db #0x46	; 70	'F'
      00353A 00                    1361 	.db #0x00	; 0
      00353B 6C                    1362 	.db #0x6c	; 108	'l'
      00353C 00                    1363 	.db #0x00	; 0
      00353D 61                    1364 	.db #0x61	; 97	'a'
      00353E 00                    1365 	.db #0x00	; 0
      00353F 73                    1366 	.db #0x73	; 115	's'
      003540 00                    1367 	.db #0x00	; 0
      003541 68                    1368 	.db #0x68	; 104	'h'
      003542 00                    1369 	.db #0x00	; 0
      003543 65                    1370 	.db #0x65	; 101	'e'
      003544 00                    1371 	.db #0x00	; 0
      003545 72                    1372 	.db #0x72	; 114	'r'
      003546 00                    1373 	.db #0x00	; 0
                                   1374 	.area CSEG    (CODE)
                                   1375 	.area CONST   (CODE)
      003547                       1376 _Str3Desc:
      003547 0A                    1377 	.db #0x0a	; 10
      003548 03                    1378 	.db #0x03	; 3
      003549 76                    1379 	.db #0x76	; 118	'v'
      00354A 00                    1380 	.db #0x00	; 0
      00354B 31                    1381 	.db #0x31	; 49	'1'
      00354C 00                    1382 	.db #0x00	; 0
      00354D 2E                    1383 	.db #0x2e	; 46
      00354E 00                    1384 	.db #0x00	; 0
      00354F 30                    1385 	.db #0x30	; 48	'0'
      003550 00                    1386 	.db #0x00	; 0
                                   1387 	.area CSEG    (CODE)
                                   1388 	.area XINIT   (CODE)
                                   1389 	.area CABS    (ABS,CODE)
