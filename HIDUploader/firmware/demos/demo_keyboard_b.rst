                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.6.0 #16555 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module demo_keyboard_b
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _SendKey
                                     13 	.globl _USB_Process
                                     14 	.globl _USB_Init
                                     15 	.globl ___memcpy
                                     16 	.globl _memset
                                     17 	.globl _UIF_BUS_RST
                                     18 	.globl _UIF_DETECT
                                     19 	.globl _UIF_TRANSFER
                                     20 	.globl _UIF_SUSPEND
                                     21 	.globl _UIF_HST_SOF
                                     22 	.globl _UIF_FIFO_OV
                                     23 	.globl _U_SIE_FREE
                                     24 	.globl _U_TOG_OK
                                     25 	.globl _U_IS_NAK
                                     26 	.globl _ADC_CHAN0
                                     27 	.globl _ADC_CHAN1
                                     28 	.globl _CMP_CHAN
                                     29 	.globl _ADC_START
                                     30 	.globl _ADC_IF
                                     31 	.globl _CMP_IF
                                     32 	.globl _CMPO
                                     33 	.globl _U1RI
                                     34 	.globl _U1TI
                                     35 	.globl _U1RB8
                                     36 	.globl _U1TB8
                                     37 	.globl _U1REN
                                     38 	.globl _U1SMOD
                                     39 	.globl _U1SM0
                                     40 	.globl _S0_R_FIFO
                                     41 	.globl _S0_T_FIFO
                                     42 	.globl _S0_FREE
                                     43 	.globl _S0_IF_BYTE
                                     44 	.globl _S0_IF_FIRST
                                     45 	.globl _S0_IF_OV
                                     46 	.globl _S0_FST_ACT
                                     47 	.globl _CP_RL2
                                     48 	.globl _C_T2
                                     49 	.globl _TR2
                                     50 	.globl _EXEN2
                                     51 	.globl _TCLK
                                     52 	.globl _RCLK
                                     53 	.globl _EXF2
                                     54 	.globl _CAP1F
                                     55 	.globl _TF2
                                     56 	.globl _RI
                                     57 	.globl _TI
                                     58 	.globl _RB8
                                     59 	.globl _TB8
                                     60 	.globl _REN
                                     61 	.globl _SM2
                                     62 	.globl _SM1
                                     63 	.globl _SM0
                                     64 	.globl _IT0
                                     65 	.globl _IE0
                                     66 	.globl _IT1
                                     67 	.globl _IE1
                                     68 	.globl _TR0
                                     69 	.globl _TF0
                                     70 	.globl _TR1
                                     71 	.globl _TF1
                                     72 	.globl _P3_0
                                     73 	.globl _P3_1
                                     74 	.globl _P3_2
                                     75 	.globl _P3_3
                                     76 	.globl _P3_4
                                     77 	.globl _P3_5
                                     78 	.globl _P3_6
                                     79 	.globl _P3_7
                                     80 	.globl _RXD
                                     81 	.globl _PWM1_
                                     82 	.globl _TXD
                                     83 	.globl _PWM2_
                                     84 	.globl _AIN3
                                     85 	.globl _VBUS1
                                     86 	.globl _INT0
                                     87 	.globl _TXD1_
                                     88 	.globl _INT1
                                     89 	.globl _T0
                                     90 	.globl _RXD1_
                                     91 	.globl _PWM2
                                     92 	.globl _T1
                                     93 	.globl _UDP
                                     94 	.globl _UDM
                                     95 	.globl _P1_0
                                     96 	.globl _P1_1
                                     97 	.globl _P1_2
                                     98 	.globl _P1_3
                                     99 	.globl _P1_4
                                    100 	.globl _P1_5
                                    101 	.globl _P1_6
                                    102 	.globl _P1_7
                                    103 	.globl _TIN0
                                    104 	.globl _CAP1
                                    105 	.globl _T2
                                    106 	.globl _AIN0
                                    107 	.globl _VBUS2
                                    108 	.globl _TIN1
                                    109 	.globl _CAP2
                                    110 	.globl _T2EX
                                    111 	.globl _RXD_
                                    112 	.globl _TXD_
                                    113 	.globl _AIN1
                                    114 	.globl _UCC1
                                    115 	.globl _TIN2
                                    116 	.globl _SCS
                                    117 	.globl _CAP1_
                                    118 	.globl _T2_
                                    119 	.globl _AIN2
                                    120 	.globl _UCC2
                                    121 	.globl _TIN3
                                    122 	.globl _PWM1
                                    123 	.globl _MOSI
                                    124 	.globl _TIN4
                                    125 	.globl _RXD1
                                    126 	.globl _MISO
                                    127 	.globl _TIN5
                                    128 	.globl _TXD1
                                    129 	.globl _SCK
                                    130 	.globl _IE_SPI0
                                    131 	.globl _IE_TKEY
                                    132 	.globl _IE_USB
                                    133 	.globl _IE_ADC
                                    134 	.globl _IE_UART1
                                    135 	.globl _IE_PWMX
                                    136 	.globl _IE_GPIO
                                    137 	.globl _IE_WDOG
                                    138 	.globl _PX0
                                    139 	.globl _PT0
                                    140 	.globl _PX1
                                    141 	.globl _PT1
                                    142 	.globl _PS
                                    143 	.globl _PT2
                                    144 	.globl _PL_FLAG
                                    145 	.globl _PH_FLAG
                                    146 	.globl _EX0
                                    147 	.globl _ET0
                                    148 	.globl _EX1
                                    149 	.globl _ET1
                                    150 	.globl _ES
                                    151 	.globl _ET2
                                    152 	.globl _E_DIS
                                    153 	.globl _EA
                                    154 	.globl _P
                                    155 	.globl _F1
                                    156 	.globl _OV
                                    157 	.globl _RS0
                                    158 	.globl _RS1
                                    159 	.globl _F0
                                    160 	.globl _AC
                                    161 	.globl _CY
                                    162 	.globl _UEP1_DMA_H
                                    163 	.globl _UEP1_DMA_L
                                    164 	.globl _UEP1_DMA
                                    165 	.globl _UEP0_DMA_H
                                    166 	.globl _UEP0_DMA_L
                                    167 	.globl _UEP0_DMA
                                    168 	.globl _UEP2_3_MOD
                                    169 	.globl _UEP4_1_MOD
                                    170 	.globl _UEP3_DMA_H
                                    171 	.globl _UEP3_DMA_L
                                    172 	.globl _UEP3_DMA
                                    173 	.globl _UEP2_DMA_H
                                    174 	.globl _UEP2_DMA_L
                                    175 	.globl _UEP2_DMA
                                    176 	.globl _USB_DEV_AD
                                    177 	.globl _USB_CTRL
                                    178 	.globl _USB_INT_EN
                                    179 	.globl _UEP4_T_LEN
                                    180 	.globl _UEP4_CTRL
                                    181 	.globl _UEP0_T_LEN
                                    182 	.globl _UEP0_CTRL
                                    183 	.globl _USB_RX_LEN
                                    184 	.globl _USB_MIS_ST
                                    185 	.globl _USB_INT_ST
                                    186 	.globl _USB_INT_FG
                                    187 	.globl _UEP3_T_LEN
                                    188 	.globl _UEP3_CTRL
                                    189 	.globl _UEP2_T_LEN
                                    190 	.globl _UEP2_CTRL
                                    191 	.globl _UEP1_T_LEN
                                    192 	.globl _UEP1_CTRL
                                    193 	.globl _UDEV_CTRL
                                    194 	.globl _USB_C_CTRL
                                    195 	.globl _TKEY_DATH
                                    196 	.globl _TKEY_DATL
                                    197 	.globl _TKEY_DAT
                                    198 	.globl _TKEY_CTRL
                                    199 	.globl _ADC_DATA
                                    200 	.globl _ADC_CFG
                                    201 	.globl _ADC_CTRL
                                    202 	.globl _SBAUD1
                                    203 	.globl _SBUF1
                                    204 	.globl _SCON1
                                    205 	.globl _SPI0_SETUP
                                    206 	.globl _SPI0_CK_SE
                                    207 	.globl _SPI0_CTRL
                                    208 	.globl _SPI0_DATA
                                    209 	.globl _SPI0_STAT
                                    210 	.globl _PWM_CK_SE
                                    211 	.globl _PWM_CTRL
                                    212 	.globl _PWM_DATA1
                                    213 	.globl _PWM_DATA2
                                    214 	.globl _T2CAP1H
                                    215 	.globl _T2CAP1L
                                    216 	.globl _T2CAP1
                                    217 	.globl _TH2
                                    218 	.globl _TL2
                                    219 	.globl _T2COUNT
                                    220 	.globl _RCAP2H
                                    221 	.globl _RCAP2L
                                    222 	.globl _RCAP2
                                    223 	.globl _T2MOD
                                    224 	.globl _T2CON
                                    225 	.globl _SBUF
                                    226 	.globl _SCON
                                    227 	.globl _TH1
                                    228 	.globl _TH0
                                    229 	.globl _TL1
                                    230 	.globl _TL0
                                    231 	.globl _TMOD
                                    232 	.globl _TCON
                                    233 	.globl _XBUS_AUX
                                    234 	.globl _PIN_FUNC
                                    235 	.globl _P3_DIR_PU
                                    236 	.globl _P3_MOD_OC
                                    237 	.globl _P3
                                    238 	.globl _P2
                                    239 	.globl _P1_DIR_PU
                                    240 	.globl _P1_MOD_OC
                                    241 	.globl _P1
                                    242 	.globl _ROM_CTRL
                                    243 	.globl _ROM_DATA_H
                                    244 	.globl _ROM_DATA_L
                                    245 	.globl _ROM_DATA
                                    246 	.globl _ROM_ADDR_H
                                    247 	.globl _ROM_ADDR_L
                                    248 	.globl _ROM_ADDR
                                    249 	.globl _GPIO_IE
                                    250 	.globl _IP_EX
                                    251 	.globl _IE_EX
                                    252 	.globl _IP
                                    253 	.globl _IE
                                    254 	.globl _WDOG_COUNT
                                    255 	.globl _RESET_KEEP
                                    256 	.globl _WAKE_CTRL
                                    257 	.globl _CLOCK_CFG
                                    258 	.globl _PCON
                                    259 	.globl _GLOBAL_CFG
                                    260 	.globl _SAFE_MOD
                                    261 	.globl _DPH
                                    262 	.globl _DPL
                                    263 	.globl _SP
                                    264 	.globl _B
                                    265 	.globl _ACC
                                    266 	.globl _PSW
                                    267 	.globl _Ep1Buffer
                                    268 	.globl _Ep0Buffer
                                    269 ;--------------------------------------------------------
                                    270 ; special function registers
                                    271 ;--------------------------------------------------------
                                    272 	.area RSEG    (ABS,DATA)
      000000                        273 	.org 0x0000
                           0000D0   274 _PSW	=	0x00d0
                           0000E0   275 _ACC	=	0x00e0
                           0000F0   276 _B	=	0x00f0
                           000081   277 _SP	=	0x0081
                           000082   278 _DPL	=	0x0082
                           000083   279 _DPH	=	0x0083
                           0000A1   280 _SAFE_MOD	=	0x00a1
                           0000B1   281 _GLOBAL_CFG	=	0x00b1
                           000087   282 _PCON	=	0x0087
                           0000B9   283 _CLOCK_CFG	=	0x00b9
                           0000A9   284 _WAKE_CTRL	=	0x00a9
                           0000FE   285 _RESET_KEEP	=	0x00fe
                           0000FF   286 _WDOG_COUNT	=	0x00ff
                           0000A8   287 _IE	=	0x00a8
                           0000B8   288 _IP	=	0x00b8
                           0000E8   289 _IE_EX	=	0x00e8
                           0000E9   290 _IP_EX	=	0x00e9
                           0000C7   291 _GPIO_IE	=	0x00c7
                           008584   292 _ROM_ADDR	=	0x8584
                           000084   293 _ROM_ADDR_L	=	0x0084
                           000085   294 _ROM_ADDR_H	=	0x0085
                           008F8E   295 _ROM_DATA	=	0x8f8e
                           00008E   296 _ROM_DATA_L	=	0x008e
                           00008F   297 _ROM_DATA_H	=	0x008f
                           000086   298 _ROM_CTRL	=	0x0086
                           000090   299 _P1	=	0x0090
                           000092   300 _P1_MOD_OC	=	0x0092
                           000093   301 _P1_DIR_PU	=	0x0093
                           0000A0   302 _P2	=	0x00a0
                           0000B0   303 _P3	=	0x00b0
                           000096   304 _P3_MOD_OC	=	0x0096
                           000097   305 _P3_DIR_PU	=	0x0097
                           0000C6   306 _PIN_FUNC	=	0x00c6
                           0000A2   307 _XBUS_AUX	=	0x00a2
                           000088   308 _TCON	=	0x0088
                           000089   309 _TMOD	=	0x0089
                           00008A   310 _TL0	=	0x008a
                           00008B   311 _TL1	=	0x008b
                           00008C   312 _TH0	=	0x008c
                           00008D   313 _TH1	=	0x008d
                           000098   314 _SCON	=	0x0098
                           000099   315 _SBUF	=	0x0099
                           0000C8   316 _T2CON	=	0x00c8
                           0000C9   317 _T2MOD	=	0x00c9
                           00CBCA   318 _RCAP2	=	0xcbca
                           0000CA   319 _RCAP2L	=	0x00ca
                           0000CB   320 _RCAP2H	=	0x00cb
                           00CDCC   321 _T2COUNT	=	0xcdcc
                           0000CC   322 _TL2	=	0x00cc
                           0000CD   323 _TH2	=	0x00cd
                           00CFCE   324 _T2CAP1	=	0xcfce
                           0000CE   325 _T2CAP1L	=	0x00ce
                           0000CF   326 _T2CAP1H	=	0x00cf
                           00009B   327 _PWM_DATA2	=	0x009b
                           00009C   328 _PWM_DATA1	=	0x009c
                           00009D   329 _PWM_CTRL	=	0x009d
                           00009E   330 _PWM_CK_SE	=	0x009e
                           0000F8   331 _SPI0_STAT	=	0x00f8
                           0000F9   332 _SPI0_DATA	=	0x00f9
                           0000FA   333 _SPI0_CTRL	=	0x00fa
                           0000FB   334 _SPI0_CK_SE	=	0x00fb
                           0000FC   335 _SPI0_SETUP	=	0x00fc
                           0000C0   336 _SCON1	=	0x00c0
                           0000C1   337 _SBUF1	=	0x00c1
                           0000C2   338 _SBAUD1	=	0x00c2
                           000080   339 _ADC_CTRL	=	0x0080
                           00009A   340 _ADC_CFG	=	0x009a
                           00009F   341 _ADC_DATA	=	0x009f
                           0000C3   342 _TKEY_CTRL	=	0x00c3
                           00C5C4   343 _TKEY_DAT	=	0xc5c4
                           0000C4   344 _TKEY_DATL	=	0x00c4
                           0000C5   345 _TKEY_DATH	=	0x00c5
                           000091   346 _USB_C_CTRL	=	0x0091
                           0000D1   347 _UDEV_CTRL	=	0x00d1
                           0000D2   348 _UEP1_CTRL	=	0x00d2
                           0000D3   349 _UEP1_T_LEN	=	0x00d3
                           0000D4   350 _UEP2_CTRL	=	0x00d4
                           0000D5   351 _UEP2_T_LEN	=	0x00d5
                           0000D6   352 _UEP3_CTRL	=	0x00d6
                           0000D7   353 _UEP3_T_LEN	=	0x00d7
                           0000D8   354 _USB_INT_FG	=	0x00d8
                           0000D9   355 _USB_INT_ST	=	0x00d9
                           0000DA   356 _USB_MIS_ST	=	0x00da
                           0000DB   357 _USB_RX_LEN	=	0x00db
                           0000DC   358 _UEP0_CTRL	=	0x00dc
                           0000DD   359 _UEP0_T_LEN	=	0x00dd
                           0000DE   360 _UEP4_CTRL	=	0x00de
                           0000DF   361 _UEP4_T_LEN	=	0x00df
                           0000E1   362 _USB_INT_EN	=	0x00e1
                           0000E2   363 _USB_CTRL	=	0x00e2
                           0000E3   364 _USB_DEV_AD	=	0x00e3
                           00E5E4   365 _UEP2_DMA	=	0xe5e4
                           0000E4   366 _UEP2_DMA_L	=	0x00e4
                           0000E5   367 _UEP2_DMA_H	=	0x00e5
                           00E7E6   368 _UEP3_DMA	=	0xe7e6
                           0000E6   369 _UEP3_DMA_L	=	0x00e6
                           0000E7   370 _UEP3_DMA_H	=	0x00e7
                           0000EA   371 _UEP4_1_MOD	=	0x00ea
                           0000EB   372 _UEP2_3_MOD	=	0x00eb
                           00EDEC   373 _UEP0_DMA	=	0xedec
                           0000EC   374 _UEP0_DMA_L	=	0x00ec
                           0000ED   375 _UEP0_DMA_H	=	0x00ed
                           00EFEE   376 _UEP1_DMA	=	0xefee
                           0000EE   377 _UEP1_DMA_L	=	0x00ee
                           0000EF   378 _UEP1_DMA_H	=	0x00ef
                                    379 ;--------------------------------------------------------
                                    380 ; special function bits
                                    381 ;--------------------------------------------------------
                                    382 	.area RSEG    (ABS,DATA)
      000000                        383 	.org 0x0000
                           0000D7   384 _CY	=	0x00d7
                           0000D6   385 _AC	=	0x00d6
                           0000D5   386 _F0	=	0x00d5
                           0000D4   387 _RS1	=	0x00d4
                           0000D3   388 _RS0	=	0x00d3
                           0000D2   389 _OV	=	0x00d2
                           0000D1   390 _F1	=	0x00d1
                           0000D0   391 _P	=	0x00d0
                           0000AF   392 _EA	=	0x00af
                           0000AE   393 _E_DIS	=	0x00ae
                           0000AD   394 _ET2	=	0x00ad
                           0000AC   395 _ES	=	0x00ac
                           0000AB   396 _ET1	=	0x00ab
                           0000AA   397 _EX1	=	0x00aa
                           0000A9   398 _ET0	=	0x00a9
                           0000A8   399 _EX0	=	0x00a8
                           0000BF   400 _PH_FLAG	=	0x00bf
                           0000BE   401 _PL_FLAG	=	0x00be
                           0000BD   402 _PT2	=	0x00bd
                           0000BC   403 _PS	=	0x00bc
                           0000BB   404 _PT1	=	0x00bb
                           0000BA   405 _PX1	=	0x00ba
                           0000B9   406 _PT0	=	0x00b9
                           0000B8   407 _PX0	=	0x00b8
                           0000EF   408 _IE_WDOG	=	0x00ef
                           0000EE   409 _IE_GPIO	=	0x00ee
                           0000ED   410 _IE_PWMX	=	0x00ed
                           0000EC   411 _IE_UART1	=	0x00ec
                           0000EB   412 _IE_ADC	=	0x00eb
                           0000EA   413 _IE_USB	=	0x00ea
                           0000E9   414 _IE_TKEY	=	0x00e9
                           0000E8   415 _IE_SPI0	=	0x00e8
                           000097   416 _SCK	=	0x0097
                           000097   417 _TXD1	=	0x0097
                           000097   418 _TIN5	=	0x0097
                           000096   419 _MISO	=	0x0096
                           000096   420 _RXD1	=	0x0096
                           000096   421 _TIN4	=	0x0096
                           000095   422 _MOSI	=	0x0095
                           000095   423 _PWM1	=	0x0095
                           000095   424 _TIN3	=	0x0095
                           000095   425 _UCC2	=	0x0095
                           000095   426 _AIN2	=	0x0095
                           000094   427 _T2_	=	0x0094
                           000094   428 _CAP1_	=	0x0094
                           000094   429 _SCS	=	0x0094
                           000094   430 _TIN2	=	0x0094
                           000094   431 _UCC1	=	0x0094
                           000094   432 _AIN1	=	0x0094
                           000093   433 _TXD_	=	0x0093
                           000092   434 _RXD_	=	0x0092
                           000091   435 _T2EX	=	0x0091
                           000091   436 _CAP2	=	0x0091
                           000091   437 _TIN1	=	0x0091
                           000091   438 _VBUS2	=	0x0091
                           000091   439 _AIN0	=	0x0091
                           000090   440 _T2	=	0x0090
                           000090   441 _CAP1	=	0x0090
                           000090   442 _TIN0	=	0x0090
                           000097   443 _P1_7	=	0x0097
                           000096   444 _P1_6	=	0x0096
                           000095   445 _P1_5	=	0x0095
                           000094   446 _P1_4	=	0x0094
                           000093   447 _P1_3	=	0x0093
                           000092   448 _P1_2	=	0x0092
                           000091   449 _P1_1	=	0x0091
                           000090   450 _P1_0	=	0x0090
                           0000B7   451 _UDM	=	0x00b7
                           0000B6   452 _UDP	=	0x00b6
                           0000B5   453 _T1	=	0x00b5
                           0000B4   454 _PWM2	=	0x00b4
                           0000B4   455 _RXD1_	=	0x00b4
                           0000B4   456 _T0	=	0x00b4
                           0000B3   457 _INT1	=	0x00b3
                           0000B2   458 _TXD1_	=	0x00b2
                           0000B2   459 _INT0	=	0x00b2
                           0000B2   460 _VBUS1	=	0x00b2
                           0000B2   461 _AIN3	=	0x00b2
                           0000B1   462 _PWM2_	=	0x00b1
                           0000B1   463 _TXD	=	0x00b1
                           0000B0   464 _PWM1_	=	0x00b0
                           0000B0   465 _RXD	=	0x00b0
                           0000B7   466 _P3_7	=	0x00b7
                           0000B6   467 _P3_6	=	0x00b6
                           0000B5   468 _P3_5	=	0x00b5
                           0000B4   469 _P3_4	=	0x00b4
                           0000B3   470 _P3_3	=	0x00b3
                           0000B2   471 _P3_2	=	0x00b2
                           0000B1   472 _P3_1	=	0x00b1
                           0000B0   473 _P3_0	=	0x00b0
                           00008F   474 _TF1	=	0x008f
                           00008E   475 _TR1	=	0x008e
                           00008D   476 _TF0	=	0x008d
                           00008C   477 _TR0	=	0x008c
                           00008B   478 _IE1	=	0x008b
                           00008A   479 _IT1	=	0x008a
                           000089   480 _IE0	=	0x0089
                           000088   481 _IT0	=	0x0088
                           00009F   482 _SM0	=	0x009f
                           00009E   483 _SM1	=	0x009e
                           00009D   484 _SM2	=	0x009d
                           00009C   485 _REN	=	0x009c
                           00009B   486 _TB8	=	0x009b
                           00009A   487 _RB8	=	0x009a
                           000099   488 _TI	=	0x0099
                           000098   489 _RI	=	0x0098
                           0000CF   490 _TF2	=	0x00cf
                           0000CF   491 _CAP1F	=	0x00cf
                           0000CE   492 _EXF2	=	0x00ce
                           0000CD   493 _RCLK	=	0x00cd
                           0000CC   494 _TCLK	=	0x00cc
                           0000CB   495 _EXEN2	=	0x00cb
                           0000CA   496 _TR2	=	0x00ca
                           0000C9   497 _C_T2	=	0x00c9
                           0000C8   498 _CP_RL2	=	0x00c8
                           0000FF   499 _S0_FST_ACT	=	0x00ff
                           0000FE   500 _S0_IF_OV	=	0x00fe
                           0000FD   501 _S0_IF_FIRST	=	0x00fd
                           0000FC   502 _S0_IF_BYTE	=	0x00fc
                           0000FB   503 _S0_FREE	=	0x00fb
                           0000FA   504 _S0_T_FIFO	=	0x00fa
                           0000F8   505 _S0_R_FIFO	=	0x00f8
                           0000C7   506 _U1SM0	=	0x00c7
                           0000C5   507 _U1SMOD	=	0x00c5
                           0000C4   508 _U1REN	=	0x00c4
                           0000C3   509 _U1TB8	=	0x00c3
                           0000C2   510 _U1RB8	=	0x00c2
                           0000C1   511 _U1TI	=	0x00c1
                           0000C0   512 _U1RI	=	0x00c0
                           000087   513 _CMPO	=	0x0087
                           000086   514 _CMP_IF	=	0x0086
                           000085   515 _ADC_IF	=	0x0085
                           000084   516 _ADC_START	=	0x0084
                           000083   517 _CMP_CHAN	=	0x0083
                           000081   518 _ADC_CHAN1	=	0x0081
                           000080   519 _ADC_CHAN0	=	0x0080
                           0000DF   520 _U_IS_NAK	=	0x00df
                           0000DE   521 _U_TOG_OK	=	0x00de
                           0000DD   522 _U_SIE_FREE	=	0x00dd
                           0000DC   523 _UIF_FIFO_OV	=	0x00dc
                           0000DB   524 _UIF_HST_SOF	=	0x00db
                           0000DA   525 _UIF_SUSPEND	=	0x00da
                           0000D9   526 _UIF_TRANSFER	=	0x00d9
                           0000D8   527 _UIF_DETECT	=	0x00d8
                           0000D8   528 _UIF_BUS_RST	=	0x00d8
                                    529 ;--------------------------------------------------------
                                    530 ; overlayable register banks
                                    531 ;--------------------------------------------------------
                                    532 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        533 	.ds 8
                                    534 ;--------------------------------------------------------
                                    535 ; internal ram data
                                    536 ;--------------------------------------------------------
                                    537 	.area DSEG    (DATA)
      000008                        538 _usb_dev_addr:
      000008                        539 	.ds 1
      000009                        540 _usb_config:
      000009                        541 	.ds 1
      00000A                        542 _setup_tx_ptr:
      00000A                        543 	.ds 2
      00000C                        544 _setup_tx_len:
      00000C                        545 	.ds 2
                                    546 ;--------------------------------------------------------
                                    547 ; overlayable items in internal ram
                                    548 ;--------------------------------------------------------
                                    549 ;--------------------------------------------------------
                                    550 ; Stack segment in internal ram
                                    551 ;--------------------------------------------------------
                                    552 	.area SSEG
      000019                        553 __start__stack:
      000019                        554 	.ds	1
                                    555 
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
                                    598 ; interrupt vector
                                    599 ;--------------------------------------------------------
                                    600 	.area HOME    (CODE)
      000000                        601 __interrupt_vect:
      000000 02 00 4E         [24]  602 	ljmp	__sdcc_gsinit_startup
                                    603 ; restartable atomic support routines
      000003                        604 	.ds	5
      000008                        605 sdcc_atomic_exchange_rollback_start::
      000008 00               [12]  606 	nop
      000009 00               [12]  607 	nop
      00000A                        608 sdcc_atomic_exchange_pdata_impl:
      00000A E2               [24]  609 	movx	a, @r0
      00000B FB               [12]  610 	mov	r3, a
      00000C EA               [12]  611 	mov	a, r2
      00000D F2               [24]  612 	movx	@r0, a
      00000E 80 2C            [24]  613 	sjmp	sdcc_atomic_exchange_exit
      000010 00               [12]  614 	nop
      000011 00               [12]  615 	nop
      000012                        616 sdcc_atomic_exchange_xdata_impl:
      000012 E0               [24]  617 	movx	a, @dptr
      000013 FB               [12]  618 	mov	r3, a
      000014 EA               [12]  619 	mov	a, r2
      000015 F0               [24]  620 	movx	@dptr, a
      000016 80 24            [24]  621 	sjmp	sdcc_atomic_exchange_exit
      000018                        622 sdcc_atomic_compare_exchange_idata_impl:
      000018 E6               [12]  623 	mov	a, @r0
      000019 B5 02 02         [24]  624 	cjne	a, ar2, .+#5
      00001C EB               [12]  625 	mov	a, r3
      00001D F6               [12]  626 	mov	@r0, a
      00001E 22               [24]  627 	ret
      00001F 00               [12]  628 	nop
      000020                        629 sdcc_atomic_compare_exchange_pdata_impl:
      000020 E2               [24]  630 	movx	a, @r0
      000021 B5 02 02         [24]  631 	cjne	a, ar2, .+#5
      000024 EB               [12]  632 	mov	a, r3
      000025 F2               [24]  633 	movx	@r0, a
      000026 22               [24]  634 	ret
      000027 00               [12]  635 	nop
      000028                        636 sdcc_atomic_compare_exchange_xdata_impl:
      000028 E0               [24]  637 	movx	a, @dptr
      000029 B5 02 02         [24]  638 	cjne	a, ar2, .+#5
      00002C EB               [12]  639 	mov	a, r3
      00002D F0               [24]  640 	movx	@dptr, a
      00002E 22               [24]  641 	ret
      00002F                        642 sdcc_atomic_exchange_rollback_end::
                                    643 
      00002F                        644 sdcc_atomic_exchange_gptr_impl::
      00002F 30 F6 E0         [24]  645 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      000032 A8 82            [24]  646 	mov	r0, dpl
      000034 20 F5 D3         [24]  647 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      000037                        648 sdcc_atomic_exchange_idata_impl:
      000037 EA               [12]  649 	mov	a, r2
      000038 C6               [12]  650 	xch	a, @r0
      000039 F5 82            [12]  651 	mov	dpl, a
      00003B 22               [24]  652 	ret
      00003C                        653 sdcc_atomic_exchange_exit:
      00003C 8B 82            [24]  654 	mov	dpl, r3
      00003E 22               [24]  655 	ret
      00003F                        656 sdcc_atomic_compare_exchange_gptr_impl::
      00003F 30 F6 E6         [24]  657 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      000042 A8 82            [24]  658 	mov	r0, dpl
      000044 20 F5 D9         [24]  659 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      000047 80 CF            [24]  660 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    661 ;--------------------------------------------------------
                                    662 ; global & static initialisations
                                    663 ;--------------------------------------------------------
                                    664 	.area HOME    (CODE)
                                    665 	.area GSINIT  (CODE)
                                    666 	.area GSFINAL (CODE)
                                    667 	.area GSINIT  (CODE)
                                    668 	.globl __sdcc_gsinit_startup
                                    669 	.globl __sdcc_program_startup
                                    670 	.globl __start__stack
                                    671 	.globl __mcs51_genXINIT
                                    672 	.globl __mcs51_genXRAMCLEAR
                                    673 	.globl __mcs51_genRAMCLEAR
                                    674 ;	demo_keyboard_b.c:10: static uint8_t usb_dev_addr = 0;
      0000A7 75 08 00         [24]  675 	mov	_usb_dev_addr,#0x00
                                    676 ;	demo_keyboard_b.c:11: static uint8_t usb_config = 0;
      0000AA 75 09 00         [24]  677 	mov	_usb_config,#0x00
                                    678 ;	demo_keyboard_b.c:12: static const __code uint8_t *setup_tx_ptr = 0;
      0000AD E4               [12]  679 	clr	a
      0000AE F5 0A            [12]  680 	mov	_setup_tx_ptr,a
      0000B0 F5 0B            [12]  681 	mov	(_setup_tx_ptr + 1),a
                                    682 ;	demo_keyboard_b.c:13: static uint16_t setup_tx_len = 0;
      0000B2 F5 0C            [12]  683 	mov	_setup_tx_len,a
      0000B4 F5 0D            [12]  684 	mov	(_setup_tx_len + 1),a
                                    685 	.area GSFINAL (CODE)
      0000B6 02 00 49         [24]  686 	ljmp	__sdcc_program_startup
                                    687 ;--------------------------------------------------------
                                    688 ; Home
                                    689 ;--------------------------------------------------------
                                    690 	.area HOME    (CODE)
                                    691 	.area HOME    (CODE)
      000049                        692 __sdcc_program_startup:
      000049 12 03 85         [24]  693 	lcall	_main
      00004C                        694 __sdcc_program_exit:
      00004C 80 FE            [24]  695 	sjmp	.
                                    696 ;	return from main will return to caller
                                    697 ;--------------------------------------------------------
                                    698 ; code
                                    699 ;--------------------------------------------------------
                                    700 	.area CSEG    (CODE)
                                    701 ;------------------------------------------------------------
                                    702 ;Allocation info for local variables in function 'USB_Init'
                                    703 ;------------------------------------------------------------
                                    704 ;	demo_keyboard_b.c:45: void USB_Init(void) {
                                    705 ;	-----------------------------------------
                                    706 ;	 function USB_Init
                                    707 ;	-----------------------------------------
      0000B9                        708 _USB_Init:
                           000007   709 	ar7 = 0x07
                           000006   710 	ar6 = 0x06
                           000005   711 	ar5 = 0x05
                           000004   712 	ar4 = 0x04
                           000003   713 	ar3 = 0x03
                           000002   714 	ar2 = 0x02
                           000001   715 	ar1 = 0x01
                           000000   716 	ar0 = 0x00
                                    717 ;	demo_keyboard_b.c:46: SAFE_MOD = 0x55; SAFE_MOD = 0xAA; CLOCK_CFG = 0x86; SAFE_MOD = 0x00; // 24MHz
      0000B9 75 A1 55         [24]  718 	mov	_SAFE_MOD,#0x55
      0000BC 75 A1 AA         [24]  719 	mov	_SAFE_MOD,#0xaa
      0000BF 75 B9 86         [24]  720 	mov	_CLOCK_CFG,#0x86
      0000C2 75 A1 00         [24]  721 	mov	_SAFE_MOD,#0x00
                                    722 ;	demo_keyboard_b.c:47: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL; USB_CTRL = 0x00;
      0000C5 75 E2 06         [24]  723 	mov	_USB_CTRL,#0x06
      0000C8 75 E2 00         [24]  724 	mov	_USB_CTRL,#0x00
                                    725 ;	demo_keyboard_b.c:48: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
      0000CB 75 EC 00         [24]  726 	mov	_UEP0_DMA_L,#_Ep0Buffer
                                    727 ;	demo_keyboard_b.c:49: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
      0000CE 7E 00            [12]  728 	mov	r6,#_Ep0Buffer
      0000D0 7F 00            [12]  729 	mov	r7,#(_Ep0Buffer >> 8)
      0000D2 8F ED            [24]  730 	mov	_UEP0_DMA_H,r7
                                    731 ;	demo_keyboard_b.c:50: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
      0000D4 75 EE 40         [24]  732 	mov	_UEP1_DMA_L,#_Ep1Buffer
                                    733 ;	demo_keyboard_b.c:51: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
      0000D7 7E 40            [12]  734 	mov	r6,#_Ep1Buffer
      0000D9 7F 00            [12]  735 	mov	r7,#(_Ep1Buffer >> 8)
      0000DB 8F EF            [24]  736 	mov	_UEP1_DMA_H,r7
                                    737 ;	demo_keyboard_b.c:52: UEP4_1_MOD = 0x40; // EP1 IN enable
      0000DD 75 EA 40         [24]  738 	mov	_UEP4_1_MOD,#0x40
                                    739 ;	demo_keyboard_b.c:53: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
      0000E0 75 D2 12         [24]  740 	mov	_UEP1_CTRL,#0x12
                                    741 ;	demo_keyboard_b.c:54: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0000E3 75 DC 02         [24]  742 	mov	_UEP0_CTRL,#0x02
                                    743 ;	demo_keyboard_b.c:55: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
      0000E6 75 E2 29         [24]  744 	mov	_USB_CTRL,#0x29
                                    745 ;	demo_keyboard_b.c:56: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN;
      0000E9 75 D1 81         [24]  746 	mov	_UDEV_CTRL,#0x81
                                    747 ;	demo_keyboard_b.c:57: USB_DEV_AD = 0x00;
      0000EC 75 E3 00         [24]  748 	mov	_USB_DEV_AD,#0x00
                                    749 ;	demo_keyboard_b.c:58: }
      0000EF 22               [24]  750 	ret
                                    751 ;------------------------------------------------------------
                                    752 ;Allocation info for local variables in function 'Handle_EP0_Setup'
                                    753 ;------------------------------------------------------------
                                    754 ;req_type      Allocated to registers r7 
                                    755 ;req           Allocated to registers r6 
                                    756 ;value         Allocated to registers r4 r5 
                                    757 ;length        Allocated to registers r3 r2 
                                    758 ;send_len      Allocated to registers r7 
                                    759 ;------------------------------------------------------------
                                    760 ;	demo_keyboard_b.c:60: static void Handle_EP0_Setup(void) {
                                    761 ;	-----------------------------------------
                                    762 ;	 function Handle_EP0_Setup
                                    763 ;	-----------------------------------------
      0000F0                        764 _Handle_EP0_Setup:
                                    765 ;	demo_keyboard_b.c:61: uint8_t req_type = Ep0Buffer[0];
      0000F0 90 00 00         [24]  766 	mov	dptr,#_Ep0Buffer
      0000F3 E0               [24]  767 	movx	a,@dptr
      0000F4 FF               [12]  768 	mov	r7,a
                                    769 ;	demo_keyboard_b.c:62: uint8_t req = Ep0Buffer[1];
      0000F5 90 00 01         [24]  770 	mov	dptr,#(_Ep0Buffer + 0x0001)
      0000F8 E0               [24]  771 	movx	a,@dptr
      0000F9 FE               [12]  772 	mov	r6,a
                                    773 ;	demo_keyboard_b.c:63: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
      0000FA 90 00 02         [24]  774 	mov	dptr,#(_Ep0Buffer + 0x0002)
      0000FD E0               [24]  775 	movx	a,@dptr
      0000FE FD               [12]  776 	mov	r5,a
      0000FF 90 00 03         [24]  777 	mov	dptr,#(_Ep0Buffer + 0x0003)
      000102 E0               [24]  778 	movx	a,@dptr
      000103 FB               [12]  779 	mov	r3,a
      000104 7C 00            [12]  780 	mov	r4,#0x00
      000106 8D 02            [24]  781 	mov	ar2,r5
      000108 7D 00            [12]  782 	mov	r5,#0x00
      00010A EC               [12]  783 	mov	a,r4
      00010B 4A               [12]  784 	orl	a,r2
      00010C FC               [12]  785 	mov	r4,a
      00010D EB               [12]  786 	mov	a,r3
      00010E 4D               [12]  787 	orl	a,r5
                                    788 ;	demo_keyboard_b.c:64: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
      00010F 90 00 06         [24]  789 	mov	dptr,#(_Ep0Buffer + 0x0006)
      000112 E0               [24]  790 	movx	a,@dptr
      000113 FB               [12]  791 	mov	r3,a
      000114 90 00 07         [24]  792 	mov	dptr,#(_Ep0Buffer + 0x0007)
      000117 E0               [24]  793 	movx	a,@dptr
      000118 FA               [12]  794 	mov	r2,a
      000119 E4               [12]  795 	clr	a
      00011A F8               [12]  796 	mov	r0,a
      00011B 4B               [12]  797 	orl	a,r3
      00011C FB               [12]  798 	mov	r3,a
      00011D EA               [12]  799 	mov	a,r2
      00011E 48               [12]  800 	orl	a,r0
      00011F FA               [12]  801 	mov	r2,a
                                    802 ;	demo_keyboard_b.c:65: setup_tx_ptr = 0; setup_tx_len = 0;
      000120 E4               [12]  803 	clr	a
      000121 F5 0A            [12]  804 	mov	_setup_tx_ptr,a
      000123 F5 0B            [12]  805 	mov	(_setup_tx_ptr + 1),a
      000125 F5 0C            [12]  806 	mov	_setup_tx_len,a
      000127 F5 0D            [12]  807 	mov	(_setup_tx_len + 1),a
                                    808 ;	demo_keyboard_b.c:67: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
      000129 EF               [12]  809 	mov	a,r7
      00012A 54 60            [12]  810 	anl	a,#0x60
      00012C 60 03            [24]  811 	jz	00243$
      00012E 02 01 E6         [24]  812 	ljmp	00120$
      000131                        813 00243$:
                                    814 ;	demo_keyboard_b.c:68: switch (req) {
      000131 EE               [12]  815 	mov	a,r6
      000132 70 03            [24]  816 	jnz	00244$
      000134 02 01 D8         [24]  817 	ljmp	00117$
      000137                        818 00244$:
      000137 BE 05 03         [24]  819 	cjne	r6,#0x05,00245$
      00013A 02 01 D0         [24]  820 	ljmp	00115$
      00013D                        821 00245$:
      00013D BE 06 02         [24]  822 	cjne	r6,#0x06,00246$
      000140 80 09            [24]  823 	sjmp	00101$
      000142                        824 00246$:
      000142 BE 09 03         [24]  825 	cjne	r6,#0x09,00247$
      000145 02 01 D4         [24]  826 	ljmp	00116$
      000148                        827 00247$:
      000148 02 01 E6         [24]  828 	ljmp	00120$
                                    829 ;	demo_keyboard_b.c:69: case USB_GET_DESCRIPTOR:
      00014B                        830 00101$:
                                    831 ;	demo_keyboard_b.c:70: switch (Ep0Buffer[3]) {
      00014B 90 00 03         [24]  832 	mov	dptr,#(_Ep0Buffer + 0x0003)
      00014E E0               [24]  833 	movx	a,@dptr
      00014F FF               [12]  834 	mov	r7,a
      000150 BF 01 02         [24]  835 	cjne	r7,#0x01,00248$
      000153 80 12            [24]  836 	sjmp	00102$
      000155                        837 00248$:
      000155 BF 02 02         [24]  838 	cjne	r7,#0x02,00249$
      000158 80 1B            [24]  839 	sjmp	00103$
      00015A                        840 00249$:
      00015A BF 03 02         [24]  841 	cjne	r7,#0x03,00250$
      00015D 80 24            [24]  842 	sjmp	00104$
      00015F                        843 00250$:
      00015F BF 22 02         [24]  844 	cjne	r7,#0x22,00251$
      000162 80 5E            [24]  845 	sjmp	00113$
      000164                        846 00251$:
      000164 02 01 E6         [24]  847 	ljmp	00120$
                                    848 ;	demo_keyboard_b.c:71: case 0x01: setup_tx_ptr = DevDesc; setup_tx_len = sizeof(DevDesc); break;
      000167                        849 00102$:
      000167 75 0A 7C         [24]  850 	mov	_setup_tx_ptr,#_DevDesc
      00016A 75 0B 04         [24]  851 	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
      00016D 75 0C 12         [24]  852 	mov	_setup_tx_len,#0x12
      000170 75 0D 00         [24]  853 	mov	(_setup_tx_len + 1),#0x00
                                    854 ;	demo_keyboard_b.c:72: case 0x02: setup_tx_ptr = CfgDesc; setup_tx_len = sizeof(CfgDesc); break;
      000173 80 71            [24]  855 	sjmp	00120$
      000175                        856 00103$:
      000175 75 0A CD         [24]  857 	mov	_setup_tx_ptr,#_CfgDesc
      000178 75 0B 04         [24]  858 	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
      00017B 75 0C 22         [24]  859 	mov	_setup_tx_len,#0x22
      00017E 75 0D 00         [24]  860 	mov	(_setup_tx_len + 1),#0x00
                                    861 ;	demo_keyboard_b.c:73: case 0x03:
      000181 80 63            [24]  862 	sjmp	00120$
      000183                        863 00104$:
                                    864 ;	demo_keyboard_b.c:74: if (Ep0Buffer[2] == 0) { setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); }
      000183 90 00 02         [24]  865 	mov	dptr,#(_Ep0Buffer + 0x0002)
      000186 E0               [24]  866 	movx	a,@dptr
      000187 70 0D            [24]  867 	jnz	00111$
      000189 75 0A EF         [24]  868 	mov	_setup_tx_ptr,#_Str0Desc
      00018C 75 0B 04         [24]  869 	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
      00018F 75 0C 04         [24]  870 	mov	_setup_tx_len,#0x04
      000192 F5 0D            [12]  871 	mov	(_setup_tx_len + 1),a
      000194 80 50            [24]  872 	sjmp	00120$
      000196                        873 00111$:
                                    874 ;	demo_keyboard_b.c:75: else if (Ep0Buffer[2] == 1) { setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); }
      000196 90 00 02         [24]  875 	mov	dptr,#(_Ep0Buffer + 0x0002)
      000199 E0               [24]  876 	movx	a,@dptr
      00019A FF               [12]  877 	mov	r7,a
      00019B BF 01 0E         [24]  878 	cjne	r7,#0x01,00108$
      00019E 75 0A F3         [24]  879 	mov	_setup_tx_ptr,#_Str1Desc
      0001A1 75 0B 04         [24]  880 	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
      0001A4 75 0C 0E         [24]  881 	mov	_setup_tx_len,#0x0e
      0001A7 75 0D 00         [24]  882 	mov	(_setup_tx_len + 1),#0x00
      0001AA 80 3A            [24]  883 	sjmp	00120$
      0001AC                        884 00108$:
                                    885 ;	demo_keyboard_b.c:76: else if (Ep0Buffer[2] == 2) { setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); }
      0001AC 90 00 02         [24]  886 	mov	dptr,#(_Ep0Buffer + 0x0002)
      0001AF E0               [24]  887 	movx	a,@dptr
      0001B0 FF               [12]  888 	mov	r7,a
      0001B1 BF 02 32         [24]  889 	cjne	r7,#0x02,00120$
      0001B4 75 0A 01         [24]  890 	mov	_setup_tx_ptr,#_Str2Desc
      0001B7 75 0B 05         [24]  891 	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
      0001BA 75 0C 18         [24]  892 	mov	_setup_tx_len,#0x18
      0001BD 75 0D 00         [24]  893 	mov	(_setup_tx_len + 1),#0x00
                                    894 ;	demo_keyboard_b.c:77: break;
                                    895 ;	demo_keyboard_b.c:78: case 0x22: setup_tx_ptr = ReportDesc; setup_tx_len = sizeof(ReportDesc); break;
      0001C0 80 24            [24]  896 	sjmp	00120$
      0001C2                        897 00113$:
      0001C2 75 0A 8E         [24]  898 	mov	_setup_tx_ptr,#_ReportDesc
      0001C5 75 0B 04         [24]  899 	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
      0001C8 75 0C 3F         [24]  900 	mov	_setup_tx_len,#0x3f
      0001CB 75 0D 00         [24]  901 	mov	(_setup_tx_len + 1),#0x00
                                    902 ;	demo_keyboard_b.c:80: break;
                                    903 ;	demo_keyboard_b.c:81: case USB_SET_ADDRESS: usb_dev_addr = (uint8_t)value; break;
      0001CE 80 16            [24]  904 	sjmp	00120$
      0001D0                        905 00115$:
      0001D0 8C 08            [24]  906 	mov	_usb_dev_addr,r4
                                    907 ;	demo_keyboard_b.c:82: case USB_SET_CONFIGURATION: usb_config = (uint8_t)value; break;
      0001D2 80 12            [24]  908 	sjmp	00120$
      0001D4                        909 00116$:
      0001D4 8C 09            [24]  910 	mov	_usb_config,r4
                                    911 ;	demo_keyboard_b.c:83: case USB_GET_STATUS: Ep0Buffer[0] = 0; Ep0Buffer[1] = 0; setup_tx_len = 2; break;
      0001D6 80 0E            [24]  912 	sjmp	00120$
      0001D8                        913 00117$:
      0001D8 90 00 00         [24]  914 	mov	dptr,#_Ep0Buffer
      0001DB E4               [12]  915 	clr	a
      0001DC F0               [24]  916 	movx	@dptr,a
      0001DD 90 00 01         [24]  917 	mov	dptr,#(_Ep0Buffer + 0x0001)
      0001E0 F0               [24]  918 	movx	@dptr,a
      0001E1 75 0C 02         [24]  919 	mov	_setup_tx_len,#0x02
      0001E4 F5 0D            [12]  920 	mov	(_setup_tx_len + 1),a
                                    921 ;	demo_keyboard_b.c:84: }
      0001E6                        922 00120$:
                                    923 ;	demo_keyboard_b.c:87: if (setup_tx_len > length) setup_tx_len = length;
      0001E6 C3               [12]  924 	clr	c
      0001E7 EB               [12]  925 	mov	a,r3
      0001E8 95 0C            [12]  926 	subb	a,_setup_tx_len
      0001EA EA               [12]  927 	mov	a,r2
      0001EB 95 0D            [12]  928 	subb	a,(_setup_tx_len + 1)
      0001ED 50 04            [24]  929 	jnc	00122$
                                    930 ;	free result
      0001EF 8B 0C            [24]  931 	mov	_setup_tx_len,r3
      0001F1 8A 0D            [24]  932 	mov	(_setup_tx_len + 1),r2
      0001F3                        933 00122$:
                                    934 ;	demo_keyboard_b.c:88: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      0001F3 AE 0C            [24]  935 	mov	r6,_setup_tx_len
      0001F5 AF 0D            [24]  936 	mov	r7,(_setup_tx_len + 1)
      0001F7 C3               [12]  937 	clr	c
      0001F8 74 40            [12]  938 	mov	a,#0x40
      0001FA 9E               [12]  939 	subb	a,r6
      0001FB E4               [12]  940 	clr	a
      0001FC 9F               [12]  941 	subb	a,r7
      0001FD 50 04            [24]  942 	jnc	00128$
                                    943 ;	free result
      0001FF 7F 40            [12]  944 	mov	r7,#0x40
      000201 80 04            [24]  945 	sjmp	00129$
      000203                        946 00128$:
      000203 AE 0C            [24]  947 	mov	r6,_setup_tx_len
      000205 8E 07            [24]  948 	mov	ar7,r6
      000207                        949 00129$:
                                    950 ;	demo_keyboard_b.c:89: if (setup_tx_ptr && send_len > 0) {
      000207 E5 0A            [12]  951 	mov	a,_setup_tx_ptr
      000209 45 0B            [12]  952 	orl	a,(_setup_tx_ptr + 1)
      00020B 60 3B            [24]  953 	jz	00124$
      00020D EF               [12]  954 	mov	a,r7
      00020E 60 38            [24]  955 	jz	00124$
                                    956 ;	demo_keyboard_b.c:90: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      000210 85 0A 0E         [24]  957 	mov	___memcpy_PARM_2,_setup_tx_ptr
      000213 85 0B 0F         [24]  958 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      000216 75 10 80         [24]  959 	mov	(___memcpy_PARM_2 + 2),#0x80
      000219 8F 11            [24]  960 	mov	___memcpy_PARM_3,r7
      00021B 75 12 00         [24]  961 	mov	(___memcpy_PARM_3 + 1),#0x00
      00021E 90 00 00         [24]  962 	mov	dptr,#_Ep0Buffer
      000221 75 F0 00         [24]  963 	mov	b, #0x00
      000224 C0 07            [24]  964 	push	ar7
      000226 12 03 CD         [24]  965 	lcall	___memcpy
      000229 D0 07            [24]  966 	pop	ar7
                                    967 ;	demo_keyboard_b.c:91: setup_tx_ptr += send_len; setup_tx_len -= send_len;
      00022B EF               [12]  968 	mov	a,r7
      00022C 25 0A            [12]  969 	add	a, _setup_tx_ptr
      00022E F5 0A            [12]  970 	mov	_setup_tx_ptr,a
      000230 E4               [12]  971 	clr	a
      000231 35 0B            [12]  972 	addc	a, (_setup_tx_ptr + 1)
      000233 F5 0B            [12]  973 	mov	(_setup_tx_ptr + 1),a
      000235 8F 05            [24]  974 	mov	ar5,r7
      000237 7E 00            [12]  975 	mov	r6,#0x00
      000239 AB 0C            [24]  976 	mov	r3,_setup_tx_len
      00023B AC 0D            [24]  977 	mov	r4,(_setup_tx_len + 1)
      00023D EB               [12]  978 	mov	a,r3
      00023E C3               [12]  979 	clr	c
      00023F 9D               [12]  980 	subb	a,r5
      000240 FB               [12]  981 	mov	r3,a
      000241 EC               [12]  982 	mov	a,r4
      000242 9E               [12]  983 	subb	a,r6
      000243 FC               [12]  984 	mov	r4,a
      000244 8B 0C            [24]  985 	mov	_setup_tx_len,r3
      000246 8C 0D            [24]  986 	mov	(_setup_tx_len + 1),r4
      000248                        987 00124$:
                                    988 ;	demo_keyboard_b.c:93: UEP0_T_LEN = send_len;
      000248 8F DD            [24]  989 	mov	_UEP0_T_LEN,r7
                                    990 ;	demo_keyboard_b.c:94: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
      00024A 75 DC C0         [24]  991 	mov	_UEP0_CTRL,#0xc0
                                    992 ;	demo_keyboard_b.c:95: }
      00024D 22               [24]  993 	ret
                                    994 ;------------------------------------------------------------
                                    995 ;Allocation info for local variables in function 'USB_Process'
                                    996 ;------------------------------------------------------------
                                    997 ;token         Allocated to registers r7 
                                    998 ;endp          Allocated to registers r5 
                                    999 ;send_len      Allocated to registers r6 
                                   1000 ;------------------------------------------------------------
                                   1001 ;	demo_keyboard_b.c:97: void USB_Process(void) {
                                   1002 ;	-----------------------------------------
                                   1003 ;	 function USB_Process
                                   1004 ;	-----------------------------------------
      00024E                       1005 _USB_Process:
                                   1006 ;	demo_keyboard_b.c:98: if (UIF_BUS_RST) {
      00024E 30 D8 0C         [24] 1007 	jnb	_UIF_BUS_RST,00102$
                                   1008 ;	demo_keyboard_b.c:99: USB_DEV_AD = 0x00;
      000251 75 E3 00         [24] 1009 	mov	_USB_DEV_AD,#0x00
                                   1010 ;	demo_keyboard_b.c:100: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      000254 75 DC 02         [24] 1011 	mov	_UEP0_CTRL,#0x02
                                   1012 ;	demo_keyboard_b.c:101: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
      000257 75 D2 12         [24] 1013 	mov	_UEP1_CTRL,#0x12
                                   1014 ;	demo_keyboard_b.c:102: UIF_BUS_RST = 0;
                                   1015 ;	assignBit
      00025A C2 D8            [12] 1016 	clr	_UIF_BUS_RST
                                   1017 ;	demo_keyboard_b.c:103: return;
      00025C 22               [24] 1018 	ret
      00025D                       1019 00102$:
                                   1020 ;	demo_keyboard_b.c:105: if (UIF_TRANSFER) {
      00025D 20 D9 01         [24] 1021 	jb	_UIF_TRANSFER,00215$
      000260 22               [24] 1022 	ret
      000261                       1023 00215$:
                                   1024 ;	demo_keyboard_b.c:106: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
      000261 E5 D9            [12] 1025 	mov	a,_USB_INT_ST
      000263 54 30            [12] 1026 	anl	a,#0x30
      000265 FF               [12] 1027 	mov	r7,a
                                   1028 ;	demo_keyboard_b.c:107: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
      000266 E5 D9            [12] 1029 	mov	a,_USB_INT_ST
      000268 54 0F            [12] 1030 	anl	a,#0x0f
                                   1031 ;	demo_keyboard_b.c:108: if (endp == 0) {
      00026A FD               [12] 1032 	mov	r5,a
      00026B 60 03            [24] 1033 	jz	00216$
      00026D 02 02 F3         [24] 1034 	ljmp	00122$
      000270                       1035 00216$:
                                   1036 ;	demo_keyboard_b.c:109: if (token == UIS_TOKEN_SETUP) {
      000270 BF 30 06         [24] 1037 	cjne	r7,#0x30,00115$
                                   1038 ;	demo_keyboard_b.c:110: Handle_EP0_Setup();
      000273 12 00 F0         [24] 1039 	lcall	_Handle_EP0_Setup
      000276 02 03 04         [24] 1040 	ljmp	00123$
      000279                       1041 00115$:
                                   1042 ;	demo_keyboard_b.c:111: } else if (token == UIS_TOKEN_IN) {
      000279 BF 20 6F         [24] 1043 	cjne	r7,#0x20,00112$
                                   1044 ;	demo_keyboard_b.c:112: if (usb_dev_addr != 0 && USB_DEV_AD == 0) USB_DEV_AD = usb_dev_addr;
      00027C E5 08            [12] 1045 	mov	a,_usb_dev_addr
      00027E 60 07            [24] 1046 	jz	00104$
      000280 E5 E3            [12] 1047 	mov	a,_USB_DEV_AD
      000282 70 03            [24] 1048 	jnz	00104$
      000284 85 08 E3         [24] 1049 	mov	_USB_DEV_AD,_usb_dev_addr
      000287                       1050 00104$:
                                   1051 ;	demo_keyboard_b.c:113: if (setup_tx_len > 0) {
      000287 E5 0C            [12] 1052 	mov	a,_setup_tx_len
      000289 45 0D            [12] 1053 	orl	a,(_setup_tx_len + 1)
      00028B 60 56            [24] 1054 	jz	00107$
                                   1055 ;	demo_keyboard_b.c:114: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      00028D AC 0C            [24] 1056 	mov	r4,_setup_tx_len
      00028F AE 0D            [24] 1057 	mov	r6,(_setup_tx_len + 1)
      000291 C3               [12] 1058 	clr	c
      000292 74 40            [12] 1059 	mov	a,#0x40
      000294 9C               [12] 1060 	subb	a,r4
      000295 E4               [12] 1061 	clr	a
      000296 9E               [12] 1062 	subb	a,r6
      000297 50 04            [24] 1063 	jnc	00128$
                                   1064 ;	free result
      000299 7E 40            [12] 1065 	mov	r6,#0x40
      00029B 80 04            [24] 1066 	sjmp	00129$
      00029D                       1067 00128$:
      00029D AC 0C            [24] 1068 	mov	r4,_setup_tx_len
      00029F 8C 06            [24] 1069 	mov	ar6,r4
      0002A1                       1070 00129$:
                                   1071 ;	demo_keyboard_b.c:115: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      0002A1 85 0A 0E         [24] 1072 	mov	___memcpy_PARM_2,_setup_tx_ptr
      0002A4 85 0B 0F         [24] 1073 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      0002A7 75 10 80         [24] 1074 	mov	(___memcpy_PARM_2 + 2),#0x80
      0002AA 8E 11            [24] 1075 	mov	___memcpy_PARM_3,r6
      0002AC 75 12 00         [24] 1076 	mov	(___memcpy_PARM_3 + 1),#0x00
      0002AF 90 00 00         [24] 1077 	mov	dptr,#_Ep0Buffer
      0002B2 75 F0 00         [24] 1078 	mov	b, #0x00
      0002B5 C0 06            [24] 1079 	push	ar6
      0002B7 12 03 CD         [24] 1080 	lcall	___memcpy
      0002BA D0 06            [24] 1081 	pop	ar6
                                   1082 ;	demo_keyboard_b.c:116: setup_tx_ptr += send_len; setup_tx_len -= send_len;
      0002BC EE               [12] 1083 	mov	a,r6
      0002BD 25 0A            [12] 1084 	add	a, _setup_tx_ptr
      0002BF F5 0A            [12] 1085 	mov	_setup_tx_ptr,a
      0002C1 E4               [12] 1086 	clr	a
      0002C2 35 0B            [12] 1087 	addc	a, (_setup_tx_ptr + 1)
      0002C4 F5 0B            [12] 1088 	mov	(_setup_tx_ptr + 1),a
      0002C6 8E 03            [24] 1089 	mov	ar3,r6
      0002C8 7C 00            [12] 1090 	mov	r4,#0x00
      0002CA A9 0C            [24] 1091 	mov	r1,_setup_tx_len
      0002CC AA 0D            [24] 1092 	mov	r2,(_setup_tx_len + 1)
      0002CE E9               [12] 1093 	mov	a,r1
      0002CF C3               [12] 1094 	clr	c
      0002D0 9B               [12] 1095 	subb	a,r3
      0002D1 F9               [12] 1096 	mov	r1,a
      0002D2 EA               [12] 1097 	mov	a,r2
      0002D3 9C               [12] 1098 	subb	a,r4
      0002D4 FA               [12] 1099 	mov	r2,a
      0002D5 89 0C            [24] 1100 	mov	_setup_tx_len,r1
      0002D7 8A 0D            [24] 1101 	mov	(_setup_tx_len + 1),r2
                                   1102 ;	demo_keyboard_b.c:117: UEP0_T_LEN = send_len;
      0002D9 8E DD            [24] 1103 	mov	_UEP0_T_LEN,r6
                                   1104 ;	demo_keyboard_b.c:118: UEP0_CTRL ^= bUEP_T_TOG;
      0002DB 63 DC 40         [24] 1105 	xrl	_UEP0_CTRL,#0x40
                                   1106 ;	demo_keyboard_b.c:119: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      0002DE 53 DC FC         [24] 1107 	anl	_UEP0_CTRL,#0xfc
      0002E1 80 21            [24] 1108 	sjmp	00123$
      0002E3                       1109 00107$:
                                   1110 ;	demo_keyboard_b.c:121: UEP0_T_LEN = 0;
      0002E3 75 DD 00         [24] 1111 	mov	_UEP0_T_LEN,#0x00
                                   1112 ;	demo_keyboard_b.c:122: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0002E6 75 DC 02         [24] 1113 	mov	_UEP0_CTRL,#0x02
      0002E9 80 19            [24] 1114 	sjmp	00123$
      0002EB                       1115 00112$:
                                   1116 ;	demo_keyboard_b.c:124: } else if (token == UIS_TOKEN_OUT) {
      0002EB EF               [12] 1117 	mov	a,r7
      0002EC 70 16            [24] 1118 	jnz	00123$
                                   1119 ;	demo_keyboard_b.c:125: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0002EE 75 DC 02         [24] 1120 	mov	_UEP0_CTRL,#0x02
      0002F1 80 11            [24] 1121 	sjmp	00123$
      0002F3                       1122 00122$:
                                   1123 ;	demo_keyboard_b.c:127: } else if (endp == 1) {
      0002F3 BD 01 0E         [24] 1124 	cjne	r5,#0x01,00123$
                                   1125 ;	demo_keyboard_b.c:128: if (token == UIS_TOKEN_IN) {
      0002F6 BF 20 0B         [24] 1126 	cjne	r7,#0x20,00123$
                                   1127 ;	demo_keyboard_b.c:129: UEP1_T_LEN = 0;
      0002F9 75 D3 00         [24] 1128 	mov	_UEP1_T_LEN,#0x00
                                   1129 ;	demo_keyboard_b.c:130: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
      0002FC 74 FC            [12] 1130 	mov	a,#0xfc
      0002FE 55 D2            [12] 1131 	anl	a,_UEP1_CTRL
      000300 44 02            [12] 1132 	orl	a,#0x02
      000302 F5 D2            [12] 1133 	mov	_UEP1_CTRL,a
      000304                       1134 00123$:
                                   1135 ;	demo_keyboard_b.c:133: UIF_TRANSFER = 0;
                                   1136 ;	assignBit
      000304 C2 D9            [12] 1137 	clr	_UIF_TRANSFER
                                   1138 ;	demo_keyboard_b.c:135: }
      000306 22               [24] 1139 	ret
                                   1140 ;------------------------------------------------------------
                                   1141 ;Allocation info for local variables in function 'SendKey'
                                   1142 ;------------------------------------------------------------
                                   1143 ;keycode       Allocated to registers r7 
                                   1144 ;i             Allocated to registers r6 r7 
                                   1145 ;------------------------------------------------------------
                                   1146 ;	demo_keyboard_b.c:137: void SendKey(uint8_t keycode) {
                                   1147 ;	-----------------------------------------
                                   1148 ;	 function SendKey
                                   1149 ;	-----------------------------------------
      000307                       1150 _SendKey:
      000307 AF 82            [24] 1151 	mov	r7, dpl
                                   1152 ;	demo_keyboard_b.c:138: while (UEP1_CTRL & 0x03) { USB_Process(); }
      000309                       1153 00101$:
      000309 E5 D2            [12] 1154 	mov	a,_UEP1_CTRL
      00030B 54 03            [12] 1155 	anl	a,#0x03
      00030D 60 09            [24] 1156 	jz	00103$
      00030F C0 07            [24] 1157 	push	ar7
      000311 12 02 4E         [24] 1158 	lcall	_USB_Process
      000314 D0 07            [24] 1159 	pop	ar7
      000316 80 F1            [24] 1160 	sjmp	00101$
      000318                       1161 00103$:
                                   1162 ;	demo_keyboard_b.c:139: Ep1Buffer[0] = 0;
      000318 90 00 40         [24] 1163 	mov	dptr,#_Ep1Buffer
      00031B E4               [12] 1164 	clr	a
      00031C F0               [24] 1165 	movx	@dptr,a
                                   1166 ;	demo_keyboard_b.c:140: Ep1Buffer[1] = 0;
      00031D 90 00 41         [24] 1167 	mov	dptr,#(_Ep1Buffer + 0x0001)
      000320 F0               [24] 1168 	movx	@dptr,a
                                   1169 ;	demo_keyboard_b.c:141: Ep1Buffer[2] = keycode;
      000321 90 00 42         [24] 1170 	mov	dptr,#(_Ep1Buffer + 0x0002)
      000324 EF               [12] 1171 	mov	a,r7
      000325 F0               [24] 1172 	movx	@dptr,a
                                   1173 ;	demo_keyboard_b.c:142: memset(&Ep1Buffer[3], 0, 5);
      000326 75 0E 00         [24] 1174 	mov	_memset_PARM_2,#0x00
      000329 75 0F 05         [24] 1175 	mov	_memset_PARM_3,#0x05
      00032C 75 10 00         [24] 1176 	mov	(_memset_PARM_3 + 1),#0x00
      00032F 90 00 43         [24] 1177 	mov	dptr,#(_Ep1Buffer + 0x0003)
      000332 75 F0 00         [24] 1178 	mov	b, #0x00
      000335 12 04 22         [24] 1179 	lcall	_memset
                                   1180 ;	demo_keyboard_b.c:143: UEP1_T_LEN = 8;
      000338 75 D3 08         [24] 1181 	mov	_UEP1_T_LEN,#0x08
                                   1182 ;	demo_keyboard_b.c:144: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      00033B 53 D2 FC         [24] 1183 	anl	_UEP1_CTRL,#0xfc
                                   1184 ;	demo_keyboard_b.c:146: for (uint16_t i = 0; i < 20000; i++) { USB_Process(); }
      00033E 7E 00            [12] 1185 	mov	r6,#0x00
      000340 7F 00            [12] 1186 	mov	r7,#0x00
      000342                       1187 00109$:
      000342 8E 04            [24] 1188 	mov	ar4,r6
      000344 8F 05            [24] 1189 	mov	ar5,r7
      000346 C3               [12] 1190 	clr	c
      000347 EC               [12] 1191 	mov	a,r4
      000348 94 20            [12] 1192 	subb	a,#0x20
      00034A ED               [12] 1193 	mov	a,r5
      00034B 94 4E            [12] 1194 	subb	a,#0x4e
      00034D 50 12            [24] 1195 	jnc	00105$
      00034F C0 07            [24] 1196 	push	ar7
      000351 C0 06            [24] 1197 	push	ar6
      000353 12 02 4E         [24] 1198 	lcall	_USB_Process
      000356 D0 06            [24] 1199 	pop	ar6
      000358 D0 07            [24] 1200 	pop	ar7
      00035A 0E               [12] 1201 	inc	r6
                                   1202 ;	demo_keyboard_b.c:147: while (UEP1_CTRL & 0x03) { USB_Process(); }
      00035B BE 00 E4         [24] 1203 	cjne	r6,#0x00,00109$
      00035E 0F               [12] 1204 	inc	r7
      00035F 80 E1            [24] 1205 	sjmp	00109$
      000361                       1206 00105$:
      000361 E5 D2            [12] 1207 	mov	a,_UEP1_CTRL
      000363 54 03            [12] 1208 	anl	a,#0x03
      000365 60 05            [24] 1209 	jz	00107$
      000367 12 02 4E         [24] 1210 	lcall	_USB_Process
      00036A 80 F5            [24] 1211 	sjmp	00105$
      00036C                       1212 00107$:
                                   1213 ;	demo_keyboard_b.c:148: memset(Ep1Buffer, 0, 8);
      00036C 75 0E 00         [24] 1214 	mov	_memset_PARM_2,#0x00
      00036F 75 0F 08         [24] 1215 	mov	_memset_PARM_3,#0x08
      000372 75 10 00         [24] 1216 	mov	(_memset_PARM_3 + 1),#0x00
      000375 90 00 40         [24] 1217 	mov	dptr,#_Ep1Buffer
      000378 75 F0 00         [24] 1218 	mov	b, #0x00
      00037B 12 04 22         [24] 1219 	lcall	_memset
                                   1220 ;	demo_keyboard_b.c:149: UEP1_T_LEN = 8;
      00037E 75 D3 08         [24] 1221 	mov	_UEP1_T_LEN,#0x08
                                   1222 ;	demo_keyboard_b.c:150: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      000381 53 D2 FC         [24] 1223 	anl	_UEP1_CTRL,#0xfc
                                   1224 ;	demo_keyboard_b.c:151: }
      000384 22               [24] 1225 	ret
                                   1226 ;------------------------------------------------------------
                                   1227 ;Allocation info for local variables in function 'main'
                                   1228 ;------------------------------------------------------------
                                   1229 ;i             Allocated to registers r4 r5 r6 r7 
                                   1230 ;------------------------------------------------------------
                                   1231 ;	demo_keyboard_b.c:153: void main(void) {
                                   1232 ;	-----------------------------------------
                                   1233 ;	 function main
                                   1234 ;	-----------------------------------------
      000385                       1235 _main:
                                   1236 ;	demo_keyboard_b.c:154: USB_Init();
      000385 12 00 B9         [24] 1237 	lcall	_USB_Init
                                   1238 ;	demo_keyboard_b.c:157: for (uint32_t i = 0; i < 180000UL; i++) {
      000388                       1239 00117$:
      000388 7C 00            [12] 1240 	mov	r4,#0x00
      00038A 7D 00            [12] 1241 	mov	r5,#0x00
      00038C 7E 00            [12] 1242 	mov	r6,#0x00
      00038E 7F 00            [12] 1243 	mov	r7,#0x00
      000390                       1244 00108$:
      000390 C3               [12] 1245 	clr	c
      000391 EC               [12] 1246 	mov	a,r4
      000392 94 20            [12] 1247 	subb	a,#0x20
      000394 ED               [12] 1248 	mov	a,r5
      000395 94 BF            [12] 1249 	subb	a,#0xbf
      000397 EE               [12] 1250 	mov	a,r6
      000398 94 02            [12] 1251 	subb	a,#0x02
      00039A EF               [12] 1252 	mov	a,r7
      00039B 94 00            [12] 1253 	subb	a,#0x00
      00039D 50 22            [24] 1254 	jnc	00101$
                                   1255 ;	demo_keyboard_b.c:158: USB_Process();
      00039F C0 07            [24] 1256 	push	ar7
      0003A1 C0 06            [24] 1257 	push	ar6
      0003A3 C0 05            [24] 1258 	push	ar5
      0003A5 C0 04            [24] 1259 	push	ar4
      0003A7 12 02 4E         [24] 1260 	lcall	_USB_Process
      0003AA D0 04            [24] 1261 	pop	ar4
      0003AC D0 05            [24] 1262 	pop	ar5
      0003AE D0 06            [24] 1263 	pop	ar6
      0003B0 D0 07            [24] 1264 	pop	ar7
                                   1265 ;	demo_keyboard_b.c:157: for (uint32_t i = 0; i < 180000UL; i++) {
      0003B2 0C               [12] 1266 	inc	r4
      0003B3 BC 00 09         [24] 1267 	cjne	r4,#0x00,00142$
      0003B6 0D               [12] 1268 	inc	r5
      0003B7 BD 00 05         [24] 1269 	cjne	r5,#0x00,00142$
      0003BA 0E               [12] 1270 	inc	r6
      0003BB BE 00 D2         [24] 1271 	cjne	r6,#0x00,00108$
      0003BE 0F               [12] 1272 	inc	r7
      0003BF                       1273 00142$:
      0003BF 80 CF            [24] 1274 	sjmp	00108$
      0003C1                       1275 00101$:
                                   1276 ;	demo_keyboard_b.c:162: if (usb_config != 0) {
      0003C1 E5 09            [12] 1277 	mov	a,_usb_config
      0003C3 60 C3            [24] 1278 	jz	00117$
                                   1279 ;	demo_keyboard_b.c:163: SendKey(0x05);
      0003C5 75 82 05         [24] 1280 	mov	dpl, #0x05
      0003C8 12 03 07         [24] 1281 	lcall	_SendKey
                                   1282 ;	demo_keyboard_b.c:166: }
      0003CB 80 BB            [24] 1283 	sjmp	00117$
                                   1284 	.area CSEG    (CODE)
                                   1285 	.area CONST   (CODE)
                                   1286 	.area CONST   (CODE)
      00047C                       1287 _DevDesc:
      00047C 12                    1288 	.db #0x12	; 18
      00047D 01                    1289 	.db #0x01	; 1
      00047E 10                    1290 	.db #0x10	; 16
      00047F 01                    1291 	.db #0x01	; 1
      000480 00                    1292 	.db #0x00	; 0
      000481 00                    1293 	.db #0x00	; 0
      000482 00                    1294 	.db #0x00	; 0
      000483 40                    1295 	.db #0x40	; 64
      000484 09                    1296 	.db #0x09	; 9
      000485 12                    1297 	.db #0x12	; 18
      000486 5D                    1298 	.db #0x5d	; 93
      000487 C5                    1299 	.db #0xc5	; 197
      000488 00                    1300 	.db #0x00	; 0
      000489 01                    1301 	.db #0x01	; 1
      00048A 01                    1302 	.db #0x01	; 1
      00048B 02                    1303 	.db #0x02	; 2
      00048C 00                    1304 	.db #0x00	; 0
      00048D 01                    1305 	.db #0x01	; 1
                                   1306 	.area CSEG    (CODE)
                                   1307 	.area CONST   (CODE)
      00048E                       1308 _ReportDesc:
      00048E 05                    1309 	.db #0x05	; 5
      00048F 01                    1310 	.db #0x01	; 1
      000490 09                    1311 	.db #0x09	; 9
      000491 06                    1312 	.db #0x06	; 6
      000492 A1                    1313 	.db #0xa1	; 161
      000493 01                    1314 	.db #0x01	; 1
      000494 05                    1315 	.db #0x05	; 5
      000495 07                    1316 	.db #0x07	; 7
      000496 19                    1317 	.db #0x19	; 25
      000497 E0                    1318 	.db #0xe0	; 224
      000498 29                    1319 	.db #0x29	; 41
      000499 E7                    1320 	.db #0xe7	; 231
      00049A 15                    1321 	.db #0x15	; 21
      00049B 00                    1322 	.db #0x00	; 0
      00049C 25                    1323 	.db #0x25	; 37
      00049D 01                    1324 	.db #0x01	; 1
      00049E 75                    1325 	.db #0x75	; 117	'u'
      00049F 01                    1326 	.db #0x01	; 1
      0004A0 95                    1327 	.db #0x95	; 149
      0004A1 08                    1328 	.db #0x08	; 8
      0004A2 81                    1329 	.db #0x81	; 129
      0004A3 02                    1330 	.db #0x02	; 2
      0004A4 95                    1331 	.db #0x95	; 149
      0004A5 01                    1332 	.db #0x01	; 1
      0004A6 75                    1333 	.db #0x75	; 117	'u'
      0004A7 08                    1334 	.db #0x08	; 8
      0004A8 81                    1335 	.db #0x81	; 129
      0004A9 03                    1336 	.db #0x03	; 3
      0004AA 95                    1337 	.db #0x95	; 149
      0004AB 05                    1338 	.db #0x05	; 5
      0004AC 75                    1339 	.db #0x75	; 117	'u'
      0004AD 01                    1340 	.db #0x01	; 1
      0004AE 05                    1341 	.db #0x05	; 5
      0004AF 08                    1342 	.db #0x08	; 8
      0004B0 19                    1343 	.db #0x19	; 25
      0004B1 01                    1344 	.db #0x01	; 1
      0004B2 29                    1345 	.db #0x29	; 41
      0004B3 05                    1346 	.db #0x05	; 5
      0004B4 91                    1347 	.db #0x91	; 145
      0004B5 02                    1348 	.db #0x02	; 2
      0004B6 95                    1349 	.db #0x95	; 149
      0004B7 01                    1350 	.db #0x01	; 1
      0004B8 75                    1351 	.db #0x75	; 117	'u'
      0004B9 03                    1352 	.db #0x03	; 3
      0004BA 91                    1353 	.db #0x91	; 145
      0004BB 03                    1354 	.db #0x03	; 3
      0004BC 95                    1355 	.db #0x95	; 149
      0004BD 06                    1356 	.db #0x06	; 6
      0004BE 75                    1357 	.db #0x75	; 117	'u'
      0004BF 08                    1358 	.db #0x08	; 8
      0004C0 15                    1359 	.db #0x15	; 21
      0004C1 00                    1360 	.db #0x00	; 0
      0004C2 25                    1361 	.db #0x25	; 37
      0004C3 65                    1362 	.db #0x65	; 101	'e'
      0004C4 05                    1363 	.db #0x05	; 5
      0004C5 07                    1364 	.db #0x07	; 7
      0004C6 19                    1365 	.db #0x19	; 25
      0004C7 00                    1366 	.db #0x00	; 0
      0004C8 29                    1367 	.db #0x29	; 41
      0004C9 65                    1368 	.db #0x65	; 101	'e'
      0004CA 81                    1369 	.db #0x81	; 129
      0004CB 00                    1370 	.db #0x00	; 0
      0004CC C0                    1371 	.db #0xc0	; 192
                                   1372 	.area CSEG    (CODE)
                                   1373 	.area CONST   (CODE)
      0004CD                       1374 _CfgDesc:
      0004CD 09                    1375 	.db #0x09	; 9
      0004CE 02                    1376 	.db #0x02	; 2
      0004CF 22                    1377 	.db #0x22	; 34
      0004D0 00                    1378 	.db #0x00	; 0
      0004D1 01                    1379 	.db #0x01	; 1
      0004D2 01                    1380 	.db #0x01	; 1
      0004D3 00                    1381 	.db #0x00	; 0
      0004D4 A0                    1382 	.db #0xa0	; 160
      0004D5 32                    1383 	.db #0x32	; 50	'2'
      0004D6 09                    1384 	.db #0x09	; 9
      0004D7 04                    1385 	.db #0x04	; 4
      0004D8 00                    1386 	.db #0x00	; 0
      0004D9 00                    1387 	.db #0x00	; 0
      0004DA 01                    1388 	.db #0x01	; 1
      0004DB 03                    1389 	.db #0x03	; 3
      0004DC 01                    1390 	.db #0x01	; 1
      0004DD 01                    1391 	.db #0x01	; 1
      0004DE 00                    1392 	.db #0x00	; 0
      0004DF 09                    1393 	.db #0x09	; 9
      0004E0 21                    1394 	.db #0x21	; 33
      0004E1 11                    1395 	.db #0x11	; 17
      0004E2 01                    1396 	.db #0x01	; 1
      0004E3 00                    1397 	.db #0x00	; 0
      0004E4 01                    1398 	.db #0x01	; 1
      0004E5 22                    1399 	.db #0x22	; 34
      0004E6 3F                    1400 	.db #0x3f	; 63
      0004E7 00                    1401 	.db #0x00	; 0
      0004E8 07                    1402 	.db #0x07	; 7
      0004E9 05                    1403 	.db #0x05	; 5
      0004EA 81                    1404 	.db #0x81	; 129
      0004EB 03                    1405 	.db #0x03	; 3
      0004EC 08                    1406 	.db #0x08	; 8
      0004ED 00                    1407 	.db #0x00	; 0
      0004EE 0A                    1408 	.db #0x0a	; 10
                                   1409 	.area CSEG    (CODE)
                                   1410 	.area CONST   (CODE)
      0004EF                       1411 _Str0Desc:
      0004EF 04                    1412 	.db #0x04	; 4
      0004F0 03                    1413 	.db #0x03	; 3
      0004F1 09                    1414 	.db #0x09	; 9
      0004F2 04                    1415 	.db #0x04	; 4
                                   1416 	.area CSEG    (CODE)
                                   1417 	.area CONST   (CODE)
      0004F3                       1418 _Str1Desc:
      0004F3 0E                    1419 	.db #0x0e	; 14
      0004F4 03                    1420 	.db #0x03	; 3
      0004F5 44                    1421 	.db #0x44	; 68	'D'
      0004F6 00                    1422 	.db #0x00	; 0
      0004F7 65                    1423 	.db #0x65	; 101	'e'
      0004F8 00                    1424 	.db #0x00	; 0
      0004F9 76                    1425 	.db #0x76	; 118	'v'
      0004FA 00                    1426 	.db #0x00	; 0
      0004FB 42                    1427 	.db #0x42	; 66	'B'
      0004FC 00                    1428 	.db #0x00	; 0
      0004FD 6F                    1429 	.db #0x6f	; 111	'o'
      0004FE 00                    1430 	.db #0x00	; 0
      0004FF 78                    1431 	.db #0x78	; 120	'x'
      000500 00                    1432 	.db #0x00	; 0
                                   1433 	.area CSEG    (CODE)
                                   1434 	.area CONST   (CODE)
      000501                       1435 _Str2Desc:
      000501 1A                    1436 	.db #0x1a	; 26
      000502 03                    1437 	.db #0x03	; 3
      000503 43                    1438 	.db #0x43	; 67	'C'
      000504 00                    1439 	.db #0x00	; 0
      000505 48                    1440 	.db #0x48	; 72	'H'
      000506 00                    1441 	.db #0x00	; 0
      000507 35                    1442 	.db #0x35	; 53	'5'
      000508 00                    1443 	.db #0x00	; 0
      000509 35                    1444 	.db #0x35	; 53	'5'
      00050A 00                    1445 	.db #0x00	; 0
      00050B 32                    1446 	.db #0x32	; 50	'2'
      00050C 00                    1447 	.db #0x00	; 0
      00050D 20                    1448 	.db #0x20	; 32
      00050E 00                    1449 	.db #0x00	; 0
      00050F 4B                    1450 	.db #0x4b	; 75	'K'
      000510 00                    1451 	.db #0x00	; 0
      000511 65                    1452 	.db #0x65	; 101	'e'
      000512 00                    1453 	.db #0x00	; 0
      000513 79                    1454 	.db #0x79	; 121	'y'
      000514 00                    1455 	.db #0x00	; 0
      000515 20                    1456 	.db #0x20	; 32
      000516 00                    1457 	.db #0x00	; 0
      000517 42                    1458 	.db #0x42	; 66	'B'
      000518 00                    1459 	.db #0x00	; 0
                                   1460 	.area CSEG    (CODE)
                                   1461 	.area XINIT   (CODE)
                                   1462 	.area CABS    (ABS,CODE)
