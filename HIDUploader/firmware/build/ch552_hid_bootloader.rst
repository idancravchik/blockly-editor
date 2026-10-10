                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.6.0 #16555 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module bootloader
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _IAP_CalculateCRC16_PARM_2
                                     12 	.globl _IAP_WriteWord_PARM_2
                                     13 	.globl _main
                                     14 	.globl ___memcpy
                                     15 	.globl _memset
                                     16 	.globl _UIF_BUS_RST
                                     17 	.globl _UIF_DETECT
                                     18 	.globl _UIF_TRANSFER
                                     19 	.globl _UIF_SUSPEND
                                     20 	.globl _UIF_HST_SOF
                                     21 	.globl _UIF_FIFO_OV
                                     22 	.globl _U_SIE_FREE
                                     23 	.globl _U_TOG_OK
                                     24 	.globl _U_IS_NAK
                                     25 	.globl _ADC_CHAN0
                                     26 	.globl _ADC_CHAN1
                                     27 	.globl _CMP_CHAN
                                     28 	.globl _ADC_START
                                     29 	.globl _ADC_IF
                                     30 	.globl _CMP_IF
                                     31 	.globl _CMPO
                                     32 	.globl _U1RI
                                     33 	.globl _U1TI
                                     34 	.globl _U1RB8
                                     35 	.globl _U1TB8
                                     36 	.globl _U1REN
                                     37 	.globl _U1SMOD
                                     38 	.globl _U1SM0
                                     39 	.globl _S0_R_FIFO
                                     40 	.globl _S0_T_FIFO
                                     41 	.globl _S0_FREE
                                     42 	.globl _S0_IF_BYTE
                                     43 	.globl _S0_IF_FIRST
                                     44 	.globl _S0_IF_OV
                                     45 	.globl _S0_FST_ACT
                                     46 	.globl _CP_RL2
                                     47 	.globl _C_T2
                                     48 	.globl _TR2
                                     49 	.globl _EXEN2
                                     50 	.globl _TCLK
                                     51 	.globl _RCLK
                                     52 	.globl _EXF2
                                     53 	.globl _CAP1F
                                     54 	.globl _TF2
                                     55 	.globl _RI
                                     56 	.globl _TI
                                     57 	.globl _RB8
                                     58 	.globl _TB8
                                     59 	.globl _REN
                                     60 	.globl _SM2
                                     61 	.globl _SM1
                                     62 	.globl _SM0
                                     63 	.globl _IT0
                                     64 	.globl _IE0
                                     65 	.globl _IT1
                                     66 	.globl _IE1
                                     67 	.globl _TR0
                                     68 	.globl _TF0
                                     69 	.globl _TR1
                                     70 	.globl _TF1
                                     71 	.globl _P3_0
                                     72 	.globl _P3_1
                                     73 	.globl _P3_2
                                     74 	.globl _P3_3
                                     75 	.globl _P3_4
                                     76 	.globl _P3_5
                                     77 	.globl _P3_6
                                     78 	.globl _P3_7
                                     79 	.globl _RXD
                                     80 	.globl _PWM1_
                                     81 	.globl _TXD
                                     82 	.globl _PWM2_
                                     83 	.globl _AIN3
                                     84 	.globl _VBUS1
                                     85 	.globl _INT0
                                     86 	.globl _TXD1_
                                     87 	.globl _INT1
                                     88 	.globl _T0
                                     89 	.globl _RXD1_
                                     90 	.globl _PWM2
                                     91 	.globl _T1
                                     92 	.globl _UDP
                                     93 	.globl _UDM
                                     94 	.globl _P1_0
                                     95 	.globl _P1_1
                                     96 	.globl _P1_2
                                     97 	.globl _P1_3
                                     98 	.globl _P1_4
                                     99 	.globl _P1_5
                                    100 	.globl _P1_6
                                    101 	.globl _P1_7
                                    102 	.globl _TIN0
                                    103 	.globl _CAP1
                                    104 	.globl _T2
                                    105 	.globl _AIN0
                                    106 	.globl _VBUS2
                                    107 	.globl _TIN1
                                    108 	.globl _CAP2
                                    109 	.globl _T2EX
                                    110 	.globl _RXD_
                                    111 	.globl _TXD_
                                    112 	.globl _AIN1
                                    113 	.globl _UCC1
                                    114 	.globl _TIN2
                                    115 	.globl _SCS
                                    116 	.globl _CAP1_
                                    117 	.globl _T2_
                                    118 	.globl _AIN2
                                    119 	.globl _UCC2
                                    120 	.globl _TIN3
                                    121 	.globl _PWM1
                                    122 	.globl _MOSI
                                    123 	.globl _TIN4
                                    124 	.globl _RXD1
                                    125 	.globl _MISO
                                    126 	.globl _TIN5
                                    127 	.globl _TXD1
                                    128 	.globl _SCK
                                    129 	.globl _IE_SPI0
                                    130 	.globl _IE_TKEY
                                    131 	.globl _IE_USB
                                    132 	.globl _IE_ADC
                                    133 	.globl _IE_UART1
                                    134 	.globl _IE_PWMX
                                    135 	.globl _IE_GPIO
                                    136 	.globl _IE_WDOG
                                    137 	.globl _PX0
                                    138 	.globl _PT0
                                    139 	.globl _PX1
                                    140 	.globl _PT1
                                    141 	.globl _PS
                                    142 	.globl _PT2
                                    143 	.globl _PL_FLAG
                                    144 	.globl _PH_FLAG
                                    145 	.globl _EX0
                                    146 	.globl _ET0
                                    147 	.globl _EX1
                                    148 	.globl _ET1
                                    149 	.globl _ES
                                    150 	.globl _ET2
                                    151 	.globl _E_DIS
                                    152 	.globl _EA
                                    153 	.globl _P
                                    154 	.globl _F1
                                    155 	.globl _OV
                                    156 	.globl _RS0
                                    157 	.globl _RS1
                                    158 	.globl _F0
                                    159 	.globl _AC
                                    160 	.globl _CY
                                    161 	.globl _UEP1_DMA_H
                                    162 	.globl _UEP1_DMA_L
                                    163 	.globl _UEP1_DMA
                                    164 	.globl _UEP0_DMA_H
                                    165 	.globl _UEP0_DMA_L
                                    166 	.globl _UEP0_DMA
                                    167 	.globl _UEP2_3_MOD
                                    168 	.globl _UEP4_1_MOD
                                    169 	.globl _UEP3_DMA_H
                                    170 	.globl _UEP3_DMA_L
                                    171 	.globl _UEP3_DMA
                                    172 	.globl _UEP2_DMA_H
                                    173 	.globl _UEP2_DMA_L
                                    174 	.globl _UEP2_DMA
                                    175 	.globl _USB_DEV_AD
                                    176 	.globl _USB_CTRL
                                    177 	.globl _USB_INT_EN
                                    178 	.globl _UEP4_T_LEN
                                    179 	.globl _UEP4_CTRL
                                    180 	.globl _UEP0_T_LEN
                                    181 	.globl _UEP0_CTRL
                                    182 	.globl _USB_RX_LEN
                                    183 	.globl _USB_MIS_ST
                                    184 	.globl _USB_INT_ST
                                    185 	.globl _USB_INT_FG
                                    186 	.globl _UEP3_T_LEN
                                    187 	.globl _UEP3_CTRL
                                    188 	.globl _UEP2_T_LEN
                                    189 	.globl _UEP2_CTRL
                                    190 	.globl _UEP1_T_LEN
                                    191 	.globl _UEP1_CTRL
                                    192 	.globl _UDEV_CTRL
                                    193 	.globl _USB_C_CTRL
                                    194 	.globl _TKEY_DATH
                                    195 	.globl _TKEY_DATL
                                    196 	.globl _TKEY_DAT
                                    197 	.globl _TKEY_CTRL
                                    198 	.globl _ADC_DATA
                                    199 	.globl _ADC_CFG
                                    200 	.globl _ADC_CTRL
                                    201 	.globl _SBAUD1
                                    202 	.globl _SBUF1
                                    203 	.globl _SCON1
                                    204 	.globl _SPI0_SETUP
                                    205 	.globl _SPI0_CK_SE
                                    206 	.globl _SPI0_CTRL
                                    207 	.globl _SPI0_DATA
                                    208 	.globl _SPI0_STAT
                                    209 	.globl _PWM_CK_SE
                                    210 	.globl _PWM_CTRL
                                    211 	.globl _PWM_DATA1
                                    212 	.globl _PWM_DATA2
                                    213 	.globl _T2CAP1H
                                    214 	.globl _T2CAP1L
                                    215 	.globl _T2CAP1
                                    216 	.globl _TH2
                                    217 	.globl _TL2
                                    218 	.globl _T2COUNT
                                    219 	.globl _RCAP2H
                                    220 	.globl _RCAP2L
                                    221 	.globl _RCAP2
                                    222 	.globl _T2MOD
                                    223 	.globl _T2CON
                                    224 	.globl _SBUF
                                    225 	.globl _SCON
                                    226 	.globl _TH1
                                    227 	.globl _TH0
                                    228 	.globl _TL1
                                    229 	.globl _TL0
                                    230 	.globl _TMOD
                                    231 	.globl _TCON
                                    232 	.globl _XBUS_AUX
                                    233 	.globl _PIN_FUNC
                                    234 	.globl _P3_DIR_PU
                                    235 	.globl _P3_MOD_OC
                                    236 	.globl _P3
                                    237 	.globl _P2
                                    238 	.globl _P1_DIR_PU
                                    239 	.globl _P1_MOD_OC
                                    240 	.globl _P1
                                    241 	.globl _ROM_CTRL
                                    242 	.globl _ROM_DATA_H
                                    243 	.globl _ROM_DATA_L
                                    244 	.globl _ROM_DATA
                                    245 	.globl _ROM_ADDR_H
                                    246 	.globl _ROM_ADDR_L
                                    247 	.globl _ROM_ADDR
                                    248 	.globl _GPIO_IE
                                    249 	.globl _IP_EX
                                    250 	.globl _IE_EX
                                    251 	.globl _IP
                                    252 	.globl _IE
                                    253 	.globl _WDOG_COUNT
                                    254 	.globl _RESET_KEEP
                                    255 	.globl _WAKE_CTRL
                                    256 	.globl _CLOCK_CFG
                                    257 	.globl _PCON
                                    258 	.globl _GLOBAL_CFG
                                    259 	.globl _SAFE_MOD
                                    260 	.globl _DPH
                                    261 	.globl _DPL
                                    262 	.globl _SP
                                    263 	.globl _B
                                    264 	.globl _ACC
                                    265 	.globl _PSW
                                    266 	.globl _Ep1Buffer
                                    267 	.globl _Ep0Buffer
                                    268 	.globl _USB_SendReport_PARM_2
                                    269 	.globl _IAP_WriteWord
                                    270 	.globl _IAP_ReadWord
                                    271 	.globl _IAP_CalculateCRC16
                                    272 	.globl _USB_Init
                                    273 	.globl _USB_Process
                                    274 	.globl _USB_Available
                                    275 	.globl _USB_GetRxBuffer
                                    276 	.globl _USB_ReleaseRx
                                    277 	.globl _USB_SendReport
                                    278 	.globl _USB_Shutdown
                                    279 ;--------------------------------------------------------
                                    280 ; special function registers
                                    281 ;--------------------------------------------------------
                                    282 	.area RSEG    (ABS,DATA)
      000000                        283 	.org 0x0000
                           0000D0   284 _PSW	=	0x00d0
                           0000E0   285 _ACC	=	0x00e0
                           0000F0   286 _B	=	0x00f0
                           000081   287 _SP	=	0x0081
                           000082   288 _DPL	=	0x0082
                           000083   289 _DPH	=	0x0083
                           0000A1   290 _SAFE_MOD	=	0x00a1
                           0000B1   291 _GLOBAL_CFG	=	0x00b1
                           000087   292 _PCON	=	0x0087
                           0000B9   293 _CLOCK_CFG	=	0x00b9
                           0000A9   294 _WAKE_CTRL	=	0x00a9
                           0000FE   295 _RESET_KEEP	=	0x00fe
                           0000FF   296 _WDOG_COUNT	=	0x00ff
                           0000A8   297 _IE	=	0x00a8
                           0000B8   298 _IP	=	0x00b8
                           0000E8   299 _IE_EX	=	0x00e8
                           0000E9   300 _IP_EX	=	0x00e9
                           0000C7   301 _GPIO_IE	=	0x00c7
                           008584   302 _ROM_ADDR	=	0x8584
                           000084   303 _ROM_ADDR_L	=	0x0084
                           000085   304 _ROM_ADDR_H	=	0x0085
                           008F8E   305 _ROM_DATA	=	0x8f8e
                           00008E   306 _ROM_DATA_L	=	0x008e
                           00008F   307 _ROM_DATA_H	=	0x008f
                           000086   308 _ROM_CTRL	=	0x0086
                           000090   309 _P1	=	0x0090
                           000092   310 _P1_MOD_OC	=	0x0092
                           000093   311 _P1_DIR_PU	=	0x0093
                           0000A0   312 _P2	=	0x00a0
                           0000B0   313 _P3	=	0x00b0
                           000096   314 _P3_MOD_OC	=	0x0096
                           000097   315 _P3_DIR_PU	=	0x0097
                           0000C6   316 _PIN_FUNC	=	0x00c6
                           0000A2   317 _XBUS_AUX	=	0x00a2
                           000088   318 _TCON	=	0x0088
                           000089   319 _TMOD	=	0x0089
                           00008A   320 _TL0	=	0x008a
                           00008B   321 _TL1	=	0x008b
                           00008C   322 _TH0	=	0x008c
                           00008D   323 _TH1	=	0x008d
                           000098   324 _SCON	=	0x0098
                           000099   325 _SBUF	=	0x0099
                           0000C8   326 _T2CON	=	0x00c8
                           0000C9   327 _T2MOD	=	0x00c9
                           00CBCA   328 _RCAP2	=	0xcbca
                           0000CA   329 _RCAP2L	=	0x00ca
                           0000CB   330 _RCAP2H	=	0x00cb
                           00CDCC   331 _T2COUNT	=	0xcdcc
                           0000CC   332 _TL2	=	0x00cc
                           0000CD   333 _TH2	=	0x00cd
                           00CFCE   334 _T2CAP1	=	0xcfce
                           0000CE   335 _T2CAP1L	=	0x00ce
                           0000CF   336 _T2CAP1H	=	0x00cf
                           00009B   337 _PWM_DATA2	=	0x009b
                           00009C   338 _PWM_DATA1	=	0x009c
                           00009D   339 _PWM_CTRL	=	0x009d
                           00009E   340 _PWM_CK_SE	=	0x009e
                           0000F8   341 _SPI0_STAT	=	0x00f8
                           0000F9   342 _SPI0_DATA	=	0x00f9
                           0000FA   343 _SPI0_CTRL	=	0x00fa
                           0000FB   344 _SPI0_CK_SE	=	0x00fb
                           0000FC   345 _SPI0_SETUP	=	0x00fc
                           0000C0   346 _SCON1	=	0x00c0
                           0000C1   347 _SBUF1	=	0x00c1
                           0000C2   348 _SBAUD1	=	0x00c2
                           000080   349 _ADC_CTRL	=	0x0080
                           00009A   350 _ADC_CFG	=	0x009a
                           00009F   351 _ADC_DATA	=	0x009f
                           0000C3   352 _TKEY_CTRL	=	0x00c3
                           00C5C4   353 _TKEY_DAT	=	0xc5c4
                           0000C4   354 _TKEY_DATL	=	0x00c4
                           0000C5   355 _TKEY_DATH	=	0x00c5
                           000091   356 _USB_C_CTRL	=	0x0091
                           0000D1   357 _UDEV_CTRL	=	0x00d1
                           0000D2   358 _UEP1_CTRL	=	0x00d2
                           0000D3   359 _UEP1_T_LEN	=	0x00d3
                           0000D4   360 _UEP2_CTRL	=	0x00d4
                           0000D5   361 _UEP2_T_LEN	=	0x00d5
                           0000D6   362 _UEP3_CTRL	=	0x00d6
                           0000D7   363 _UEP3_T_LEN	=	0x00d7
                           0000D8   364 _USB_INT_FG	=	0x00d8
                           0000D9   365 _USB_INT_ST	=	0x00d9
                           0000DA   366 _USB_MIS_ST	=	0x00da
                           0000DB   367 _USB_RX_LEN	=	0x00db
                           0000DC   368 _UEP0_CTRL	=	0x00dc
                           0000DD   369 _UEP0_T_LEN	=	0x00dd
                           0000DE   370 _UEP4_CTRL	=	0x00de
                           0000DF   371 _UEP4_T_LEN	=	0x00df
                           0000E1   372 _USB_INT_EN	=	0x00e1
                           0000E2   373 _USB_CTRL	=	0x00e2
                           0000E3   374 _USB_DEV_AD	=	0x00e3
                           00E5E4   375 _UEP2_DMA	=	0xe5e4
                           0000E4   376 _UEP2_DMA_L	=	0x00e4
                           0000E5   377 _UEP2_DMA_H	=	0x00e5
                           00E7E6   378 _UEP3_DMA	=	0xe7e6
                           0000E6   379 _UEP3_DMA_L	=	0x00e6
                           0000E7   380 _UEP3_DMA_H	=	0x00e7
                           0000EA   381 _UEP4_1_MOD	=	0x00ea
                           0000EB   382 _UEP2_3_MOD	=	0x00eb
                           00EDEC   383 _UEP0_DMA	=	0xedec
                           0000EC   384 _UEP0_DMA_L	=	0x00ec
                           0000ED   385 _UEP0_DMA_H	=	0x00ed
                           00EFEE   386 _UEP1_DMA	=	0xefee
                           0000EE   387 _UEP1_DMA_L	=	0x00ee
                           0000EF   388 _UEP1_DMA_H	=	0x00ef
                                    389 ;--------------------------------------------------------
                                    390 ; special function bits
                                    391 ;--------------------------------------------------------
                                    392 	.area RSEG    (ABS,DATA)
      000000                        393 	.org 0x0000
                           0000D7   394 _CY	=	0x00d7
                           0000D6   395 _AC	=	0x00d6
                           0000D5   396 _F0	=	0x00d5
                           0000D4   397 _RS1	=	0x00d4
                           0000D3   398 _RS0	=	0x00d3
                           0000D2   399 _OV	=	0x00d2
                           0000D1   400 _F1	=	0x00d1
                           0000D0   401 _P	=	0x00d0
                           0000AF   402 _EA	=	0x00af
                           0000AE   403 _E_DIS	=	0x00ae
                           0000AD   404 _ET2	=	0x00ad
                           0000AC   405 _ES	=	0x00ac
                           0000AB   406 _ET1	=	0x00ab
                           0000AA   407 _EX1	=	0x00aa
                           0000A9   408 _ET0	=	0x00a9
                           0000A8   409 _EX0	=	0x00a8
                           0000BF   410 _PH_FLAG	=	0x00bf
                           0000BE   411 _PL_FLAG	=	0x00be
                           0000BD   412 _PT2	=	0x00bd
                           0000BC   413 _PS	=	0x00bc
                           0000BB   414 _PT1	=	0x00bb
                           0000BA   415 _PX1	=	0x00ba
                           0000B9   416 _PT0	=	0x00b9
                           0000B8   417 _PX0	=	0x00b8
                           0000EF   418 _IE_WDOG	=	0x00ef
                           0000EE   419 _IE_GPIO	=	0x00ee
                           0000ED   420 _IE_PWMX	=	0x00ed
                           0000EC   421 _IE_UART1	=	0x00ec
                           0000EB   422 _IE_ADC	=	0x00eb
                           0000EA   423 _IE_USB	=	0x00ea
                           0000E9   424 _IE_TKEY	=	0x00e9
                           0000E8   425 _IE_SPI0	=	0x00e8
                           000097   426 _SCK	=	0x0097
                           000097   427 _TXD1	=	0x0097
                           000097   428 _TIN5	=	0x0097
                           000096   429 _MISO	=	0x0096
                           000096   430 _RXD1	=	0x0096
                           000096   431 _TIN4	=	0x0096
                           000095   432 _MOSI	=	0x0095
                           000095   433 _PWM1	=	0x0095
                           000095   434 _TIN3	=	0x0095
                           000095   435 _UCC2	=	0x0095
                           000095   436 _AIN2	=	0x0095
                           000094   437 _T2_	=	0x0094
                           000094   438 _CAP1_	=	0x0094
                           000094   439 _SCS	=	0x0094
                           000094   440 _TIN2	=	0x0094
                           000094   441 _UCC1	=	0x0094
                           000094   442 _AIN1	=	0x0094
                           000093   443 _TXD_	=	0x0093
                           000092   444 _RXD_	=	0x0092
                           000091   445 _T2EX	=	0x0091
                           000091   446 _CAP2	=	0x0091
                           000091   447 _TIN1	=	0x0091
                           000091   448 _VBUS2	=	0x0091
                           000091   449 _AIN0	=	0x0091
                           000090   450 _T2	=	0x0090
                           000090   451 _CAP1	=	0x0090
                           000090   452 _TIN0	=	0x0090
                           000097   453 _P1_7	=	0x0097
                           000096   454 _P1_6	=	0x0096
                           000095   455 _P1_5	=	0x0095
                           000094   456 _P1_4	=	0x0094
                           000093   457 _P1_3	=	0x0093
                           000092   458 _P1_2	=	0x0092
                           000091   459 _P1_1	=	0x0091
                           000090   460 _P1_0	=	0x0090
                           0000B7   461 _UDM	=	0x00b7
                           0000B6   462 _UDP	=	0x00b6
                           0000B5   463 _T1	=	0x00b5
                           0000B4   464 _PWM2	=	0x00b4
                           0000B4   465 _RXD1_	=	0x00b4
                           0000B4   466 _T0	=	0x00b4
                           0000B3   467 _INT1	=	0x00b3
                           0000B2   468 _TXD1_	=	0x00b2
                           0000B2   469 _INT0	=	0x00b2
                           0000B2   470 _VBUS1	=	0x00b2
                           0000B2   471 _AIN3	=	0x00b2
                           0000B1   472 _PWM2_	=	0x00b1
                           0000B1   473 _TXD	=	0x00b1
                           0000B0   474 _PWM1_	=	0x00b0
                           0000B0   475 _RXD	=	0x00b0
                           0000B7   476 _P3_7	=	0x00b7
                           0000B6   477 _P3_6	=	0x00b6
                           0000B5   478 _P3_5	=	0x00b5
                           0000B4   479 _P3_4	=	0x00b4
                           0000B3   480 _P3_3	=	0x00b3
                           0000B2   481 _P3_2	=	0x00b2
                           0000B1   482 _P3_1	=	0x00b1
                           0000B0   483 _P3_0	=	0x00b0
                           00008F   484 _TF1	=	0x008f
                           00008E   485 _TR1	=	0x008e
                           00008D   486 _TF0	=	0x008d
                           00008C   487 _TR0	=	0x008c
                           00008B   488 _IE1	=	0x008b
                           00008A   489 _IT1	=	0x008a
                           000089   490 _IE0	=	0x0089
                           000088   491 _IT0	=	0x0088
                           00009F   492 _SM0	=	0x009f
                           00009E   493 _SM1	=	0x009e
                           00009D   494 _SM2	=	0x009d
                           00009C   495 _REN	=	0x009c
                           00009B   496 _TB8	=	0x009b
                           00009A   497 _RB8	=	0x009a
                           000099   498 _TI	=	0x0099
                           000098   499 _RI	=	0x0098
                           0000CF   500 _TF2	=	0x00cf
                           0000CF   501 _CAP1F	=	0x00cf
                           0000CE   502 _EXF2	=	0x00ce
                           0000CD   503 _RCLK	=	0x00cd
                           0000CC   504 _TCLK	=	0x00cc
                           0000CB   505 _EXEN2	=	0x00cb
                           0000CA   506 _TR2	=	0x00ca
                           0000C9   507 _C_T2	=	0x00c9
                           0000C8   508 _CP_RL2	=	0x00c8
                           0000FF   509 _S0_FST_ACT	=	0x00ff
                           0000FE   510 _S0_IF_OV	=	0x00fe
                           0000FD   511 _S0_IF_FIRST	=	0x00fd
                           0000FC   512 _S0_IF_BYTE	=	0x00fc
                           0000FB   513 _S0_FREE	=	0x00fb
                           0000FA   514 _S0_T_FIFO	=	0x00fa
                           0000F8   515 _S0_R_FIFO	=	0x00f8
                           0000C7   516 _U1SM0	=	0x00c7
                           0000C5   517 _U1SMOD	=	0x00c5
                           0000C4   518 _U1REN	=	0x00c4
                           0000C3   519 _U1TB8	=	0x00c3
                           0000C2   520 _U1RB8	=	0x00c2
                           0000C1   521 _U1TI	=	0x00c1
                           0000C0   522 _U1RI	=	0x00c0
                           000087   523 _CMPO	=	0x0087
                           000086   524 _CMP_IF	=	0x0086
                           000085   525 _ADC_IF	=	0x0085
                           000084   526 _ADC_START	=	0x0084
                           000083   527 _CMP_CHAN	=	0x0083
                           000081   528 _ADC_CHAN1	=	0x0081
                           000080   529 _ADC_CHAN0	=	0x0080
                           0000DF   530 _U_IS_NAK	=	0x00df
                           0000DE   531 _U_TOG_OK	=	0x00de
                           0000DD   532 _U_SIE_FREE	=	0x00dd
                           0000DC   533 _UIF_FIFO_OV	=	0x00dc
                           0000DB   534 _UIF_HST_SOF	=	0x00db
                           0000DA   535 _UIF_SUSPEND	=	0x00da
                           0000D9   536 _UIF_TRANSFER	=	0x00d9
                           0000D8   537 _UIF_DETECT	=	0x00d8
                           0000D8   538 _UIF_BUS_RST	=	0x00d8
                                    539 ;--------------------------------------------------------
                                    540 ; overlayable register banks
                                    541 ;--------------------------------------------------------
                                    542 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        543 	.ds 8
                                    544 ;--------------------------------------------------------
                                    545 ; internal ram data
                                    546 ;--------------------------------------------------------
                                    547 	.area DSEG    (DATA)
      000021                        548 _rx_ready:
      000021                        549 	.ds 1
      000022                        550 _usb_dev_addr:
      000022                        551 	.ds 1
      000023                        552 _usb_config:
      000023                        553 	.ds 1
      000024                        554 _setup_tx_ptr:
      000024                        555 	.ds 2
      000026                        556 _setup_tx_len:
      000026                        557 	.ds 2
      000028                        558 _USB_SendReport_PARM_2:
      000028                        559 	.ds 1
      000029                        560 _is_unlocked:
      000029                        561 	.ds 1
      00002A                        562 _ProcessPacket_rx_10000_119:
      00002A                        563 	.ds 3
      00002D                        564 _ProcessPacket_cmd_10000_119:
      00002D                        565 	.ds 1
      00002E                        566 _ProcessPacket_seq_10000_119:
      00002E                        567 	.ds 1
      00002F                        568 _ProcessPacket_addr_10000_119:
      00002F                        569 	.ds 2
      000031                        570 _ProcessPacket_len_10000_119:
      000031                        571 	.ds 1
      000032                        572 _ProcessPacket_err_40000_129:
      000032                        573 	.ds 1
      000033                        574 _ProcessPacket_i_50000_130:
      000033                        575 	.ds 1
      000034                        576 _ProcessPacket_sloc0_1_0:
      000034                        577 	.ds 1
      000035                        578 _ProcessPacket_sloc1_1_0:
      000035                        579 	.ds 2
      000037                        580 _ProcessPacket_sloc2_1_0:
      000037                        581 	.ds 3
                                    582 ;--------------------------------------------------------
                                    583 ; overlayable items in internal ram
                                    584 ;--------------------------------------------------------
                                    585 	.area	OSEG    (OVR,DATA)
      000008                        586 _IAP_WriteWord_PARM_2:
      000008                        587 	.ds 2
                                    588 	.area	OSEG    (OVR,DATA)
                                    589 	.area	OSEG    (OVR,DATA)
      000008                        590 _IAP_CalculateCRC16_PARM_2:
      000008                        591 	.ds 2
      00000A                        592 _IAP_CalculateCRC16_i_20000_21:
      00000A                        593 	.ds 2
                                    594 	.area	OSEG    (OVR,DATA)
                                    595 ;--------------------------------------------------------
                                    596 ; Stack segment in internal ram
                                    597 ;--------------------------------------------------------
                                    598 	.area SSEG
      00003A                        599 __start__stack:
      00003A                        600 	.ds	1
                                    601 
                                    602 ;--------------------------------------------------------
                                    603 ; indirectly addressable internal ram data
                                    604 ;--------------------------------------------------------
                                    605 	.area ISEG    (DATA)
                                    606 ;--------------------------------------------------------
                                    607 ; absolute internal ram data
                                    608 ;--------------------------------------------------------
                                    609 	.area IABS    (ABS,DATA)
                                    610 	.area IABS    (ABS,DATA)
                                    611 ;--------------------------------------------------------
                                    612 ; bit data
                                    613 ;--------------------------------------------------------
                                    614 	.area BSEG    (BIT)
      000000                        615 _main_sloc0_1_0:
      000000                        616 	.ds 1
                                    617 ;--------------------------------------------------------
                                    618 ; paged external ram data
                                    619 ;--------------------------------------------------------
                                    620 	.area PSEG    (PAG,XDATA)
                                    621 ;--------------------------------------------------------
                                    622 ; uninitialized external ram data
                                    623 ;--------------------------------------------------------
                                    624 	.area XSEG    (XDATA)
                           000000   625 _Ep0Buffer	=	0x0000
                           000040   626 _Ep1Buffer	=	0x0040
      000000                        627 _reply_buf:
      000000                        628 	.ds 64
                                    629 ;--------------------------------------------------------
                                    630 ; absolute external ram data
                                    631 ;--------------------------------------------------------
                                    632 	.area XABS    (ABS,XDATA)
                                    633 ;--------------------------------------------------------
                                    634 ; initialized external ram data
                                    635 ;--------------------------------------------------------
                                    636 	.area XISEG   (XDATA)
                                    637 	.area HOME    (CODE)
                                    638 	.area GSINIT0 (CODE)
                                    639 	.area GSINIT1 (CODE)
                                    640 	.area GSINIT2 (CODE)
                                    641 	.area GSINIT3 (CODE)
                                    642 	.area GSINIT4 (CODE)
                                    643 	.area GSINIT5 (CODE)
                                    644 	.area GSINIT  (CODE)
                                    645 	.area GSFINAL (CODE)
                                    646 	.area CSEG    (CODE)
                                    647 ;--------------------------------------------------------
                                    648 ; interrupt vector
                                    649 ;--------------------------------------------------------
                                    650 	.area HOME    (CODE)
      002C00                        651 __interrupt_vect:
      002C00 02 2C 4E         [24]  652 	ljmp	__sdcc_gsinit_startup
                                    653 ; restartable atomic support routines
      002C03                        654 	.ds	5
      002C08                        655 sdcc_atomic_exchange_rollback_start::
      002C08 00               [12]  656 	nop
      002C09 00               [12]  657 	nop
      002C0A                        658 sdcc_atomic_exchange_pdata_impl:
      002C0A E2               [24]  659 	movx	a, @r0
      002C0B FB               [12]  660 	mov	r3, a
      002C0C EA               [12]  661 	mov	a, r2
      002C0D F2               [24]  662 	movx	@r0, a
      002C0E 80 2C            [24]  663 	sjmp	sdcc_atomic_exchange_exit
      002C10 00               [12]  664 	nop
      002C11 00               [12]  665 	nop
      002C12                        666 sdcc_atomic_exchange_xdata_impl:
      002C12 E0               [24]  667 	movx	a, @dptr
      002C13 FB               [12]  668 	mov	r3, a
      002C14 EA               [12]  669 	mov	a, r2
      002C15 F0               [24]  670 	movx	@dptr, a
      002C16 80 24            [24]  671 	sjmp	sdcc_atomic_exchange_exit
      002C18                        672 sdcc_atomic_compare_exchange_idata_impl:
      002C18 E6               [12]  673 	mov	a, @r0
      002C19 B5 02 02         [24]  674 	cjne	a, ar2, .+#5
      002C1C EB               [12]  675 	mov	a, r3
      002C1D F6               [12]  676 	mov	@r0, a
      002C1E 22               [24]  677 	ret
      002C1F 00               [12]  678 	nop
      002C20                        679 sdcc_atomic_compare_exchange_pdata_impl:
      002C20 E2               [24]  680 	movx	a, @r0
      002C21 B5 02 02         [24]  681 	cjne	a, ar2, .+#5
      002C24 EB               [12]  682 	mov	a, r3
      002C25 F2               [24]  683 	movx	@r0, a
      002C26 22               [24]  684 	ret
      002C27 00               [12]  685 	nop
      002C28                        686 sdcc_atomic_compare_exchange_xdata_impl:
      002C28 E0               [24]  687 	movx	a, @dptr
      002C29 B5 02 02         [24]  688 	cjne	a, ar2, .+#5
      002C2C EB               [12]  689 	mov	a, r3
      002C2D F0               [24]  690 	movx	@dptr, a
      002C2E 22               [24]  691 	ret
      002C2F                        692 sdcc_atomic_exchange_rollback_end::
                                    693 
      002C2F                        694 sdcc_atomic_exchange_gptr_impl::
      002C2F 30 F6 E0         [24]  695 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      002C32 A8 82            [24]  696 	mov	r0, dpl
      002C34 20 F5 D3         [24]  697 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      002C37                        698 sdcc_atomic_exchange_idata_impl:
      002C37 EA               [12]  699 	mov	a, r2
      002C38 C6               [12]  700 	xch	a, @r0
      002C39 F5 82            [12]  701 	mov	dpl, a
      002C3B 22               [24]  702 	ret
      002C3C                        703 sdcc_atomic_exchange_exit:
      002C3C 8B 82            [24]  704 	mov	dpl, r3
      002C3E 22               [24]  705 	ret
      002C3F                        706 sdcc_atomic_compare_exchange_gptr_impl::
      002C3F 30 F6 E6         [24]  707 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      002C42 A8 82            [24]  708 	mov	r0, dpl
      002C44 20 F5 D9         [24]  709 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      002C47 80 CF            [24]  710 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    711 ;--------------------------------------------------------
                                    712 ; global & static initialisations
                                    713 ;--------------------------------------------------------
                                    714 	.area HOME    (CODE)
                                    715 	.area GSINIT  (CODE)
                                    716 	.area GSFINAL (CODE)
                                    717 	.area GSINIT  (CODE)
                                    718 	.globl __sdcc_gsinit_startup
                                    719 	.globl __sdcc_program_startup
                                    720 	.globl __start__stack
                                    721 	.globl __mcs51_genXINIT
                                    722 	.globl __mcs51_genXRAMCLEAR
                                    723 	.globl __mcs51_genRAMCLEAR
                                    724 ;	usb_hid.c:10: static volatile uint8_t rx_ready = 0;
      002CA7 75 21 00         [24]  725 	mov	_rx_ready,#0x00
                                    726 ;	usb_hid.c:11: static uint8_t usb_dev_addr = 0;
      002CAA 75 22 00         [24]  727 	mov	_usb_dev_addr,#0x00
                                    728 ;	usb_hid.c:12: static uint8_t usb_config = 0;
      002CAD 75 23 00         [24]  729 	mov	_usb_config,#0x00
                                    730 ;	usb_hid.c:117: static __code const uint8_t *setup_tx_ptr = 0;
      002CB0 E4               [12]  731 	clr	a
      002CB1 F5 24            [12]  732 	mov	_setup_tx_ptr,a
      002CB3 F5 25            [12]  733 	mov	(_setup_tx_ptr + 1),a
                                    734 ;	usb_hid.c:118: static uint16_t setup_tx_len = 0;
      002CB5 F5 26            [12]  735 	mov	_setup_tx_len,a
      002CB7 F5 27            [12]  736 	mov	(_setup_tx_len + 1),a
                                    737 ;	bootloader.c:27: static uint8_t is_unlocked = 0;
      002CB9 F5 29            [12]  738 	mov	_is_unlocked,a
                                    739 	.area GSFINAL (CODE)
      002CBB 02 2C 49         [24]  740 	ljmp	__sdcc_program_startup
                                    741 ;--------------------------------------------------------
                                    742 ; Home
                                    743 ;--------------------------------------------------------
                                    744 	.area HOME    (CODE)
                                    745 	.area HOME    (CODE)
      002C49                        746 __sdcc_program_startup:
      002C49 12 33 50         [24]  747 	lcall	_main
      002C4C                        748 __sdcc_program_exit:
      002C4C 80 FE            [24]  749 	sjmp	.
                                    750 ;	return from main will return to caller
                                    751 ;--------------------------------------------------------
                                    752 ; code
                                    753 ;--------------------------------------------------------
                                    754 	.area CSEG    (CODE)
                                    755 ;------------------------------------------------------------
                                    756 ;Allocation info for local variables in function 'IAP_WriteWord'
                                    757 ;------------------------------------------------------------
                                    758 ;data_word     Allocated with name '_IAP_WriteWord_PARM_2'
                                    759 ;addr          Allocated to registers r6 r7 
                                    760 ;status        Allocated to registers r7 
                                    761 ;------------------------------------------------------------
                                    762 ;	iap_flash.c:3: uint8_t IAP_WriteWord(uint16_t addr, uint16_t data_word) {
                                    763 ;	-----------------------------------------
                                    764 ;	 function IAP_WriteWord
                                    765 ;	-----------------------------------------
      002CBE                        766 _IAP_WriteWord:
                           000007   767 	ar7 = 0x07
                           000006   768 	ar6 = 0x06
                           000005   769 	ar5 = 0x05
                           000004   770 	ar4 = 0x04
                           000003   771 	ar3 = 0x03
                           000002   772 	ar2 = 0x02
                           000001   773 	ar1 = 0x01
                           000000   774 	ar0 = 0x00
      002CBE AE 82            [24]  775 	mov	r6, dpl
      002CC0 AF 83            [24]  776 	mov	r7, dph
                                    777 ;	iap_flash.c:7: if (addr >= BOOTLOADER_START) {
      002CC2 74 D4            [12]  778 	mov	a,#0x100 - 0x2c
      002CC4 2F               [12]  779 	add	a,r7
      002CC5 50 04            [24]  780 	jnc	00102$
                                    781 ;	iap_flash.c:8: return 0x03; // Out of bounds error
      002CC7 75 82 03         [24]  782 	mov	dpl, #0x03
      002CCA 22               [24]  783 	ret
      002CCB                        784 00102$:
                                    785 ;	iap_flash.c:12: addr &= ~0x0001;
      002CCB 53 06 FE         [24]  786 	anl	ar6,#0xfe
                                    787 ;	iap_flash.c:15: EA = 0;
                                    788 ;	assignBit
      002CCE C2 AF            [12]  789 	clr	_EA
                                    790 ;	iap_flash.c:18: SAFE_MOD = 0x55;
      002CD0 75 A1 55         [24]  791 	mov	_SAFE_MOD,#0x55
                                    792 ;	iap_flash.c:19: SAFE_MOD = 0xAA;
      002CD3 75 A1 AA         [24]  793 	mov	_SAFE_MOD,#0xaa
                                    794 ;	iap_flash.c:20: GLOBAL_CFG |= bCODE_WE;
      002CD6 43 B1 08         [24]  795 	orl	_GLOBAL_CFG,#0x08
                                    796 ;	iap_flash.c:21: SAFE_MOD = 0x00;
      002CD9 75 A1 00         [24]  797 	mov	_SAFE_MOD,#0x00
                                    798 ;	iap_flash.c:24: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
      002CDC 8E 84            [24]  799 	mov	_ROM_ADDR_L,r6
                                    800 ;	iap_flash.c:25: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
      002CDE 8F 85            [24]  801 	mov	_ROM_ADDR_H,r7
                                    802 ;	iap_flash.c:26: ROM_DATA_L = (uint8_t)(data_word & 0xFF);
      002CE0 85 08 8E         [24]  803 	mov	_ROM_DATA_L,_IAP_WriteWord_PARM_2
                                    804 ;	iap_flash.c:27: ROM_DATA_H = (uint8_t)((data_word >> 8) & 0xFF);
      002CE3 85 09 8F         [24]  805 	mov	_ROM_DATA_H,(_IAP_WriteWord_PARM_2 + 1)
                                    806 ;	iap_flash.c:30: ROM_CTRL = ROM_CMD_WRITE;
      002CE6 75 86 9A         [24]  807 	mov	_ROM_CTRL,#0x9a
                                    808 ;	iap_flash.c:33: status = ROM_STATUS;
      002CE9 AF 86            [24]  809 	mov	r7,_ROM_CTRL
                                    810 ;	iap_flash.c:36: SAFE_MOD = 0x55;
      002CEB 75 A1 55         [24]  811 	mov	_SAFE_MOD,#0x55
                                    812 ;	iap_flash.c:37: SAFE_MOD = 0xAA;
      002CEE 75 A1 AA         [24]  813 	mov	_SAFE_MOD,#0xaa
                                    814 ;	iap_flash.c:38: GLOBAL_CFG &= ~bCODE_WE;
      002CF1 53 B1 F7         [24]  815 	anl	_GLOBAL_CFG,#0xf7
                                    816 ;	iap_flash.c:39: SAFE_MOD = 0x00;
      002CF4 75 A1 00         [24]  817 	mov	_SAFE_MOD,#0x00
                                    818 ;	iap_flash.c:42: EA = 1;
                                    819 ;	assignBit
      002CF7 D2 AF            [12]  820 	setb	_EA
                                    821 ;	iap_flash.c:45: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
      002CF9 EF               [12]  822 	mov	a,r7
      002CFA 20 E1 04         [24]  823 	jb	acc.1,00103$
      002CFD EF               [12]  824 	mov	a,r7
      002CFE 20 E6 04         [24]  825 	jb	acc.6,00104$
      002D01                        826 00103$:
                                    827 ;	iap_flash.c:46: return 0x04; // Write error
      002D01 75 82 04         [24]  828 	mov	dpl, #0x04
      002D04 22               [24]  829 	ret
      002D05                        830 00104$:
                                    831 ;	iap_flash.c:48: return 0x00;
      002D05 75 82 00         [24]  832 	mov	dpl, #0x00
                                    833 ;	iap_flash.c:49: }
      002D08 22               [24]  834 	ret
                                    835 ;------------------------------------------------------------
                                    836 ;Allocation info for local variables in function 'IAP_ReadWord'
                                    837 ;------------------------------------------------------------
                                    838 ;addr          Allocated to registers r6 r7 
                                    839 ;low           Allocated to registers r5 
                                    840 ;high          Allocated to registers 
                                    841 ;ptr           Allocated to registers r6 r7 
                                    842 ;------------------------------------------------------------
                                    843 ;	iap_flash.c:51: uint16_t IAP_ReadWord(uint16_t addr) {
                                    844 ;	-----------------------------------------
                                    845 ;	 function IAP_ReadWord
                                    846 ;	-----------------------------------------
      002D09                        847 _IAP_ReadWord:
                                    848 ;	iap_flash.c:53: __code const uint8_t *ptr = (__code const uint8_t *)addr;
                                    849 ;	iap_flash.c:54: low = *ptr;
      002D09 AE 82            [24]  850 	mov	r6,dpl
      002D0B AF 83            [24]  851 	mov  r7,dph
      002D0D E4               [12]  852 	clr	a
      002D0E 93               [24]  853 	movc	a,@a+dptr
      002D0F FD               [12]  854 	mov	r5,a
                                    855 ;	iap_flash.c:55: high = *(ptr + 1);
      002D10 8E 82            [24]  856 	mov	dpl,r6
      002D12 8F 83            [24]  857 	mov	dph,r7
      002D14 A3               [24]  858 	inc	dptr
      002D15 E4               [12]  859 	clr	a
      002D16 93               [24]  860 	movc	a,@a+dptr
                                    861 ;	iap_flash.c:56: return ((uint16_t)high << 8) | low;
      002D17 FE               [12]  862 	mov	r6,a
      002D18 E4               [12]  863 	clr	a
      002D19 FF               [12]  864 	mov	r7,a
      002D1A FC               [12]  865 	mov	r4,a
      002D1B ED               [12]  866 	mov	a,r5
      002D1C 4F               [12]  867 	orl	a,r7
      002D1D F5 82            [12]  868 	mov	dpl,a
      002D1F EC               [12]  869 	mov	a,r4
      002D20 4E               [12]  870 	orl	a,r6
      002D21 F5 83            [12]  871 	mov	dph,a
                                    872 ;	iap_flash.c:57: }
      002D23 22               [24]  873 	ret
                                    874 ;------------------------------------------------------------
                                    875 ;Allocation info for local variables in function 'IAP_CalculateCRC16'
                                    876 ;------------------------------------------------------------
                                    877 ;length        Allocated with name '_IAP_CalculateCRC16_PARM_2'
                                    878 ;start_addr    Allocated to registers r6 r7 
                                    879 ;crc           Allocated to registers r4 r5 
                                    880 ;ptr           Allocated to registers 
                                    881 ;i             Allocated with name '_IAP_CalculateCRC16_i_20000_21'
                                    882 ;byte          Allocated to registers 
                                    883 ;b             Allocated to registers r1 
                                    884 ;------------------------------------------------------------
                                    885 ;	iap_flash.c:59: uint16_t IAP_CalculateCRC16(uint16_t start_addr, uint16_t length) {
                                    886 ;	-----------------------------------------
                                    887 ;	 function IAP_CalculateCRC16
                                    888 ;	-----------------------------------------
      002D24                        889 _IAP_CalculateCRC16:
      002D24 AE 82            [24]  890 	mov	r6, dpl
      002D26 AF 83            [24]  891 	mov	r7, dph
                                    892 ;	iap_flash.c:60: uint16_t crc = 0xFFFF;
      002D28 7C FF            [12]  893 	mov	r4,#0xff
      002D2A 7D FF            [12]  894 	mov	r5,#0xff
                                    895 ;	iap_flash.c:61: __code const uint8_t *ptr = (__code const uint8_t *)start_addr;
                                    896 ;	iap_flash.c:63: for (uint16_t i = 0; i < length; i++) {
      002D2C E4               [12]  897 	clr	a
      002D2D F5 0A            [12]  898 	mov	_IAP_CalculateCRC16_i_20000_21,a
      002D2F F5 0B            [12]  899 	mov	(_IAP_CalculateCRC16_i_20000_21 + 1),a
      002D31                        900 00110$:
      002D31 C3               [12]  901 	clr	c
      002D32 E5 0A            [12]  902 	mov	a,_IAP_CalculateCRC16_i_20000_21
      002D34 95 08            [12]  903 	subb	a,_IAP_CalculateCRC16_PARM_2
      002D36 E5 0B            [12]  904 	mov	a,(_IAP_CalculateCRC16_i_20000_21 + 1)
      002D38 95 09            [12]  905 	subb	a,(_IAP_CalculateCRC16_PARM_2 + 1)
      002D3A 50 46            [24]  906 	jnc	00105$
                                    907 ;	iap_flash.c:64: uint8_t byte = *ptr++;
      002D3C 8E 82            [24]  908 	mov	dpl,r6
      002D3E 8F 83            [24]  909 	mov	dph,r7
      002D40 E4               [12]  910 	clr	a
      002D41 93               [24]  911 	movc	a,@a+dptr
      002D42 F9               [12]  912 	mov	r1,a
      002D43 A3               [24]  913 	inc	dptr
      002D44 AE 82            [24]  914 	mov	r6,dpl
      002D46 AF 83            [24]  915 	mov	r7,dph
                                    916 ;	iap_flash.c:65: crc ^= ((uint16_t)byte << 8);
      002D48 89 00            [24]  917 	mov	ar0,r1
      002D4A 88 01            [24]  918 	mov	ar1,r0
      002D4C E4               [12]  919 	clr	a
      002D4D 62 04            [12]  920 	xrl	ar4,a
      002D4F E9               [12]  921 	mov	a,r1
      002D50 62 05            [12]  922 	xrl	ar5,a
                                    923 ;	iap_flash.c:66: for (uint8_t b = 0; b < 8; b++) {
      002D52 79 00            [12]  924 	mov	r1,#0x00
      002D54                        925 00107$:
      002D54 B9 08 00         [24]  926 	cjne	r1,#0x08,00152$
      002D57                        927 00152$:
      002D57 50 1F            [24]  928 	jnc	00111$
                                    929 ;	iap_flash.c:67: if (crc & 0x8000) {
      002D59 ED               [12]  930 	mov	a,r5
      002D5A 30 E7 12         [24]  931 	jnb	acc.7,00102$
                                    932 ;	iap_flash.c:68: crc = (crc << 1) ^ 0x1021;
      002D5D EC               [12]  933 	mov	a,r4
      002D5E 2C               [12]  934 	add	a,r4
      002D5F F8               [12]  935 	mov	r0,a
      002D60 ED               [12]  936 	mov	a,r5
      002D61 33               [12]  937 	rlc	a
      002D62 FB               [12]  938 	mov	r3,a
      002D63 63 00 21         [24]  939 	xrl	ar0,#0x21
      002D66 63 03 10         [24]  940 	xrl	ar3,#0x10
      002D69 88 04            [24]  941 	mov	ar4,r0
      002D6B 8B 05            [24]  942 	mov	ar5,r3
      002D6D 80 06            [24]  943 	sjmp	00108$
      002D6F                        944 00102$:
                                    945 ;	iap_flash.c:70: crc <<= 1;
      002D6F EC               [12]  946 	mov	a,r4
      002D70 2C               [12]  947 	add	a,r4
      002D71 FC               [12]  948 	mov	r4,a
      002D72 ED               [12]  949 	mov	a,r5
      002D73 33               [12]  950 	rlc	a
      002D74 FD               [12]  951 	mov	r5,a
      002D75                        952 00108$:
                                    953 ;	iap_flash.c:66: for (uint8_t b = 0; b < 8; b++) {
      002D75 09               [12]  954 	inc	r1
      002D76 80 DC            [24]  955 	sjmp	00107$
      002D78                        956 00111$:
                                    957 ;	iap_flash.c:63: for (uint16_t i = 0; i < length; i++) {
      002D78 05 0A            [12]  958 	inc	_IAP_CalculateCRC16_i_20000_21
      002D7A E4               [12]  959 	clr	a
      002D7B B5 0A B3         [24]  960 	cjne	a,_IAP_CalculateCRC16_i_20000_21,00110$
      002D7E 05 0B            [12]  961 	inc	(_IAP_CalculateCRC16_i_20000_21 + 1)
      002D80 80 AF            [24]  962 	sjmp	00110$
      002D82                        963 00105$:
                                    964 ;	iap_flash.c:74: return crc;
      002D82 8C 82            [24]  965 	mov	dpl, r4
      002D84 8D 83            [24]  966 	mov	dph, r5
                                    967 ;	iap_flash.c:75: }
      002D86 22               [24]  968 	ret
                                    969 ;------------------------------------------------------------
                                    970 ;Allocation info for local variables in function 'USB_Init'
                                    971 ;------------------------------------------------------------
                                    972 ;	usb_hid.c:120: void USB_Init(void) {
                                    973 ;	-----------------------------------------
                                    974 ;	 function USB_Init
                                    975 ;	-----------------------------------------
      002D87                        976 _USB_Init:
                                    977 ;	usb_hid.c:122: SAFE_MOD = 0x55;
      002D87 75 A1 55         [24]  978 	mov	_SAFE_MOD,#0x55
                                    979 ;	usb_hid.c:123: SAFE_MOD = 0xAA;
      002D8A 75 A1 AA         [24]  980 	mov	_SAFE_MOD,#0xaa
                                    981 ;	usb_hid.c:124: CLOCK_CFG = 0x86; // 24MHz internal clock
      002D8D 75 B9 86         [24]  982 	mov	_CLOCK_CFG,#0x86
                                    983 ;	usb_hid.c:125: SAFE_MOD = 0x00;
      002D90 75 A1 00         [24]  984 	mov	_SAFE_MOD,#0x00
                                    985 ;	usb_hid.c:128: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL;
      002D93 75 E2 06         [24]  986 	mov	_USB_CTRL,#0x06
                                    987 ;	usb_hid.c:129: USB_CTRL = 0x00;
      002D96 75 E2 00         [24]  988 	mov	_USB_CTRL,#0x00
                                    989 ;	usb_hid.c:132: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
      002D99 75 EC 00         [24]  990 	mov	_UEP0_DMA_L,#_Ep0Buffer
                                    991 ;	usb_hid.c:133: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
      002D9C 7E 00            [12]  992 	mov	r6,#_Ep0Buffer
      002D9E 7F 00            [12]  993 	mov	r7,#(_Ep0Buffer >> 8)
      002DA0 8F ED            [24]  994 	mov	_UEP0_DMA_H,r7
                                    995 ;	usb_hid.c:135: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
      002DA2 75 EE 40         [24]  996 	mov	_UEP1_DMA_L,#_Ep1Buffer
                                    997 ;	usb_hid.c:136: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
      002DA5 7E 40            [12]  998 	mov	r6,#_Ep1Buffer
      002DA7 7F 00            [12]  999 	mov	r7,#(_Ep1Buffer >> 8)
      002DA9 8F EF            [24] 1000 	mov	_UEP1_DMA_H,r7
                                   1001 ;	usb_hid.c:139: UEP4_1_MOD = 0xC0;
      002DAB 75 EA C0         [24] 1002 	mov	_UEP4_1_MOD,#0xc0
                                   1003 ;	usb_hid.c:140: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002DAE 75 D2 12         [24] 1004 	mov	_UEP1_CTRL,#0x12
                                   1005 ;	usb_hid.c:141: UEP1_T_LEN = 0;
      002DB1 75 D3 00         [24] 1006 	mov	_UEP1_T_LEN,#0x00
                                   1007 ;	usb_hid.c:144: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002DB4 75 DC 02         [24] 1008 	mov	_UEP0_CTRL,#0x02
                                   1009 ;	usb_hid.c:147: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
      002DB7 75 E2 29         [24] 1010 	mov	_USB_CTRL,#0x29
                                   1011 ;	usb_hid.c:148: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN; // Full speed 12Mbps
      002DBA 75 D1 81         [24] 1012 	mov	_UDEV_CTRL,#0x81
                                   1013 ;	usb_hid.c:149: USB_DEV_AD = 0x00;
      002DBD 75 E3 00         [24] 1014 	mov	_USB_DEV_AD,#0x00
                                   1015 ;	usb_hid.c:151: rx_ready = 0;
      002DC0 75 21 00         [24] 1016 	mov	_rx_ready,#0x00
                                   1017 ;	usb_hid.c:152: usb_dev_addr = 0;
      002DC3 75 22 00         [24] 1018 	mov	_usb_dev_addr,#0x00
                                   1019 ;	usb_hid.c:153: usb_config = 0;
      002DC6 75 23 00         [24] 1020 	mov	_usb_config,#0x00
                                   1021 ;	usb_hid.c:154: }
      002DC9 22               [24] 1022 	ret
                                   1023 ;------------------------------------------------------------
                                   1024 ;Allocation info for local variables in function 'Handle_EP0_Setup'
                                   1025 ;------------------------------------------------------------
                                   1026 ;req_type      Allocated to registers r7 
                                   1027 ;req           Allocated to registers r6 
                                   1028 ;value         Allocated to registers r4 r5 
                                   1029 ;length        Allocated to registers r3 r2 
                                   1030 ;send_len      Allocated to registers r7 
                                   1031 ;------------------------------------------------------------
                                   1032 ;	usb_hid.c:156: static void Handle_EP0_Setup(void) {
                                   1033 ;	-----------------------------------------
                                   1034 ;	 function Handle_EP0_Setup
                                   1035 ;	-----------------------------------------
      002DCA                       1036 _Handle_EP0_Setup:
                                   1037 ;	usb_hid.c:157: uint8_t req_type = Ep0Buffer[0];
      002DCA 90 00 00         [24] 1038 	mov	dptr,#_Ep0Buffer
      002DCD E0               [24] 1039 	movx	a,@dptr
      002DCE FF               [12] 1040 	mov	r7,a
                                   1041 ;	usb_hid.c:158: uint8_t req = Ep0Buffer[1];
      002DCF 90 00 01         [24] 1042 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002DD2 E0               [24] 1043 	movx	a,@dptr
      002DD3 FE               [12] 1044 	mov	r6,a
                                   1045 ;	usb_hid.c:159: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
      002DD4 90 00 02         [24] 1046 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002DD7 E0               [24] 1047 	movx	a,@dptr
      002DD8 FD               [12] 1048 	mov	r5,a
      002DD9 90 00 03         [24] 1049 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002DDC E0               [24] 1050 	movx	a,@dptr
      002DDD FB               [12] 1051 	mov	r3,a
      002DDE 7C 00            [12] 1052 	mov	r4,#0x00
      002DE0 8D 02            [24] 1053 	mov	ar2,r5
      002DE2 7D 00            [12] 1054 	mov	r5,#0x00
      002DE4 EC               [12] 1055 	mov	a,r4
      002DE5 4A               [12] 1056 	orl	a,r2
      002DE6 FC               [12] 1057 	mov	r4,a
      002DE7 EB               [12] 1058 	mov	a,r3
      002DE8 4D               [12] 1059 	orl	a,r5
      002DE9 FD               [12] 1060 	mov	r5,a
                                   1061 ;	usb_hid.c:160: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
      002DEA 90 00 06         [24] 1062 	mov	dptr,#(_Ep0Buffer + 0x0006)
      002DED E0               [24] 1063 	movx	a,@dptr
      002DEE FB               [12] 1064 	mov	r3,a
      002DEF 90 00 07         [24] 1065 	mov	dptr,#(_Ep0Buffer + 0x0007)
      002DF2 E0               [24] 1066 	movx	a,@dptr
      002DF3 FA               [12] 1067 	mov	r2,a
      002DF4 E4               [12] 1068 	clr	a
      002DF5 F9               [12] 1069 	mov	r1,a
      002DF6 F8               [12] 1070 	mov	r0,a
      002DF7 4B               [12] 1071 	orl	a,r3
      002DF8 FB               [12] 1072 	mov	r3,a
      002DF9 EA               [12] 1073 	mov	a,r2
      002DFA 48               [12] 1074 	orl	a,r0
      002DFB FA               [12] 1075 	mov	r2,a
                                   1076 ;	usb_hid.c:162: setup_tx_ptr = 0;
      002DFC E4               [12] 1077 	clr	a
      002DFD F5 24            [12] 1078 	mov	_setup_tx_ptr,a
      002DFF F5 25            [12] 1079 	mov	(_setup_tx_ptr + 1),a
                                   1080 ;	usb_hid.c:163: setup_tx_len = 0;
      002E01 F5 26            [12] 1081 	mov	_setup_tx_len,a
      002E03 F5 27            [12] 1082 	mov	(_setup_tx_len + 1),a
                                   1083 ;	usb_hid.c:165: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
      002E05 EF               [12] 1084 	mov	a,r7
      002E06 54 60            [12] 1085 	anl	a,#0x60
      002E08 60 03            [24] 1086 	jz	00234$
      002E0A 02 2E D3         [24] 1087 	ljmp	00123$
      002E0D                       1088 00234$:
                                   1089 ;	usb_hid.c:166: switch (req) {
      002E0D EE               [12] 1090 	mov	a,r6
      002E0E 70 03            [24] 1091 	jnz	00235$
      002E10 02 2E C5         [24] 1092 	ljmp	00114$
      002E13                       1093 00235$:
      002E13 BE 05 03         [24] 1094 	cjne	r6,#0x05,00236$
      002E16 02 2E BD         [24] 1095 	ljmp	00112$
      002E19                       1096 00236$:
      002E19 BE 06 02         [24] 1097 	cjne	r6,#0x06,00237$
      002E1C 80 09            [24] 1098 	sjmp	00101$
      002E1E                       1099 00237$:
      002E1E BE 09 03         [24] 1100 	cjne	r6,#0x09,00238$
      002E21 02 2E C1         [24] 1101 	ljmp	00113$
      002E24                       1102 00238$:
      002E24 02 2E D3         [24] 1103 	ljmp	00123$
                                   1104 ;	usb_hid.c:167: case USB_GET_DESCRIPTOR:
      002E27                       1105 00101$:
                                   1106 ;	usb_hid.c:168: switch (Ep0Buffer[3]) {
      002E27 90 00 03         [24] 1107 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002E2A E0               [24] 1108 	movx	a,@dptr
      002E2B FF               [12] 1109 	mov	r7,a
      002E2C BF 01 02         [24] 1110 	cjne	r7,#0x01,00239$
      002E2F 80 12            [24] 1111 	sjmp	00102$
      002E31                       1112 00239$:
      002E31 BF 02 02         [24] 1113 	cjne	r7,#0x02,00240$
      002E34 80 1C            [24] 1114 	sjmp	00103$
      002E36                       1115 00240$:
      002E36 BF 03 02         [24] 1116 	cjne	r7,#0x03,00241$
      002E39 80 25            [24] 1117 	sjmp	00104$
      002E3B                       1118 00241$:
      002E3B BF 22 02         [24] 1119 	cjne	r7,#0x22,00242$
      002E3E 80 6F            [24] 1120 	sjmp	00110$
      002E40                       1121 00242$:
      002E40 02 2E D3         [24] 1122 	ljmp	00123$
                                   1123 ;	usb_hid.c:169: case 0x01: // Device Descriptor
      002E43                       1124 00102$:
                                   1125 ;	usb_hid.c:170: setup_tx_ptr = DevDesc;
      002E43 75 24 EE         [24] 1126 	mov	_setup_tx_ptr,#_DevDesc
      002E46 75 25 34         [24] 1127 	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
                                   1128 ;	usb_hid.c:171: setup_tx_len = sizeof(DevDesc);
      002E49 75 26 12         [24] 1129 	mov	_setup_tx_len,#0x12
      002E4C 75 27 00         [24] 1130 	mov	(_setup_tx_len + 1),#0x00
                                   1131 ;	usb_hid.c:172: break;
      002E4F 02 2E D3         [24] 1132 	ljmp	00123$
                                   1133 ;	usb_hid.c:173: case 0x02: // Configuration Descriptor
      002E52                       1134 00103$:
                                   1135 ;	usb_hid.c:174: setup_tx_ptr = CfgDesc;
      002E52 75 24 22         [24] 1136 	mov	_setup_tx_ptr,#_CfgDesc
      002E55 75 25 35         [24] 1137 	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
                                   1138 ;	usb_hid.c:175: setup_tx_len = sizeof(CfgDesc);
      002E58 75 26 29         [24] 1139 	mov	_setup_tx_len,#0x29
      002E5B 75 27 00         [24] 1140 	mov	(_setup_tx_len + 1),#0x00
                                   1141 ;	usb_hid.c:176: break;
                                   1142 ;	usb_hid.c:177: case 0x03: // String Descriptor
      002E5E 80 73            [24] 1143 	sjmp	00123$
      002E60                       1144 00104$:
                                   1145 ;	usb_hid.c:178: switch (Ep0Buffer[2]) {
      002E60 90 00 02         [24] 1146 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002E63 E0               [24] 1147 	movx	a,@dptr
      002E64 FF               [12] 1148 	mov  r7,a
      002E65 24 FC            [12] 1149 	add	a,#0xff - 0x03
      002E67 40 6A            [24] 1150 	jc	00123$
                                   1151 ;	free result
      002E69 EF               [12] 1152 	mov	a,r7
      002E6A 2F               [12] 1153 	add	a,r7
                                   1154 ;	usb_hid.c:179: case 0: setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); break;
      002E6B 90 2E 6F         [24] 1155 	mov	dptr,#00244$
      002E6E 73               [24] 1156 	jmp	@a+dptr
      002E6F                       1157 00244$:
      002E6F 80 06            [24] 1158 	sjmp	00105$
      002E71 80 12            [24] 1159 	sjmp	00106$
      002E73 80 1E            [24] 1160 	sjmp	00107$
      002E75 80 2A            [24] 1161 	sjmp	00108$
      002E77                       1162 00105$:
      002E77 75 24 4B         [24] 1163 	mov	_setup_tx_ptr,#_Str0Desc
      002E7A 75 25 35         [24] 1164 	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
      002E7D 75 26 04         [24] 1165 	mov	_setup_tx_len,#0x04
      002E80 75 27 00         [24] 1166 	mov	(_setup_tx_len + 1),#0x00
                                   1167 ;	usb_hid.c:180: case 1: setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); break;
      002E83 80 4E            [24] 1168 	sjmp	00123$
      002E85                       1169 00106$:
      002E85 75 24 4F         [24] 1170 	mov	_setup_tx_ptr,#_Str1Desc
      002E88 75 25 35         [24] 1171 	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
      002E8B 75 26 0E         [24] 1172 	mov	_setup_tx_len,#0x0e
      002E8E 75 27 00         [24] 1173 	mov	(_setup_tx_len + 1),#0x00
                                   1174 ;	usb_hid.c:181: case 2: setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); break;
      002E91 80 40            [24] 1175 	sjmp	00123$
      002E93                       1176 00107$:
      002E93 75 24 5D         [24] 1177 	mov	_setup_tx_ptr,#_Str2Desc
      002E96 75 25 35         [24] 1178 	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
      002E99 75 26 20         [24] 1179 	mov	_setup_tx_len,#0x20
      002E9C 75 27 00         [24] 1180 	mov	(_setup_tx_len + 1),#0x00
                                   1181 ;	usb_hid.c:182: case 3: setup_tx_ptr = Str3Desc; setup_tx_len = sizeof(Str3Desc); break;
      002E9F 80 32            [24] 1182 	sjmp	00123$
      002EA1                       1183 00108$:
      002EA1 75 24 7D         [24] 1184 	mov	_setup_tx_ptr,#_Str3Desc
      002EA4 75 25 35         [24] 1185 	mov	(_setup_tx_ptr + 1),#(_Str3Desc >> 8)
      002EA7 75 26 0A         [24] 1186 	mov	_setup_tx_len,#0x0a
      002EAA 75 27 00         [24] 1187 	mov	(_setup_tx_len + 1),#0x00
                                   1188 ;	usb_hid.c:184: break;
                                   1189 ;	usb_hid.c:185: case 0x22: // HID Report Descriptor
      002EAD 80 24            [24] 1190 	sjmp	00123$
      002EAF                       1191 00110$:
                                   1192 ;	usb_hid.c:186: setup_tx_ptr = ReportDesc;
      002EAF 75 24 00         [24] 1193 	mov	_setup_tx_ptr,#_ReportDesc
      002EB2 75 25 35         [24] 1194 	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
                                   1195 ;	usb_hid.c:187: setup_tx_len = sizeof(ReportDesc);
      002EB5 75 26 22         [24] 1196 	mov	_setup_tx_len,#0x22
      002EB8 75 27 00         [24] 1197 	mov	(_setup_tx_len + 1),#0x00
                                   1198 ;	usb_hid.c:190: break;
                                   1199 ;	usb_hid.c:192: case USB_SET_ADDRESS:
      002EBB 80 16            [24] 1200 	sjmp	00123$
      002EBD                       1201 00112$:
                                   1202 ;	usb_hid.c:193: usb_dev_addr = (uint8_t)value;
      002EBD 8C 22            [24] 1203 	mov	_usb_dev_addr,r4
                                   1204 ;	usb_hid.c:194: break;
                                   1205 ;	usb_hid.c:196: case USB_SET_CONFIGURATION:
      002EBF 80 12            [24] 1206 	sjmp	00123$
      002EC1                       1207 00113$:
                                   1208 ;	usb_hid.c:197: usb_config = (uint8_t)value;
      002EC1 8C 23            [24] 1209 	mov	_usb_config,r4
                                   1210 ;	usb_hid.c:198: break;
                                   1211 ;	usb_hid.c:200: case USB_GET_STATUS:
      002EC3 80 0E            [24] 1212 	sjmp	00123$
      002EC5                       1213 00114$:
                                   1214 ;	usb_hid.c:201: Ep0Buffer[0] = 0x00;
      002EC5 90 00 00         [24] 1215 	mov	dptr,#_Ep0Buffer
      002EC8 E4               [12] 1216 	clr	a
      002EC9 F0               [24] 1217 	movx	@dptr,a
                                   1218 ;	usb_hid.c:202: Ep0Buffer[1] = 0x00;
      002ECA 90 00 01         [24] 1219 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002ECD F0               [24] 1220 	movx	@dptr,a
                                   1221 ;	usb_hid.c:203: setup_tx_len = 2;
      002ECE 75 26 02         [24] 1222 	mov	_setup_tx_len,#0x02
      002ED1 F5 27            [12] 1223 	mov	(_setup_tx_len + 1),a
                                   1224 ;	usb_hid.c:212: }
      002ED3                       1225 00123$:
                                   1226 ;	usb_hid.c:215: if (setup_tx_len > length) {
      002ED3 C3               [12] 1227 	clr	c
      002ED4 EB               [12] 1228 	mov	a,r3
      002ED5 95 26            [12] 1229 	subb	a,_setup_tx_len
      002ED7 EA               [12] 1230 	mov	a,r2
      002ED8 95 27            [12] 1231 	subb	a,(_setup_tx_len + 1)
      002EDA 50 04            [24] 1232 	jnc	00125$
                                   1233 ;	free result
                                   1234 ;	usb_hid.c:216: setup_tx_len = length;
      002EDC 8B 26            [24] 1235 	mov	_setup_tx_len,r3
      002EDE 8A 27            [24] 1236 	mov	(_setup_tx_len + 1),r2
      002EE0                       1237 00125$:
                                   1238 ;	usb_hid.c:219: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002EE0 AE 26            [24] 1239 	mov	r6,_setup_tx_len
      002EE2 AF 27            [24] 1240 	mov	r7,(_setup_tx_len + 1)
      002EE4 C3               [12] 1241 	clr	c
      002EE5 74 40            [12] 1242 	mov	a,#0x40
      002EE7 9E               [12] 1243 	subb	a,r6
      002EE8 E4               [12] 1244 	clr	a
      002EE9 9F               [12] 1245 	subb	a,r7
      002EEA 50 04            [24] 1246 	jnc	00131$
                                   1247 ;	free result
      002EEC 7F 40            [12] 1248 	mov	r7,#0x40
      002EEE 80 04            [24] 1249 	sjmp	00132$
      002EF0                       1250 00131$:
      002EF0 AE 26            [24] 1251 	mov	r6,_setup_tx_len
      002EF2 8E 07            [24] 1252 	mov	ar7,r6
      002EF4                       1253 00132$:
                                   1254 ;	usb_hid.c:220: if (setup_tx_ptr && send_len > 0) {
      002EF4 E5 24            [12] 1255 	mov	a,_setup_tx_ptr
      002EF6 45 25            [12] 1256 	orl	a,(_setup_tx_ptr + 1)
      002EF8 60 3B            [24] 1257 	jz	00127$
      002EFA EF               [12] 1258 	mov	a,r7
      002EFB 60 38            [24] 1259 	jz	00127$
                                   1260 ;	usb_hid.c:221: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002EFD 85 24 08         [24] 1261 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002F00 85 25 09         [24] 1262 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002F03 75 0A 80         [24] 1263 	mov	(___memcpy_PARM_2 + 2),#0x80
      002F06 8F 0B            [24] 1264 	mov	___memcpy_PARM_3,r7
      002F08 75 0C 00         [24] 1265 	mov	(___memcpy_PARM_3 + 1),#0x00
      002F0B 90 00 00         [24] 1266 	mov	dptr,#_Ep0Buffer
      002F0E 75 F0 00         [24] 1267 	mov	b, #0x00
      002F11 C0 07            [24] 1268 	push	ar7
      002F13 12 34 3F         [24] 1269 	lcall	___memcpy
      002F16 D0 07            [24] 1270 	pop	ar7
                                   1271 ;	usb_hid.c:222: setup_tx_ptr += send_len;
      002F18 EF               [12] 1272 	mov	a,r7
      002F19 25 24            [12] 1273 	add	a, _setup_tx_ptr
      002F1B F5 24            [12] 1274 	mov	_setup_tx_ptr,a
      002F1D E4               [12] 1275 	clr	a
      002F1E 35 25            [12] 1276 	addc	a, (_setup_tx_ptr + 1)
      002F20 F5 25            [12] 1277 	mov	(_setup_tx_ptr + 1),a
                                   1278 ;	usb_hid.c:223: setup_tx_len -= send_len;
      002F22 8F 05            [24] 1279 	mov	ar5,r7
      002F24 7E 00            [12] 1280 	mov	r6,#0x00
      002F26 AB 26            [24] 1281 	mov	r3,_setup_tx_len
      002F28 AC 27            [24] 1282 	mov	r4,(_setup_tx_len + 1)
      002F2A EB               [12] 1283 	mov	a,r3
      002F2B C3               [12] 1284 	clr	c
      002F2C 9D               [12] 1285 	subb	a,r5
      002F2D FB               [12] 1286 	mov	r3,a
      002F2E EC               [12] 1287 	mov	a,r4
      002F2F 9E               [12] 1288 	subb	a,r6
      002F30 FC               [12] 1289 	mov	r4,a
      002F31 8B 26            [24] 1290 	mov	_setup_tx_len,r3
      002F33 8C 27            [24] 1291 	mov	(_setup_tx_len + 1),r4
      002F35                       1292 00127$:
                                   1293 ;	usb_hid.c:226: UEP0_T_LEN = send_len;
      002F35 8F DD            [24] 1294 	mov	_UEP0_T_LEN,r7
                                   1295 ;	usb_hid.c:227: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
      002F37 75 DC C0         [24] 1296 	mov	_UEP0_CTRL,#0xc0
                                   1297 ;	usb_hid.c:228: }
      002F3A 22               [24] 1298 	ret
                                   1299 ;------------------------------------------------------------
                                   1300 ;Allocation info for local variables in function 'USB_Process'
                                   1301 ;------------------------------------------------------------
                                   1302 ;token         Allocated to registers r7 
                                   1303 ;endp          Allocated to registers r5 
                                   1304 ;send_len      Allocated to registers r6 
                                   1305 ;------------------------------------------------------------
                                   1306 ;	usb_hid.c:230: void USB_Process(void) {
                                   1307 ;	-----------------------------------------
                                   1308 ;	 function USB_Process
                                   1309 ;	-----------------------------------------
      002F3B                       1310 _USB_Process:
                                   1311 ;	usb_hid.c:231: if (UIF_BUS_RST) {
      002F3B 30 D8 0F         [24] 1312 	jnb	_UIF_BUS_RST,00102$
                                   1313 ;	usb_hid.c:232: USB_DEV_AD = 0x00;
      002F3E 75 E3 00         [24] 1314 	mov	_USB_DEV_AD,#0x00
                                   1315 ;	usb_hid.c:233: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002F41 75 DC 02         [24] 1316 	mov	_UEP0_CTRL,#0x02
                                   1317 ;	usb_hid.c:234: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002F44 75 D2 12         [24] 1318 	mov	_UEP1_CTRL,#0x12
                                   1319 ;	usb_hid.c:235: UIF_BUS_RST = 0; // Clear reset flag
                                   1320 ;	assignBit
      002F47 C2 D8            [12] 1321 	clr	_UIF_BUS_RST
                                   1322 ;	usb_hid.c:236: rx_ready = 0;
      002F49 75 21 00         [24] 1323 	mov	_rx_ready,#0x00
                                   1324 ;	usb_hid.c:237: return;
      002F4C 22               [24] 1325 	ret
      002F4D                       1326 00102$:
                                   1327 ;	usb_hid.c:240: if (UIF_TRANSFER) {
      002F4D 20 D9 01         [24] 1328 	jb	_UIF_TRANSFER,00225$
      002F50 22               [24] 1329 	ret
      002F51                       1330 00225$:
                                   1331 ;	usb_hid.c:241: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
      002F51 E5 D9            [12] 1332 	mov	a,_USB_INT_ST
      002F53 54 30            [12] 1333 	anl	a,#0x30
      002F55 FF               [12] 1334 	mov	r7,a
                                   1335 ;	usb_hid.c:242: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
      002F56 E5 D9            [12] 1336 	mov	a,_USB_INT_ST
      002F58 54 0F            [12] 1337 	anl	a,#0x0f
                                   1338 ;	usb_hid.c:244: if (endp == 0) { // Endpoint 0
      002F5A FD               [12] 1339 	mov	r5,a
      002F5B 60 03            [24] 1340 	jz	00226$
      002F5D 02 2F E3         [24] 1341 	ljmp	00125$
      002F60                       1342 00226$:
                                   1343 ;	usb_hid.c:245: if (token == UIS_TOKEN_SETUP) {
      002F60 BF 30 06         [24] 1344 	cjne	r7,#0x30,00115$
                                   1345 ;	usb_hid.c:246: Handle_EP0_Setup();
      002F63 12 2D CA         [24] 1346 	lcall	_Handle_EP0_Setup
      002F66 02 30 04         [24] 1347 	ljmp	00126$
      002F69                       1348 00115$:
                                   1349 ;	usb_hid.c:247: } else if (token == UIS_TOKEN_IN) {
      002F69 BF 20 6F         [24] 1350 	cjne	r7,#0x20,00112$
                                   1351 ;	usb_hid.c:248: if (usb_dev_addr != 0 && USB_DEV_AD == 0) {
      002F6C E5 22            [12] 1352 	mov	a,_usb_dev_addr
      002F6E 60 07            [24] 1353 	jz	00104$
      002F70 E5 E3            [12] 1354 	mov	a,_USB_DEV_AD
      002F72 70 03            [24] 1355 	jnz	00104$
                                   1356 ;	usb_hid.c:249: USB_DEV_AD = usb_dev_addr;
      002F74 85 22 E3         [24] 1357 	mov	_USB_DEV_AD,_usb_dev_addr
      002F77                       1358 00104$:
                                   1359 ;	usb_hid.c:251: if (setup_tx_len > 0) {
      002F77 E5 26            [12] 1360 	mov	a,_setup_tx_len
      002F79 45 27            [12] 1361 	orl	a,(_setup_tx_len + 1)
      002F7B 60 56            [24] 1362 	jz	00107$
                                   1363 ;	usb_hid.c:252: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002F7D AC 26            [24] 1364 	mov	r4,_setup_tx_len
      002F7F AE 27            [24] 1365 	mov	r6,(_setup_tx_len + 1)
      002F81 C3               [12] 1366 	clr	c
      002F82 74 40            [12] 1367 	mov	a,#0x40
      002F84 9C               [12] 1368 	subb	a,r4
      002F85 E4               [12] 1369 	clr	a
      002F86 9E               [12] 1370 	subb	a,r6
      002F87 50 04            [24] 1371 	jnc	00131$
                                   1372 ;	free result
      002F89 7E 40            [12] 1373 	mov	r6,#0x40
      002F8B 80 04            [24] 1374 	sjmp	00132$
      002F8D                       1375 00131$:
      002F8D AC 26            [24] 1376 	mov	r4,_setup_tx_len
      002F8F 8C 06            [24] 1377 	mov	ar6,r4
      002F91                       1378 00132$:
                                   1379 ;	usb_hid.c:253: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002F91 85 24 08         [24] 1380 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002F94 85 25 09         [24] 1381 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002F97 75 0A 80         [24] 1382 	mov	(___memcpy_PARM_2 + 2),#0x80
      002F9A 8E 0B            [24] 1383 	mov	___memcpy_PARM_3,r6
      002F9C 75 0C 00         [24] 1384 	mov	(___memcpy_PARM_3 + 1),#0x00
      002F9F 90 00 00         [24] 1385 	mov	dptr,#_Ep0Buffer
      002FA2 75 F0 00         [24] 1386 	mov	b, #0x00
      002FA5 C0 06            [24] 1387 	push	ar6
      002FA7 12 34 3F         [24] 1388 	lcall	___memcpy
      002FAA D0 06            [24] 1389 	pop	ar6
                                   1390 ;	usb_hid.c:254: setup_tx_ptr += send_len;
      002FAC EE               [12] 1391 	mov	a,r6
      002FAD 25 24            [12] 1392 	add	a, _setup_tx_ptr
      002FAF F5 24            [12] 1393 	mov	_setup_tx_ptr,a
      002FB1 E4               [12] 1394 	clr	a
      002FB2 35 25            [12] 1395 	addc	a, (_setup_tx_ptr + 1)
      002FB4 F5 25            [12] 1396 	mov	(_setup_tx_ptr + 1),a
                                   1397 ;	usb_hid.c:255: setup_tx_len -= send_len;
      002FB6 8E 03            [24] 1398 	mov	ar3,r6
      002FB8 7C 00            [12] 1399 	mov	r4,#0x00
      002FBA A9 26            [24] 1400 	mov	r1,_setup_tx_len
      002FBC AA 27            [24] 1401 	mov	r2,(_setup_tx_len + 1)
      002FBE E9               [12] 1402 	mov	a,r1
      002FBF C3               [12] 1403 	clr	c
      002FC0 9B               [12] 1404 	subb	a,r3
      002FC1 F9               [12] 1405 	mov	r1,a
      002FC2 EA               [12] 1406 	mov	a,r2
      002FC3 9C               [12] 1407 	subb	a,r4
      002FC4 FA               [12] 1408 	mov	r2,a
      002FC5 89 26            [24] 1409 	mov	_setup_tx_len,r1
      002FC7 8A 27            [24] 1410 	mov	(_setup_tx_len + 1),r2
                                   1411 ;	usb_hid.c:256: UEP0_T_LEN = send_len;
      002FC9 8E DD            [24] 1412 	mov	_UEP0_T_LEN,r6
                                   1413 ;	usb_hid.c:257: UEP0_CTRL ^= bUEP_T_TOG;
      002FCB 63 DC 40         [24] 1414 	xrl	_UEP0_CTRL,#0x40
                                   1415 ;	usb_hid.c:258: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      002FCE 53 DC FC         [24] 1416 	anl	_UEP0_CTRL,#0xfc
      002FD1 80 31            [24] 1417 	sjmp	00126$
      002FD3                       1418 00107$:
                                   1419 ;	usb_hid.c:260: UEP0_T_LEN = 0;
      002FD3 75 DD 00         [24] 1420 	mov	_UEP0_T_LEN,#0x00
                                   1421 ;	usb_hid.c:261: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002FD6 75 DC 02         [24] 1422 	mov	_UEP0_CTRL,#0x02
      002FD9 80 29            [24] 1423 	sjmp	00126$
      002FDB                       1424 00112$:
                                   1425 ;	usb_hid.c:263: } else if (token == UIS_TOKEN_OUT) {
      002FDB EF               [12] 1426 	mov	a,r7
      002FDC 70 26            [24] 1427 	jnz	00126$
                                   1428 ;	usb_hid.c:264: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002FDE 75 DC 02         [24] 1429 	mov	_UEP0_CTRL,#0x02
      002FE1 80 21            [24] 1430 	sjmp	00126$
      002FE3                       1431 00125$:
                                   1432 ;	usb_hid.c:266: } else if (endp == 1) { // Endpoint 1 (HID Data)
      002FE3 BD 01 1E         [24] 1433 	cjne	r5,#0x01,00126$
                                   1434 ;	usb_hid.c:267: if (token == UIS_TOKEN_OUT) {
      002FE6 EF               [12] 1435 	mov	a,r7
      002FE7 70 0D            [24] 1436 	jnz	00120$
                                   1437 ;	usb_hid.c:268: rx_ready = 1;
      002FE9 75 21 01         [24] 1438 	mov	_rx_ready,#0x01
                                   1439 ;	usb_hid.c:269: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_NAK;
      002FEC 74 F3            [12] 1440 	mov	a,#0xf3
      002FEE 55 D2            [12] 1441 	anl	a,_UEP1_CTRL
      002FF0 44 08            [12] 1442 	orl	a,#0x08
      002FF2 F5 D2            [12] 1443 	mov	_UEP1_CTRL,a
      002FF4 80 0E            [24] 1444 	sjmp	00126$
      002FF6                       1445 00120$:
                                   1446 ;	usb_hid.c:270: } else if (token == UIS_TOKEN_IN) {
      002FF6 BF 20 0B         [24] 1447 	cjne	r7,#0x20,00126$
                                   1448 ;	usb_hid.c:271: UEP1_T_LEN = 0;
      002FF9 75 D3 00         [24] 1449 	mov	_UEP1_T_LEN,#0x00
                                   1450 ;	usb_hid.c:272: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
      002FFC 74 FC            [12] 1451 	mov	a,#0xfc
      002FFE 55 D2            [12] 1452 	anl	a,_UEP1_CTRL
      003000 44 02            [12] 1453 	orl	a,#0x02
      003002 F5 D2            [12] 1454 	mov	_UEP1_CTRL,a
      003004                       1455 00126$:
                                   1456 ;	usb_hid.c:276: UIF_TRANSFER = 0; // Clear transfer flag
                                   1457 ;	assignBit
      003004 C2 D9            [12] 1458 	clr	_UIF_TRANSFER
                                   1459 ;	usb_hid.c:278: }
      003006 22               [24] 1460 	ret
                                   1461 ;------------------------------------------------------------
                                   1462 ;Allocation info for local variables in function 'USB_Available'
                                   1463 ;------------------------------------------------------------
                                   1464 ;	usb_hid.c:280: uint8_t USB_Available(void) {
                                   1465 ;	-----------------------------------------
                                   1466 ;	 function USB_Available
                                   1467 ;	-----------------------------------------
      003007                       1468 _USB_Available:
                                   1469 ;	usb_hid.c:281: return rx_ready;
      003007 85 21 82         [24] 1470 	mov	dpl, _rx_ready
                                   1471 ;	usb_hid.c:282: }
      00300A 22               [24] 1472 	ret
                                   1473 ;------------------------------------------------------------
                                   1474 ;Allocation info for local variables in function 'USB_GetRxBuffer'
                                   1475 ;------------------------------------------------------------
                                   1476 ;	usb_hid.c:284: uint8_t *USB_GetRxBuffer(void) {
                                   1477 ;	-----------------------------------------
                                   1478 ;	 function USB_GetRxBuffer
                                   1479 ;	-----------------------------------------
      00300B                       1480 _USB_GetRxBuffer:
                                   1481 ;	usb_hid.c:285: return &Ep1Buffer[0];
      00300B 90 00 40         [24] 1482 	mov	dptr,#_Ep1Buffer
      00300E 75 F0 00         [24] 1483 	mov	b, #0x00
                                   1484 ;	usb_hid.c:286: }
      003011 22               [24] 1485 	ret
                                   1486 ;------------------------------------------------------------
                                   1487 ;Allocation info for local variables in function 'USB_ReleaseRx'
                                   1488 ;------------------------------------------------------------
                                   1489 ;	usb_hid.c:288: void USB_ReleaseRx(void) {
                                   1490 ;	-----------------------------------------
                                   1491 ;	 function USB_ReleaseRx
                                   1492 ;	-----------------------------------------
      003012                       1493 _USB_ReleaseRx:
                                   1494 ;	usb_hid.c:289: rx_ready = 0;
      003012 75 21 00         [24] 1495 	mov	_rx_ready,#0x00
                                   1496 ;	usb_hid.c:290: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_ACK;
      003015 53 D2 F3         [24] 1497 	anl	_UEP1_CTRL,#0xf3
                                   1498 ;	usb_hid.c:291: }
      003018 22               [24] 1499 	ret
                                   1500 ;------------------------------------------------------------
                                   1501 ;Allocation info for local variables in function 'USB_SendReport'
                                   1502 ;------------------------------------------------------------
                                   1503 ;len           Allocated with name '_USB_SendReport_PARM_2'
                                   1504 ;buf           Allocated to registers r5 r6 r7 
                                   1505 ;------------------------------------------------------------
                                   1506 ;	usb_hid.c:293: void USB_SendReport(const uint8_t *buf, uint8_t len) {
                                   1507 ;	-----------------------------------------
                                   1508 ;	 function USB_SendReport
                                   1509 ;	-----------------------------------------
      003019                       1510 _USB_SendReport:
      003019 AD 82            [24] 1511 	mov	r5, dpl
      00301B AE 83            [24] 1512 	mov	r6, dph
      00301D AF F0            [24] 1513 	mov	r7, b
                                   1514 ;	usb_hid.c:294: memcpy(&Ep1Buffer[64], buf, len);
      00301F 8D 08            [24] 1515 	mov	___memcpy_PARM_2,r5
      003021 8E 09            [24] 1516 	mov	(___memcpy_PARM_2 + 1),r6
      003023 8F 0A            [24] 1517 	mov	(___memcpy_PARM_2 + 2),r7
      003025 85 28 0B         [24] 1518 	mov	___memcpy_PARM_3,_USB_SendReport_PARM_2
      003028 75 0C 00         [24] 1519 	mov	(___memcpy_PARM_3 + 1),#0x00
      00302B 90 00 80         [24] 1520 	mov	dptr,#(_Ep1Buffer + 0x0040)
      00302E 75 F0 00         [24] 1521 	mov	b, #0x00
      003031 12 34 3F         [24] 1522 	lcall	___memcpy
                                   1523 ;	usb_hid.c:295: UEP1_T_LEN = len;
      003034 85 28 D3         [24] 1524 	mov	_UEP1_T_LEN,_USB_SendReport_PARM_2
                                   1525 ;	usb_hid.c:296: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      003037 53 D2 FC         [24] 1526 	anl	_UEP1_CTRL,#0xfc
                                   1527 ;	usb_hid.c:297: }
      00303A 22               [24] 1528 	ret
                                   1529 ;------------------------------------------------------------
                                   1530 ;Allocation info for local variables in function 'USB_Shutdown'
                                   1531 ;------------------------------------------------------------
                                   1532 ;	usb_hid.c:299: void USB_Shutdown(void) {
                                   1533 ;	-----------------------------------------
                                   1534 ;	 function USB_Shutdown
                                   1535 ;	-----------------------------------------
      00303B                       1536 _USB_Shutdown:
                                   1537 ;	usb_hid.c:300: USB_CTRL = 0x00;
      00303B 75 E2 00         [24] 1538 	mov	_USB_CTRL,#0x00
                                   1539 ;	usb_hid.c:301: UDEV_CTRL = 0x00;
      00303E 75 D1 00         [24] 1540 	mov	_UDEV_CTRL,#0x00
                                   1541 ;	usb_hid.c:302: }
      003041 22               [24] 1542 	ret
                                   1543 ;------------------------------------------------------------
                                   1544 ;Allocation info for local variables in function 'DelayMs'
                                   1545 ;------------------------------------------------------------
                                   1546 ;ms            Allocated to registers 
                                   1547 ;i             Allocated to registers r4 r5 
                                   1548 ;------------------------------------------------------------
                                   1549 ;	bootloader.c:30: static void DelayMs(uint16_t ms) {
                                   1550 ;	-----------------------------------------
                                   1551 ;	 function DelayMs
                                   1552 ;	-----------------------------------------
      003042                       1553 _DelayMs:
      003042 AE 82            [24] 1554 	mov	r6, dpl
      003044 AF 83            [24] 1555 	mov	r7, dph
                                   1556 ;	bootloader.c:31: while (ms--) {
      003046                       1557 00102$:
      003046 8E 04            [24] 1558 	mov	ar4,r6
      003048 8F 05            [24] 1559 	mov	ar5,r7
      00304A 1E               [12] 1560 	dec	r6
      00304B BE FF 01         [24] 1561 	cjne	r6,#0xff,00139$
      00304E 1F               [12] 1562 	dec	r7
      00304F                       1563 00139$:
      00304F EC               [12] 1564 	mov	a,r4
      003050 4D               [12] 1565 	orl	a,r5
      003051 60 19            [24] 1566 	jz	00108$
                                   1567 ;	bootloader.c:32: for (uint16_t i = 0; i < 2400; i++) {
      003053 7C 00            [12] 1568 	mov	r4,#0x00
      003055 7D 00            [12] 1569 	mov	r5,#0x00
      003057                       1570 00106$:
      003057 8C 02            [24] 1571 	mov	ar2,r4
      003059 8D 03            [24] 1572 	mov	ar3,r5
      00305B C3               [12] 1573 	clr	c
      00305C EA               [12] 1574 	mov	a,r2
      00305D 94 60            [12] 1575 	subb	a,#0x60
      00305F EB               [12] 1576 	mov	a,r3
      003060 94 09            [12] 1577 	subb	a,#0x09
      003062 50 E2            [24] 1578 	jnc	00102$
                                   1579 ;	bootloader.c:33: __asm nop __endasm;
      003064 00               [12] 1580 	nop	
                                   1581 ;	bootloader.c:32: for (uint16_t i = 0; i < 2400; i++) {
      003065 0C               [12] 1582 	inc	r4
      003066 BC 00 EE         [24] 1583 	cjne	r4,#0x00,00106$
      003069 0D               [12] 1584 	inc	r5
      00306A 80 EB            [24] 1585 	sjmp	00106$
      00306C                       1586 00108$:
                                   1587 ;	bootloader.c:36: }
      00306C 22               [24] 1588 	ret
                                   1589 ;------------------------------------------------------------
                                   1590 ;Allocation info for local variables in function 'JumpToApp'
                                   1591 ;------------------------------------------------------------
                                   1592 ;	bootloader.c:38: static void JumpToApp(void) {
                                   1593 ;	-----------------------------------------
                                   1594 ;	 function JumpToApp
                                   1595 ;	-----------------------------------------
      00306D                       1596 _JumpToApp:
                                   1597 ;	bootloader.c:39: USB_Shutdown();
      00306D 12 30 3B         [24] 1598 	lcall	_USB_Shutdown
                                   1599 ;	bootloader.c:40: DelayMs(10);
      003070 90 00 0A         [24] 1600 	mov	dptr,#0x000a
      003073 12 30 42         [24] 1601 	lcall	_DelayMs
                                   1602 ;	bootloader.c:44: __endasm;
      003076 02 00 00         [24] 1603 	ljmp 0x0000
                                   1604 ;	bootloader.c:45: }
      003079 22               [24] 1605 	ret
                                   1606 ;------------------------------------------------------------
                                   1607 ;Allocation info for local variables in function 'ProcessPacket'
                                   1608 ;------------------------------------------------------------
                                   1609 ;rx            Allocated with name '_ProcessPacket_rx_10000_119'
                                   1610 ;cmd           Allocated with name '_ProcessPacket_cmd_10000_119'
                                   1611 ;seq           Allocated with name '_ProcessPacket_seq_10000_119'
                                   1612 ;addr          Allocated with name '_ProcessPacket_addr_10000_119'
                                   1613 ;len           Allocated with name '_ProcessPacket_len_10000_119'
                                   1614 ;err           Allocated with name '_ProcessPacket_err_40000_129'
                                   1615 ;i             Allocated with name '_ProcessPacket_i_50000_130'
                                   1616 ;word          Allocated to registers 
                                   1617 ;expected_crc  Allocated to registers r4 r7 
                                   1618 ;calc_crc      Allocated to registers r5 r6 
                                   1619 ;sloc0         Allocated with name '_ProcessPacket_sloc0_1_0'
                                   1620 ;sloc1         Allocated with name '_ProcessPacket_sloc1_1_0'
                                   1621 ;sloc2         Allocated with name '_ProcessPacket_sloc2_1_0'
                                   1622 ;------------------------------------------------------------
                                   1623 ;	bootloader.c:47: static void ProcessPacket(void) {
                                   1624 ;	-----------------------------------------
                                   1625 ;	 function ProcessPacket
                                   1626 ;	-----------------------------------------
      00307A                       1627 _ProcessPacket:
                                   1628 ;	bootloader.c:48: uint8_t *rx = USB_GetRxBuffer();
      00307A 12 30 0B         [24] 1629 	lcall	_USB_GetRxBuffer
                                   1630 ;	bootloader.c:49: uint8_t cmd = rx[0];
      00307D 85 82 2A         [24] 1631 	mov	_ProcessPacket_rx_10000_119,dpl
      003080 85 83 2B         [24] 1632 	mov	(_ProcessPacket_rx_10000_119 + 1),dph
      003083 85 F0 2C         [24] 1633 	mov	(_ProcessPacket_rx_10000_119 + 2),b
      003086 12 34 CE         [24] 1634 	lcall	__gptrget
      003089 F5 2D            [12] 1635 	mov	_ProcessPacket_cmd_10000_119,a
                                   1636 ;	bootloader.c:50: uint8_t seq = rx[1];
      00308B 74 01            [12] 1637 	mov	a,#0x01
      00308D 25 2A            [12] 1638 	add	a, _ProcessPacket_rx_10000_119
      00308F F9               [12] 1639 	mov	r1,a
      003090 E4               [12] 1640 	clr	a
      003091 35 2B            [12] 1641 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      003093 FA               [12] 1642 	mov	r2,a
      003094 AB 2C            [24] 1643 	mov	r3,(_ProcessPacket_rx_10000_119 + 2)
      003096 89 82            [24] 1644 	mov	dpl,r1
      003098 8A 83            [24] 1645 	mov	dph,r2
      00309A 8B F0            [24] 1646 	mov	b,r3
      00309C 12 34 CE         [24] 1647 	lcall	__gptrget
      00309F F5 2E            [12] 1648 	mov	_ProcessPacket_seq_10000_119,a
                                   1649 ;	bootloader.c:51: uint16_t addr = rx[2] | ((uint16_t)rx[3] << 8);
      0030A1 74 02            [12] 1650 	mov	a,#0x02
      0030A3 25 2A            [12] 1651 	add	a, _ProcessPacket_rx_10000_119
      0030A5 F8               [12] 1652 	mov	r0,a
      0030A6 E4               [12] 1653 	clr	a
      0030A7 35 2B            [12] 1654 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0030A9 FA               [12] 1655 	mov	r2,a
      0030AA AB 2C            [24] 1656 	mov	r3,(_ProcessPacket_rx_10000_119 + 2)
      0030AC 88 82            [24] 1657 	mov	dpl,r0
      0030AE 8A 83            [24] 1658 	mov	dph,r2
      0030B0 8B F0            [24] 1659 	mov	b,r3
      0030B2 12 34 CE         [24] 1660 	lcall	__gptrget
      0030B5 F5 34            [12] 1661 	mov	_ProcessPacket_sloc0_1_0,a
      0030B7 74 03            [12] 1662 	mov	a,#0x03
      0030B9 25 2A            [12] 1663 	add	a, _ProcessPacket_rx_10000_119
      0030BB F5 37            [12] 1664 	mov	_ProcessPacket_sloc2_1_0,a
      0030BD E4               [12] 1665 	clr	a
      0030BE 35 2B            [12] 1666 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0030C0 F5 38            [12] 1667 	mov	(_ProcessPacket_sloc2_1_0 + 1),a
      0030C2 85 2C 39         [24] 1668 	mov	(_ProcessPacket_sloc2_1_0 + 2),(_ProcessPacket_rx_10000_119 + 2)
      0030C5 85 37 82         [24] 1669 	mov	dpl,_ProcessPacket_sloc2_1_0
      0030C8 85 38 83         [24] 1670 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      0030CB 85 39 F0         [24] 1671 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      0030CE 12 34 CE         [24] 1672 	lcall	__gptrget
      0030D1 F9               [12] 1673 	mov	r1,a
      0030D2 7D 00            [12] 1674 	mov	r5,#0x00
      0030D4 89 36            [24] 1675 	mov	(_ProcessPacket_sloc1_1_0 + 1),r1
      0030D6 8D 35            [24] 1676 	mov	_ProcessPacket_sloc1_1_0,r5
      0030D8 A9 34            [24] 1677 	mov	r1,_ProcessPacket_sloc0_1_0
      0030DA 89 2F            [24] 1678 	mov	_ProcessPacket_addr_10000_119,r1
      0030DC E5 36            [12] 1679 	mov	a,(_ProcessPacket_sloc1_1_0 + 1)
      0030DE 4D               [12] 1680 	orl	a,r5
      0030DF F5 30            [12] 1681 	mov	(_ProcessPacket_addr_10000_119 + 1),a
                                   1682 ;	bootloader.c:52: uint8_t len = rx[4];
      0030E1 74 04            [12] 1683 	mov	a,#0x04
      0030E3 25 2A            [12] 1684 	add	a, _ProcessPacket_rx_10000_119
      0030E5 F9               [12] 1685 	mov	r1,a
      0030E6 E4               [12] 1686 	clr	a
      0030E7 35 2B            [12] 1687 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0030E9 FD               [12] 1688 	mov	r5,a
      0030EA AF 2C            [24] 1689 	mov	r7,(_ProcessPacket_rx_10000_119 + 2)
      0030EC 89 82            [24] 1690 	mov	dpl,r1
      0030EE 8D 83            [24] 1691 	mov	dph,r5
      0030F0 8F F0            [24] 1692 	mov	b,r7
      0030F2 12 34 CE         [24] 1693 	lcall	__gptrget
      0030F5 F5 31            [12] 1694 	mov	_ProcessPacket_len_10000_119,a
                                   1695 ;	bootloader.c:54: memset(reply_buf, 0, 64);
      0030F7 75 08 00         [24] 1696 	mov	_memset_PARM_2,#0x00
      0030FA 75 09 40         [24] 1697 	mov	_memset_PARM_3,#0x40
      0030FD 75 0A 00         [24] 1698 	mov	(_memset_PARM_3 + 1),#0x00
      003100 90 00 00         [24] 1699 	mov	dptr,#_reply_buf
      003103 75 F0 00         [24] 1700 	mov	b, #0x00
      003106 C0 03            [24] 1701 	push	ar3
      003108 C0 02            [24] 1702 	push	ar2
      00310A C0 00            [24] 1703 	push	ar0
      00310C 12 34 94         [24] 1704 	lcall	_memset
      00310F D0 00            [24] 1705 	pop	ar0
      003111 D0 02            [24] 1706 	pop	ar2
      003113 D0 03            [24] 1707 	pop	ar3
                                   1708 ;	bootloader.c:55: reply_buf[0] = cmd;
      003115 90 00 00         [24] 1709 	mov	dptr,#_reply_buf
      003118 E5 2D            [12] 1710 	mov	a,_ProcessPacket_cmd_10000_119
      00311A F0               [24] 1711 	movx	@dptr,a
                                   1712 ;	bootloader.c:56: reply_buf[1] = seq;
      00311B 90 00 01         [24] 1713 	mov	dptr,#(_reply_buf + 0x0001)
      00311E E5 2E            [12] 1714 	mov	a,_ProcessPacket_seq_10000_119
      003120 F0               [24] 1715 	movx	@dptr,a
                                   1716 ;	bootloader.c:57: reply_buf[2] = rx[2];
      003121 88 82            [24] 1717 	mov	dpl,r0
      003123 8A 83            [24] 1718 	mov	dph,r2
      003125 8B F0            [24] 1719 	mov	b,r3
      003127 12 34 CE         [24] 1720 	lcall	__gptrget
      00312A F8               [12] 1721 	mov	r0,a
      00312B 90 00 02         [24] 1722 	mov	dptr,#(_reply_buf + 0x0002)
      00312E F0               [24] 1723 	movx	@dptr,a
                                   1724 ;	bootloader.c:58: reply_buf[3] = rx[3];
      00312F 85 37 82         [24] 1725 	mov	dpl,_ProcessPacket_sloc2_1_0
      003132 85 38 83         [24] 1726 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      003135 85 39 F0         [24] 1727 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      003138 12 34 CE         [24] 1728 	lcall	__gptrget
      00313B FE               [12] 1729 	mov	r6,a
      00313C 90 00 03         [24] 1730 	mov	dptr,#(_reply_buf + 0x0003)
      00313F F0               [24] 1731 	movx	@dptr,a
                                   1732 ;	bootloader.c:59: reply_buf[59] = STATUS_OK;
      003140 90 00 3B         [24] 1733 	mov	dptr,#(_reply_buf + 0x003b)
      003143 E4               [12] 1734 	clr	a
      003144 F0               [24] 1735 	movx	@dptr,a
                                   1736 ;	bootloader.c:61: switch (cmd) {
      003145 E5 2D            [12] 1737 	mov	a,_ProcessPacket_cmd_10000_119
      003147 24 F9            [12] 1738 	add	a,#0xff - 0x06
      003149 50 03            [24] 1739 	jnc	00214$
      00314B 02 33 3B         [24] 1740 	ljmp	00119$
      00314E                       1741 00214$:
                                   1742 ;	free result
      00314E E5 2D            [12] 1743 	mov	a,_ProcessPacket_cmd_10000_119
      003150 75 F0 03         [24] 1744 	mov	b,#0x03
      003153 A4               [48] 1745 	mul	ab
      003154 90 31 58         [24] 1746 	mov	dptr,#00215$
      003157 73               [24] 1747 	jmp	@a+dptr
      003158                       1748 00215$:
      003158 02 33 3B         [24] 1749 	ljmp	00119$
      00315B 02 31 6D         [24] 1750 	ljmp	00101$
      00315E 02 31 8D         [24] 1751 	ljmp	00102$
      003161 02 33 3B         [24] 1752 	ljmp	00119$
      003164 02 32 04         [24] 1753 	ljmp	00109$
      003167 02 32 B4         [24] 1754 	ljmp	00117$
      00316A 02 33 22         [24] 1755 	ljmp	00118$
                                   1756 ;	bootloader.c:62: case CMD_HELLO:
      00316D                       1757 00101$:
                                   1758 ;	bootloader.c:63: reply_buf[4] = 0x52; // Chip ID: CH552
      00316D 90 00 04         [24] 1759 	mov	dptr,#(_reply_buf + 0x0004)
      003170 74 52            [12] 1760 	mov	a,#0x52
      003172 F0               [24] 1761 	movx	@dptr,a
                                   1762 ;	bootloader.c:64: reply_buf[5] = 0x01; // Bootloader v1.0
      003173 90 00 05         [24] 1763 	mov	dptr,#(_reply_buf + 0x0005)
      003176 74 01            [12] 1764 	mov	a,#0x01
      003178 F0               [24] 1765 	movx	@dptr,a
                                   1766 ;	bootloader.c:65: reply_buf[6] = (uint8_t)(USER_FLASH_END & 0xFF);
      003179 90 00 06         [24] 1767 	mov	dptr,#(_reply_buf + 0x0006)
      00317C 74 FF            [12] 1768 	mov	a,#0xff
      00317E F0               [24] 1769 	movx	@dptr,a
                                   1770 ;	bootloader.c:66: reply_buf[7] = (uint8_t)((USER_FLASH_END >> 8) & 0xFF); // 11 KB usable
      00317F 90 00 07         [24] 1771 	mov	dptr,#(_reply_buf + 0x0007)
      003182 74 2B            [12] 1772 	mov	a,#0x2b
      003184 F0               [24] 1773 	movx	@dptr,a
                                   1774 ;	bootloader.c:67: reply_buf[59] = STATUS_OK;
      003185 90 00 3B         [24] 1775 	mov	dptr,#(_reply_buf + 0x003b)
      003188 E4               [12] 1776 	clr	a
      003189 F0               [24] 1777 	movx	@dptr,a
                                   1778 ;	bootloader.c:68: break;
      00318A 02 33 41         [24] 1779 	ljmp	00120$
                                   1780 ;	bootloader.c:70: case CMD_UNLOCK:
      00318D                       1781 00102$:
                                   1782 ;	bootloader.c:71: if (rx[5] == 0x5A && rx[6] == 0xC3 && rx[7] == 0x3C && rx[8] == 0xA5) {
      00318D 74 05            [12] 1783 	mov	a,#0x05
      00318F 25 2A            [12] 1784 	add	a, _ProcessPacket_rx_10000_119
      003191 FC               [12] 1785 	mov	r4,a
      003192 E4               [12] 1786 	clr	a
      003193 35 2B            [12] 1787 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      003195 FD               [12] 1788 	mov	r5,a
      003196 AE 2C            [24] 1789 	mov	r6,(_ProcessPacket_rx_10000_119 + 2)
      003198 8C 82            [24] 1790 	mov	dpl,r4
      00319A 8D 83            [24] 1791 	mov	dph,r5
      00319C 8E F0            [24] 1792 	mov	b,r6
      00319E 12 34 CE         [24] 1793 	lcall	__gptrget
      0031A1 FC               [12] 1794 	mov	r4,a
      0031A2 BC 5A 53         [24] 1795 	cjne	r4,#0x5a,00104$
      0031A5 74 06            [12] 1796 	mov	a,#0x06
      0031A7 25 2A            [12] 1797 	add	a, _ProcessPacket_rx_10000_119
      0031A9 FC               [12] 1798 	mov	r4,a
      0031AA E4               [12] 1799 	clr	a
      0031AB 35 2B            [12] 1800 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0031AD FD               [12] 1801 	mov	r5,a
      0031AE AE 2C            [24] 1802 	mov	r6,(_ProcessPacket_rx_10000_119 + 2)
      0031B0 8C 82            [24] 1803 	mov	dpl,r4
      0031B2 8D 83            [24] 1804 	mov	dph,r5
      0031B4 8E F0            [24] 1805 	mov	b,r6
      0031B6 12 34 CE         [24] 1806 	lcall	__gptrget
      0031B9 FC               [12] 1807 	mov	r4,a
      0031BA BC C3 3B         [24] 1808 	cjne	r4,#0xc3,00104$
      0031BD 74 07            [12] 1809 	mov	a,#0x07
      0031BF 25 2A            [12] 1810 	add	a, _ProcessPacket_rx_10000_119
      0031C1 FC               [12] 1811 	mov	r4,a
      0031C2 E4               [12] 1812 	clr	a
      0031C3 35 2B            [12] 1813 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0031C5 FD               [12] 1814 	mov	r5,a
      0031C6 AE 2C            [24] 1815 	mov	r6,(_ProcessPacket_rx_10000_119 + 2)
      0031C8 8C 82            [24] 1816 	mov	dpl,r4
      0031CA 8D 83            [24] 1817 	mov	dph,r5
      0031CC 8E F0            [24] 1818 	mov	b,r6
      0031CE 12 34 CE         [24] 1819 	lcall	__gptrget
      0031D1 FC               [12] 1820 	mov	r4,a
      0031D2 BC 3C 23         [24] 1821 	cjne	r4,#0x3c,00104$
      0031D5 74 08            [12] 1822 	mov	a,#0x08
      0031D7 25 2A            [12] 1823 	add	a, _ProcessPacket_rx_10000_119
      0031D9 FC               [12] 1824 	mov	r4,a
      0031DA E4               [12] 1825 	clr	a
      0031DB 35 2B            [12] 1826 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0031DD FD               [12] 1827 	mov	r5,a
      0031DE AE 2C            [24] 1828 	mov	r6,(_ProcessPacket_rx_10000_119 + 2)
      0031E0 8C 82            [24] 1829 	mov	dpl,r4
      0031E2 8D 83            [24] 1830 	mov	dph,r5
      0031E4 8E F0            [24] 1831 	mov	b,r6
      0031E6 12 34 CE         [24] 1832 	lcall	__gptrget
      0031E9 FC               [12] 1833 	mov	r4,a
      0031EA BC A5 0B         [24] 1834 	cjne	r4,#0xa5,00104$
                                   1835 ;	bootloader.c:72: is_unlocked = 1;
      0031ED 75 29 01         [24] 1836 	mov	_is_unlocked,#0x01
                                   1837 ;	bootloader.c:73: reply_buf[59] = STATUS_OK;
      0031F0 90 00 3B         [24] 1838 	mov	dptr,#(_reply_buf + 0x003b)
      0031F3 E4               [12] 1839 	clr	a
      0031F4 F0               [24] 1840 	movx	@dptr,a
      0031F5 02 33 41         [24] 1841 	ljmp	00120$
      0031F8                       1842 00104$:
                                   1843 ;	bootloader.c:75: is_unlocked = 0;
      0031F8 75 29 00         [24] 1844 	mov	_is_unlocked,#0x00
                                   1845 ;	bootloader.c:76: reply_buf[59] = STATUS_LOCKED;
      0031FB 90 00 3B         [24] 1846 	mov	dptr,#(_reply_buf + 0x003b)
      0031FE 74 02            [12] 1847 	mov	a,#0x02
      003200 F0               [24] 1848 	movx	@dptr,a
                                   1849 ;	bootloader.c:78: break;
      003201 02 33 41         [24] 1850 	ljmp	00120$
                                   1851 ;	bootloader.c:80: case CMD_WRITE_BLOCK:
      003204                       1852 00109$:
                                   1853 ;	bootloader.c:81: if (!is_unlocked) {
      003204 E5 29            [12] 1854 	mov	a,_is_unlocked
      003206 70 09            [24] 1855 	jnz	00111$
                                   1856 ;	bootloader.c:82: reply_buf[59] = STATUS_LOCKED;
      003208 90 00 3B         [24] 1857 	mov	dptr,#(_reply_buf + 0x003b)
      00320B 74 02            [12] 1858 	mov	a,#0x02
      00320D F0               [24] 1859 	movx	@dptr,a
                                   1860 ;	bootloader.c:83: break;
      00320E 02 33 41         [24] 1861 	ljmp	00120$
      003211                       1862 00111$:
                                   1863 ;	bootloader.c:86: if (addr + len > BOOTLOADER_START) {
      003211 AD 31            [24] 1864 	mov	r5,_ProcessPacket_len_10000_119
      003213 7E 00            [12] 1865 	mov	r6,#0x00
      003215 A9 2F            [24] 1866 	mov	r1,_ProcessPacket_addr_10000_119
      003217 AC 30            [24] 1867 	mov	r4,(_ProcessPacket_addr_10000_119 + 1)
      003219 ED               [12] 1868 	mov	a,r5
      00321A 29               [12] 1869 	add	a, r1
      00321B FD               [12] 1870 	mov	r5,a
      00321C EE               [12] 1871 	mov	a,r6
      00321D 3C               [12] 1872 	addc	a, r4
      00321E FE               [12] 1873 	mov	r6,a
      00321F C3               [12] 1874 	clr	c
      003220 E4               [12] 1875 	clr	a
      003221 9D               [12] 1876 	subb	a,r5
      003222 74 2C            [12] 1877 	mov	a,#0x2c
      003224 9E               [12] 1878 	subb	a,r6
      003225 50 09            [24] 1879 	jnc	00113$
                                   1880 ;	free result
                                   1881 ;	bootloader.c:87: reply_buf[59] = STATUS_OOB; // Protect bootloader
      003227 90 00 3B         [24] 1882 	mov	dptr,#(_reply_buf + 0x003b)
      00322A 74 03            [12] 1883 	mov	a,#0x03
      00322C F0               [24] 1884 	movx	@dptr,a
                                   1885 ;	bootloader.c:88: break;
      00322D 02 33 41         [24] 1886 	ljmp	00120$
      003230                       1887 00113$:
                                   1888 ;	bootloader.c:93: uint8_t err = 0;
      003230 75 32 00         [24] 1889 	mov	_ProcessPacket_err_40000_129,#0x00
                                   1890 ;	bootloader.c:94: for (uint8_t i = 0; i < len; i += 2) {
      003233 75 33 00         [24] 1891 	mov	_ProcessPacket_i_50000_130,#0x00
      003236                       1892 00122$:
      003236 C3               [12] 1893 	clr	c
      003237 E5 33            [12] 1894 	mov	a,_ProcessPacket_i_50000_130
      003239 95 31            [12] 1895 	subb	a,_ProcessPacket_len_10000_119
      00323B 50 6A            [24] 1896 	jnc	00116$
                                   1897 ;	bootloader.c:95: uint16_t word = rx[5 + i] | ((uint16_t)rx[6 + i] << 8);
      00323D AA 33            [24] 1898 	mov	r2,_ProcessPacket_i_50000_130
      00323F 7B 00            [12] 1899 	mov	r3,#0x00
      003241 74 05            [12] 1900 	mov	a,#0x05
      003243 2A               [12] 1901 	add	a, r2
      003244 F8               [12] 1902 	mov	r0,a
      003245 E4               [12] 1903 	clr	a
      003246 3B               [12] 1904 	addc	a, r3
      003247 FE               [12] 1905 	mov	r6,a
      003248 E8               [12] 1906 	mov	a,r0
      003249 25 2A            [12] 1907 	add	a, _ProcessPacket_rx_10000_119
      00324B F8               [12] 1908 	mov	r0,a
      00324C EE               [12] 1909 	mov	a,r6
      00324D 35 2B            [12] 1910 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      00324F FE               [12] 1911 	mov	r6,a
      003250 AF 2C            [24] 1912 	mov	r7,(_ProcessPacket_rx_10000_119 + 2)
      003252 88 82            [24] 1913 	mov	dpl,r0
      003254 8E 83            [24] 1914 	mov	dph,r6
      003256 8F F0            [24] 1915 	mov	b,r7
      003258 12 34 CE         [24] 1916 	lcall	__gptrget
      00325B F8               [12] 1917 	mov	r0,a
      00325C 74 06            [12] 1918 	mov	a,#0x06
      00325E 2A               [12] 1919 	add	a, r2
      00325F FE               [12] 1920 	mov	r6,a
      003260 E4               [12] 1921 	clr	a
      003261 3B               [12] 1922 	addc	a, r3
      003262 FF               [12] 1923 	mov	r7,a
      003263 EE               [12] 1924 	mov	a,r6
      003264 25 2A            [12] 1925 	add	a, _ProcessPacket_rx_10000_119
      003266 FE               [12] 1926 	mov	r6,a
      003267 EF               [12] 1927 	mov	a,r7
      003268 35 2B            [12] 1928 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      00326A FD               [12] 1929 	mov	r5,a
      00326B AF 2C            [24] 1930 	mov	r7,(_ProcessPacket_rx_10000_119 + 2)
      00326D 8E 82            [24] 1931 	mov	dpl,r6
      00326F 8D 83            [24] 1932 	mov	dph,r5
      003271 8F F0            [24] 1933 	mov	b,r7
      003273 12 34 CE         [24] 1934 	lcall	__gptrget
      003276 FF               [12] 1935 	mov	r7,a
      003277 E4               [12] 1936 	clr	a
      003278 FD               [12] 1937 	mov	r5,a
      003279 48               [12] 1938 	orl	a,r0
      00327A F5 08            [12] 1939 	mov	_IAP_WriteWord_PARM_2,a
      00327C EF               [12] 1940 	mov	a,r7
      00327D 4D               [12] 1941 	orl	a,r5
      00327E F5 09            [12] 1942 	mov	(_IAP_WriteWord_PARM_2 + 1),a
                                   1943 ;	bootloader.c:96: if (IAP_WriteWord(addr + i, word) != 0) {
      003280 EA               [12] 1944 	mov	a,r2
      003281 29               [12] 1945 	add	a, r1
      003282 FA               [12] 1946 	mov	r2,a
      003283 EB               [12] 1947 	mov	a,r3
      003284 3C               [12] 1948 	addc	a, r4
      003285 FB               [12] 1949 	mov	r3,a
      003286 8A 82            [24] 1950 	mov	dpl,r2
      003288 8B 83            [24] 1951 	mov	dph,r3
      00328A C0 04            [24] 1952 	push	ar4
      00328C C0 01            [24] 1953 	push	ar1
      00328E 12 2C BE         [24] 1954 	lcall	_IAP_WriteWord
      003291 E5 82            [12] 1955 	mov	a, dpl
      003293 D0 01            [24] 1956 	pop	ar1
      003295 D0 04            [24] 1957 	pop	ar4
      003297 60 05            [24] 1958 	jz	00123$
                                   1959 ;	bootloader.c:97: err = 1;
      003299 75 32 01         [24] 1960 	mov	_ProcessPacket_err_40000_129,#0x01
                                   1961 ;	bootloader.c:98: break;
      00329C 80 09            [24] 1962 	sjmp	00116$
      00329E                       1963 00123$:
                                   1964 ;	bootloader.c:94: for (uint8_t i = 0; i < len; i += 2) {
      00329E AD 33            [24] 1965 	mov	r5,_ProcessPacket_i_50000_130
      0032A0 74 02            [12] 1966 	mov	a,#0x02
      0032A2 2D               [12] 1967 	add	a, r5
      0032A3 F5 33            [12] 1968 	mov	_ProcessPacket_i_50000_130,a
      0032A5 80 8F            [24] 1969 	sjmp	00122$
      0032A7                       1970 00116$:
                                   1971 ;	bootloader.c:101: reply_buf[59] = err ? STATUS_WRITE_ERR : STATUS_OK;
      0032A7 E5 32            [12] 1972 	mov	a,_ProcessPacket_err_40000_129
      0032A9 60 02            [24] 1973 	jz	00126$
      0032AB 74 04            [12] 1974 	mov	a,#0x04
      0032AD                       1975 00126$:
      0032AD 90 00 3B         [24] 1976 	mov	dptr,#(_reply_buf + 0x003b)
      0032B0 F0               [24] 1977 	movx	@dptr,a
                                   1978 ;	bootloader.c:103: break;
      0032B1 02 33 41         [24] 1979 	ljmp	00120$
                                   1980 ;	bootloader.c:105: case CMD_VERIFY_CRC:
      0032B4                       1981 00117$:
                                   1982 ;	bootloader.c:107: uint16_t expected_crc = rx[5] | ((uint16_t)rx[6] << 8);
      0032B4 74 05            [12] 1983 	mov	a,#0x05
      0032B6 25 2A            [12] 1984 	add	a, _ProcessPacket_rx_10000_119
      0032B8 FD               [12] 1985 	mov	r5,a
      0032B9 E4               [12] 1986 	clr	a
      0032BA 35 2B            [12] 1987 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0032BC FE               [12] 1988 	mov	r6,a
      0032BD AF 2C            [24] 1989 	mov	r7,(_ProcessPacket_rx_10000_119 + 2)
      0032BF 8D 82            [24] 1990 	mov	dpl,r5
      0032C1 8E 83            [24] 1991 	mov	dph,r6
      0032C3 8F F0            [24] 1992 	mov	b,r7
      0032C5 12 34 CE         [24] 1993 	lcall	__gptrget
      0032C8 FD               [12] 1994 	mov	r5,a
      0032C9 74 06            [12] 1995 	mov	a,#0x06
      0032CB 25 2A            [12] 1996 	add	a, _ProcessPacket_rx_10000_119
      0032CD FC               [12] 1997 	mov	r4,a
      0032CE E4               [12] 1998 	clr	a
      0032CF 35 2B            [12] 1999 	addc	a, (_ProcessPacket_rx_10000_119 + 1)
      0032D1 FE               [12] 2000 	mov	r6,a
      0032D2 AF 2C            [24] 2001 	mov	r7,(_ProcessPacket_rx_10000_119 + 2)
      0032D4 8C 82            [24] 2002 	mov	dpl,r4
      0032D6 8E 83            [24] 2003 	mov	dph,r6
      0032D8 8F F0            [24] 2004 	mov	b,r7
      0032DA 12 34 CE         [24] 2005 	lcall	__gptrget
      0032DD FF               [12] 2006 	mov	r7,a
      0032DE E4               [12] 2007 	clr	a
      0032DF FC               [12] 2008 	mov	r4,a
      0032E0 FE               [12] 2009 	mov	r6,a
      0032E1 ED               [12] 2010 	mov	a,r5
      0032E2 42 04            [12] 2011 	orl	ar4,a
      0032E4 EE               [12] 2012 	mov	a,r6
      0032E5 42 07            [12] 2013 	orl	ar7,a
                                   2014 ;	bootloader.c:108: uint16_t calc_crc = IAP_CalculateCRC16(0x0000, addr);
      0032E7 85 2F 08         [24] 2015 	mov	_IAP_CalculateCRC16_PARM_2,_ProcessPacket_addr_10000_119
      0032EA 85 30 09         [24] 2016 	mov	(_IAP_CalculateCRC16_PARM_2 + 1),(_ProcessPacket_addr_10000_119 + 1)
      0032ED 90 00 00         [24] 2017 	mov	dptr,#0x0000
      0032F0 C0 07            [24] 2018 	push	ar7
      0032F2 C0 04            [24] 2019 	push	ar4
      0032F4 12 2D 24         [24] 2020 	lcall	_IAP_CalculateCRC16
      0032F7 AD 82            [24] 2021 	mov	r5, dpl
      0032F9 AE 83            [24] 2022 	mov	r6, dph
      0032FB D0 04            [24] 2023 	pop	ar4
      0032FD D0 07            [24] 2024 	pop	ar7
                                   2025 ;	bootloader.c:109: reply_buf[4] = (uint8_t)(calc_crc & 0xFF);
      0032FF 8D 03            [24] 2026 	mov	ar3,r5
      003301 90 00 04         [24] 2027 	mov	dptr,#(_reply_buf + 0x0004)
      003304 EB               [12] 2028 	mov	a,r3
      003305 F0               [24] 2029 	movx	@dptr,a
                                   2030 ;	bootloader.c:110: reply_buf[5] = (uint8_t)((calc_crc >> 8) & 0xFF);
      003306 8E 03            [24] 2031 	mov	ar3,r6
      003308 90 00 05         [24] 2032 	mov	dptr,#(_reply_buf + 0x0005)
      00330B EB               [12] 2033 	mov	a,r3
      00330C F0               [24] 2034 	movx	@dptr,a
                                   2035 ;	bootloader.c:111: reply_buf[59] = (calc_crc == expected_crc) ? STATUS_OK : STATUS_BAD_CRC;
      00330D ED               [12] 2036 	mov	a,r5
      00330E B5 04 08         [24] 2037 	cjne	a,ar4,00128$
      003311 EE               [12] 2038 	mov	a,r6
      003312 B5 07 04         [24] 2039 	cjne	a,ar7,00128$
      003315 7F 00            [12] 2040 	mov	r7,#0x00
      003317 80 02            [24] 2041 	sjmp	00129$
      003319                       2042 00128$:
      003319 7F 01            [12] 2043 	mov	r7,#0x01
      00331B                       2044 00129$:
      00331B 90 00 3B         [24] 2045 	mov	dptr,#(_reply_buf + 0x003b)
      00331E EF               [12] 2046 	mov	a,r7
      00331F F0               [24] 2047 	movx	@dptr,a
                                   2048 ;	bootloader.c:113: break;
                                   2049 ;	bootloader.c:115: case CMD_REBOOT:
      003320 80 1F            [24] 2050 	sjmp	00120$
      003322                       2051 00118$:
                                   2052 ;	bootloader.c:116: reply_buf[59] = STATUS_OK;
      003322 90 00 3B         [24] 2053 	mov	dptr,#(_reply_buf + 0x003b)
      003325 E4               [12] 2054 	clr	a
      003326 F0               [24] 2055 	movx	@dptr,a
                                   2056 ;	bootloader.c:117: USB_SendReport(reply_buf, 64);
      003327 75 28 40         [24] 2057 	mov	_USB_SendReport_PARM_2,#0x40
      00332A 90 00 00         [24] 2058 	mov	dptr,#_reply_buf
      00332D F5 F0            [12] 2059 	mov	b,a
      00332F 12 30 19         [24] 2060 	lcall	_USB_SendReport
                                   2061 ;	bootloader.c:118: DelayMs(50);
      003332 90 00 32         [24] 2062 	mov	dptr,#0x0032
      003335 12 30 42         [24] 2063 	lcall	_DelayMs
                                   2064 ;	bootloader.c:119: JumpToApp();
                                   2065 ;	bootloader.c:120: return;
                                   2066 ;	bootloader.c:122: default:
      003338 02 30 6D         [24] 2067 	ljmp	_JumpToApp
      00333B                       2068 00119$:
                                   2069 ;	bootloader.c:123: reply_buf[59] = STATUS_UNKNOWN;
      00333B 90 00 3B         [24] 2070 	mov	dptr,#(_reply_buf + 0x003b)
      00333E 74 FF            [12] 2071 	mov	a,#0xff
      003340 F0               [24] 2072 	movx	@dptr,a
                                   2073 ;	bootloader.c:125: }
      003341                       2074 00120$:
                                   2075 ;	bootloader.c:127: USB_SendReport(reply_buf, 64);
      003341 75 28 40         [24] 2076 	mov	_USB_SendReport_PARM_2,#0x40
      003344 90 00 00         [24] 2077 	mov	dptr,#_reply_buf
      003347 75 F0 00         [24] 2078 	mov	b, #0x00
      00334A 12 30 19         [24] 2079 	lcall	_USB_SendReport
                                   2080 ;	bootloader.c:128: USB_ReleaseRx();
                                   2081 ;	bootloader.c:129: }
      00334D 02 30 12         [24] 2082 	ljmp	_USB_ReleaseRx
                                   2083 ;------------------------------------------------------------
                                   2084 ;Allocation info for local variables in function 'main'
                                   2085 ;------------------------------------------------------------
                                   2086 ;button_pressed Allocated to registers r7 
                                   2087 ;first_word    Allocated to registers r5 r6 
                                   2088 ;vec_word      Allocated to registers r3 r4 
                                   2089 ;is_blank      Allocated to registers r6 
                                   2090 ;timeout       Allocated to registers 
                                   2091 ;stay_in_bootloader Allocated to registers r7 
                                   2092 ;------------------------------------------------------------
                                   2093 ;	bootloader.c:131: void main(void) {
                                   2094 ;	-----------------------------------------
                                   2095 ;	 function main
                                   2096 ;	-----------------------------------------
      003350                       2097 _main:
                                   2098 ;	bootloader.c:133: P3_MOD_OC &= ~(1 << BOOT_PIN_BIT); // Quasi-bidirectional / pull-up mode
      003350 53 96 FB         [24] 2099 	anl	_P3_MOD_OC,#0xfb
                                   2100 ;	bootloader.c:134: P3_DIR_PU |=  (1 << BOOT_PIN_BIT); // Enable pullup
      003353 43 97 04         [24] 2101 	orl	_P3_DIR_PU,#0x04
                                   2102 ;	bootloader.c:135: P3_2 = 1; // High impedance input read
                                   2103 ;	assignBit
      003356 D2 B2            [12] 2104 	setb	_P3_2
                                   2105 ;	bootloader.c:138: P1_MOD_OC &= ~(1 << 5);
      003358 53 92 DF         [24] 2106 	anl	_P1_MOD_OC,#0xdf
                                   2107 ;	bootloader.c:139: P1_DIR_PU |=  (1 << 5);
      00335B 43 93 20         [24] 2108 	orl	_P1_DIR_PU,#0x20
                                   2109 ;	bootloader.c:140: P1_5 = 1;
                                   2110 ;	assignBit
      00335E D2 95            [12] 2111 	setb	_P1_5
                                   2112 ;	bootloader.c:143: uint8_t button_pressed = (P3_2 == 0) || (P1_5 == 0);
      003360 30 B2 07         [24] 2113 	jnb	_P3_2,00113$
      003363 30 95 04         [24] 2114 	jnb	_P1_5,00113$
                                   2115 ;	assignBit
      003366 C2 00            [12] 2116 	clr	_main_sloc0_1_0
      003368 80 02            [24] 2117 	sjmp	00114$
      00336A                       2118 00113$:
                                   2119 ;	assignBit
      00336A D2 00            [12] 2120 	setb	_main_sloc0_1_0
      00336C                       2121 00114$:
      00336C A2 00            [12] 2122 	mov	c,_main_sloc0_1_0
      00336E E4               [12] 2123 	clr	a
      00336F 33               [12] 2124 	rlc	a
      003370 FF               [12] 2125 	mov	r7,a
                                   2126 ;	bootloader.c:146: uint16_t first_word = IAP_ReadWord(0x0000);
      003371 90 00 00         [24] 2127 	mov	dptr,#0x0000
      003374 C0 07            [24] 2128 	push	ar7
      003376 12 2D 09         [24] 2129 	lcall	_IAP_ReadWord
      003379 AD 82            [24] 2130 	mov	r5, dpl
      00337B AE 83            [24] 2131 	mov	r6, dph
                                   2132 ;	bootloader.c:147: uint16_t vec_word   = IAP_ReadWord(0x0008);
      00337D 90 00 08         [24] 2133 	mov	dptr,#0x0008
      003380 C0 06            [24] 2134 	push	ar6
      003382 C0 05            [24] 2135 	push	ar5
      003384 12 2D 09         [24] 2136 	lcall	_IAP_ReadWord
      003387 AB 82            [24] 2137 	mov	r3, dpl
      003389 AC 83            [24] 2138 	mov	r4, dph
      00338B D0 05            [24] 2139 	pop	ar5
      00338D D0 06            [24] 2140 	pop	ar6
      00338F D0 07            [24] 2141 	pop	ar7
                                   2142 ;	bootloader.c:148: uint8_t is_blank = (first_word == 0xFFFF) || (vec_word == 0xFFFF);
      003391 BD FF 05         [24] 2143 	cjne	r5,#0xff,00193$
      003394 BE FF 02         [24] 2144 	cjne	r6,#0xff,00193$
      003397 80 0C            [24] 2145 	sjmp	00116$
      003399                       2146 00193$:
      003399 BB FF 05         [24] 2147 	cjne	r3,#0xff,00194$
      00339C BC FF 02         [24] 2148 	cjne	r4,#0xff,00194$
      00339F 80 04            [24] 2149 	sjmp	00116$
      0033A1                       2150 00194$:
                                   2151 ;	assignBit
      0033A1 C2 00            [12] 2152 	clr	_main_sloc0_1_0
      0033A3 80 02            [24] 2153 	sjmp	00117$
      0033A5                       2154 00116$:
                                   2155 ;	assignBit
      0033A5 D2 00            [12] 2156 	setb	_main_sloc0_1_0
      0033A7                       2157 00117$:
      0033A7 A2 00            [12] 2158 	mov	c,_main_sloc0_1_0
      0033A9 E4               [12] 2159 	clr	a
      0033AA 33               [12] 2160 	rlc	a
      0033AB FE               [12] 2161 	mov	r6,a
                                   2162 ;	bootloader.c:151: USB_Init();
      0033AC C0 07            [24] 2163 	push	ar7
      0033AE C0 06            [24] 2164 	push	ar6
      0033B0 12 2D 87         [24] 2165 	lcall	_USB_Init
      0033B3 D0 06            [24] 2166 	pop	ar6
      0033B5 D0 07            [24] 2167 	pop	ar7
                                   2168 ;	bootloader.c:155: uint8_t stay_in_bootloader = button_pressed || is_blank;
      0033B7 EF               [12] 2169 	mov	a,r7
      0033B8 70 07            [24] 2170 	jnz	00119$
      0033BA EE               [12] 2171 	mov	a,r6
      0033BB 70 04            [24] 2172 	jnz	00119$
                                   2173 ;	assignBit
      0033BD C2 00            [12] 2174 	clr	_main_sloc0_1_0
      0033BF 80 02            [24] 2175 	sjmp	00120$
      0033C1                       2176 00119$:
                                   2177 ;	assignBit
      0033C1 D2 00            [12] 2178 	setb	_main_sloc0_1_0
      0033C3                       2179 00120$:
      0033C3 A2 00            [12] 2180 	mov	c,_main_sloc0_1_0
      0033C5 E4               [12] 2181 	clr	a
      0033C6 33               [12] 2182 	rlc	a
      0033C7 FF               [12] 2183 	mov	r7,a
                                   2184 ;	bootloader.c:157: while (1) {
      0033C8 7B 00            [12] 2185 	mov	r3,#0x00
      0033CA 7C 00            [12] 2186 	mov	r4,#0x00
      0033CC 7D 00            [12] 2187 	mov	r5,#0x00
      0033CE 7E 00            [12] 2188 	mov	r6,#0x00
      0033D0                       2189 00108$:
                                   2190 ;	bootloader.c:158: USB_Process();
      0033D0 C0 07            [24] 2191 	push	ar7
      0033D2 C0 06            [24] 2192 	push	ar6
      0033D4 C0 05            [24] 2193 	push	ar5
      0033D6 C0 04            [24] 2194 	push	ar4
      0033D8 C0 03            [24] 2195 	push	ar3
      0033DA 12 2F 3B         [24] 2196 	lcall	_USB_Process
                                   2197 ;	bootloader.c:160: if (USB_Available()) {
      0033DD 12 30 07         [24] 2198 	lcall	_USB_Available
      0033E0 E5 82            [12] 2199 	mov	a, dpl
      0033E2 D0 03            [24] 2200 	pop	ar3
      0033E4 D0 04            [24] 2201 	pop	ar4
      0033E6 D0 05            [24] 2202 	pop	ar5
      0033E8 D0 06            [24] 2203 	pop	ar6
      0033EA D0 07            [24] 2204 	pop	ar7
      0033EC 60 19            [24] 2205 	jz	00102$
                                   2206 ;	bootloader.c:161: stay_in_bootloader = 1; // Handshake received, cancel timeout
      0033EE 7F 01            [12] 2207 	mov	r7,#0x01
                                   2208 ;	bootloader.c:162: ProcessPacket();
      0033F0 C0 07            [24] 2209 	push	ar7
      0033F2 C0 06            [24] 2210 	push	ar6
      0033F4 C0 05            [24] 2211 	push	ar5
      0033F6 C0 04            [24] 2212 	push	ar4
      0033F8 C0 03            [24] 2213 	push	ar3
      0033FA 12 30 7A         [24] 2214 	lcall	_ProcessPacket
      0033FD D0 03            [24] 2215 	pop	ar3
      0033FF D0 04            [24] 2216 	pop	ar4
      003401 D0 05            [24] 2217 	pop	ar5
      003403 D0 06            [24] 2218 	pop	ar6
      003405 D0 07            [24] 2219 	pop	ar7
      003407                       2220 00102$:
                                   2221 ;	bootloader.c:165: if (!stay_in_bootloader) {
      003407 EF               [12] 2222 	mov	a,r7
      003408 70 C6            [24] 2223 	jnz	00108$
                                   2224 ;	bootloader.c:166: timeout++;
      00340A 0B               [12] 2225 	inc	r3
      00340B BB 00 09         [24] 2226 	cjne	r3,#0x00,00199$
      00340E 0C               [12] 2227 	inc	r4
      00340F BC 00 05         [24] 2228 	cjne	r4,#0x00,00199$
      003412 0D               [12] 2229 	inc	r5
      003413 BD 00 01         [24] 2230 	cjne	r5,#0x00,00199$
      003416 0E               [12] 2231 	inc	r6
      003417                       2232 00199$:
                                   2233 ;	bootloader.c:167: if (timeout > 1500000UL) { // ~3.0s timeout at 24MHz
      003417 C3               [12] 2234 	clr	c
      003418 74 60            [12] 2235 	mov	a,#0x60
      00341A 9B               [12] 2236 	subb	a,r3
      00341B 74 E3            [12] 2237 	mov	a,#0xe3
      00341D 9C               [12] 2238 	subb	a,r4
      00341E 74 16            [12] 2239 	mov	a,#0x16
      003420 9D               [12] 2240 	subb	a,r5
      003421 E4               [12] 2241 	clr	a
      003422 9E               [12] 2242 	subb	a,r6
      003423 50 AB            [24] 2243 	jnc	00108$
                                   2244 ;	free result
                                   2245 ;	bootloader.c:168: JumpToApp();
      003425 C0 07            [24] 2246 	push	ar7
      003427 C0 06            [24] 2247 	push	ar6
      003429 C0 05            [24] 2248 	push	ar5
      00342B C0 04            [24] 2249 	push	ar4
      00342D C0 03            [24] 2250 	push	ar3
      00342F 12 30 6D         [24] 2251 	lcall	_JumpToApp
      003432 D0 03            [24] 2252 	pop	ar3
      003434 D0 04            [24] 2253 	pop	ar4
      003436 D0 05            [24] 2254 	pop	ar5
      003438 D0 06            [24] 2255 	pop	ar6
      00343A D0 07            [24] 2256 	pop	ar7
                                   2257 ;	bootloader.c:172: }
      00343C 02 33 D0         [24] 2258 	ljmp	00108$
                                   2259 	.area CSEG    (CODE)
                                   2260 	.area CONST   (CODE)
                                   2261 	.area CONST   (CODE)
      0034EE                       2262 _DevDesc:
      0034EE 12                    2263 	.db #0x12	; 18
      0034EF 01                    2264 	.db #0x01	; 1
      0034F0 10                    2265 	.db #0x10	; 16
      0034F1 01                    2266 	.db #0x01	; 1
      0034F2 00                    2267 	.db #0x00	; 0
      0034F3 00                    2268 	.db #0x00	; 0
      0034F4 00                    2269 	.db #0x00	; 0
      0034F5 40                    2270 	.db #0x40	; 64
      0034F6 09                    2271 	.db #0x09	; 9
      0034F7 12                    2272 	.db #0x12	; 18
      0034F8 5D                    2273 	.db #0x5d	; 93
      0034F9 C5                    2274 	.db #0xc5	; 197
      0034FA 00                    2275 	.db #0x00	; 0
      0034FB 01                    2276 	.db #0x01	; 1
      0034FC 01                    2277 	.db #0x01	; 1
      0034FD 02                    2278 	.db #0x02	; 2
      0034FE 03                    2279 	.db #0x03	; 3
      0034FF 01                    2280 	.db #0x01	; 1
                                   2281 	.area CSEG    (CODE)
                                   2282 	.area CONST   (CODE)
      003500                       2283 _ReportDesc:
      003500 06                    2284 	.db #0x06	; 6
      003501 00                    2285 	.db #0x00	; 0
      003502 FF                    2286 	.db #0xff	; 255
      003503 09                    2287 	.db #0x09	; 9
      003504 01                    2288 	.db #0x01	; 1
      003505 A1                    2289 	.db #0xa1	; 161
      003506 01                    2290 	.db #0x01	; 1
      003507 09                    2291 	.db #0x09	; 9
      003508 02                    2292 	.db #0x02	; 2
      003509 15                    2293 	.db #0x15	; 21
      00350A 00                    2294 	.db #0x00	; 0
      00350B 26                    2295 	.db #0x26	; 38
      00350C FF                    2296 	.db #0xff	; 255
      00350D 00                    2297 	.db #0x00	; 0
      00350E 75                    2298 	.db #0x75	; 117	'u'
      00350F 08                    2299 	.db #0x08	; 8
      003510 95                    2300 	.db #0x95	; 149
      003511 40                    2301 	.db #0x40	; 64
      003512 91                    2302 	.db #0x91	; 145
      003513 02                    2303 	.db #0x02	; 2
      003514 09                    2304 	.db #0x09	; 9
      003515 03                    2305 	.db #0x03	; 3
      003516 15                    2306 	.db #0x15	; 21
      003517 00                    2307 	.db #0x00	; 0
      003518 26                    2308 	.db #0x26	; 38
      003519 FF                    2309 	.db #0xff	; 255
      00351A 00                    2310 	.db #0x00	; 0
      00351B 75                    2311 	.db #0x75	; 117	'u'
      00351C 08                    2312 	.db #0x08	; 8
      00351D 95                    2313 	.db #0x95	; 149
      00351E 40                    2314 	.db #0x40	; 64
      00351F 81                    2315 	.db #0x81	; 129
      003520 02                    2316 	.db #0x02	; 2
      003521 C0                    2317 	.db #0xc0	; 192
                                   2318 	.area CSEG    (CODE)
                                   2319 	.area CONST   (CODE)
      003522                       2320 _CfgDesc:
      003522 09                    2321 	.db #0x09	; 9
      003523 02                    2322 	.db #0x02	; 2
      003524 29                    2323 	.db #0x29	; 41
      003525 00                    2324 	.db #0x00	; 0
      003526 01                    2325 	.db #0x01	; 1
      003527 01                    2326 	.db #0x01	; 1
      003528 00                    2327 	.db #0x00	; 0
      003529 80                    2328 	.db #0x80	; 128
      00352A 32                    2329 	.db #0x32	; 50	'2'
      00352B 09                    2330 	.db #0x09	; 9
      00352C 04                    2331 	.db #0x04	; 4
      00352D 00                    2332 	.db #0x00	; 0
      00352E 00                    2333 	.db #0x00	; 0
      00352F 02                    2334 	.db #0x02	; 2
      003530 03                    2335 	.db #0x03	; 3
      003531 00                    2336 	.db #0x00	; 0
      003532 00                    2337 	.db #0x00	; 0
      003533 00                    2338 	.db #0x00	; 0
      003534 09                    2339 	.db #0x09	; 9
      003535 21                    2340 	.db #0x21	; 33
      003536 11                    2341 	.db #0x11	; 17
      003537 01                    2342 	.db #0x01	; 1
      003538 00                    2343 	.db #0x00	; 0
      003539 01                    2344 	.db #0x01	; 1
      00353A 22                    2345 	.db #0x22	; 34
      00353B 22                    2346 	.db #0x22	; 34
      00353C 00                    2347 	.db #0x00	; 0
      00353D 07                    2348 	.db #0x07	; 7
      00353E 05                    2349 	.db #0x05	; 5
      00353F 01                    2350 	.db #0x01	; 1
      003540 03                    2351 	.db #0x03	; 3
      003541 40                    2352 	.db #0x40	; 64
      003542 00                    2353 	.db #0x00	; 0
      003543 01                    2354 	.db #0x01	; 1
      003544 07                    2355 	.db #0x07	; 7
      003545 05                    2356 	.db #0x05	; 5
      003546 81                    2357 	.db #0x81	; 129
      003547 03                    2358 	.db #0x03	; 3
      003548 40                    2359 	.db #0x40	; 64
      003549 00                    2360 	.db #0x00	; 0
      00354A 01                    2361 	.db #0x01	; 1
                                   2362 	.area CSEG    (CODE)
                                   2363 	.area CONST   (CODE)
      00354B                       2364 _Str0Desc:
      00354B 04                    2365 	.db #0x04	; 4
      00354C 03                    2366 	.db #0x03	; 3
      00354D 09                    2367 	.db #0x09	; 9
      00354E 04                    2368 	.db #0x04	; 4
                                   2369 	.area CSEG    (CODE)
                                   2370 	.area CONST   (CODE)
      00354F                       2371 _Str1Desc:
      00354F 0E                    2372 	.db #0x0e	; 14
      003550 03                    2373 	.db #0x03	; 3
      003551 44                    2374 	.db #0x44	; 68	'D'
      003552 00                    2375 	.db #0x00	; 0
      003553 65                    2376 	.db #0x65	; 101	'e'
      003554 00                    2377 	.db #0x00	; 0
      003555 76                    2378 	.db #0x76	; 118	'v'
      003556 00                    2379 	.db #0x00	; 0
      003557 42                    2380 	.db #0x42	; 66	'B'
      003558 00                    2381 	.db #0x00	; 0
      003559 6F                    2382 	.db #0x6f	; 111	'o'
      00355A 00                    2383 	.db #0x00	; 0
      00355B 78                    2384 	.db #0x78	; 120	'x'
      00355C 00                    2385 	.db #0x00	; 0
                                   2386 	.area CSEG    (CODE)
                                   2387 	.area CONST   (CODE)
      00355D                       2388 _Str2Desc:
      00355D 20                    2389 	.db #0x20	; 32
      00355E 03                    2390 	.db #0x03	; 3
      00355F 49                    2391 	.db #0x49	; 73	'I'
      003560 00                    2392 	.db #0x00	; 0
      003561 64                    2393 	.db #0x64	; 100	'd'
      003562 00                    2394 	.db #0x00	; 0
      003563 61                    2395 	.db #0x61	; 97	'a'
      003564 00                    2396 	.db #0x00	; 0
      003565 6E                    2397 	.db #0x6e	; 110	'n'
      003566 00                    2398 	.db #0x00	; 0
      003567 27                    2399 	.db #0x27	; 39
      003568 00                    2400 	.db #0x00	; 0
      003569 73                    2401 	.db #0x73	; 115	's'
      00356A 00                    2402 	.db #0x00	; 0
      00356B 20                    2403 	.db #0x20	; 32
      00356C 00                    2404 	.db #0x00	; 0
      00356D 44                    2405 	.db #0x44	; 68	'D'
      00356E 00                    2406 	.db #0x00	; 0
      00356F 65                    2407 	.db #0x65	; 101	'e'
      003570 00                    2408 	.db #0x00	; 0
      003571 76                    2409 	.db #0x76	; 118	'v'
      003572 00                    2410 	.db #0x00	; 0
      003573 42                    2411 	.db #0x42	; 66	'B'
      003574 00                    2412 	.db #0x00	; 0
      003575 6F                    2413 	.db #0x6f	; 111	'o'
      003576 00                    2414 	.db #0x00	; 0
      003577 61                    2415 	.db #0x61	; 97	'a'
      003578 00                    2416 	.db #0x00	; 0
      003579 72                    2417 	.db #0x72	; 114	'r'
      00357A 00                    2418 	.db #0x00	; 0
      00357B 64                    2419 	.db #0x64	; 100	'd'
      00357C 00                    2420 	.db #0x00	; 0
                                   2421 	.area CSEG    (CODE)
                                   2422 	.area CONST   (CODE)
      00357D                       2423 _Str3Desc:
      00357D 0A                    2424 	.db #0x0a	; 10
      00357E 03                    2425 	.db #0x03	; 3
      00357F 76                    2426 	.db #0x76	; 118	'v'
      003580 00                    2427 	.db #0x00	; 0
      003581 31                    2428 	.db #0x31	; 49	'1'
      003582 00                    2429 	.db #0x00	; 0
      003583 2E                    2430 	.db #0x2e	; 46
      003584 00                    2431 	.db #0x00	; 0
      003585 30                    2432 	.db #0x30	; 48	'0'
      003586 00                    2433 	.db #0x00	; 0
                                   2434 	.area CSEG    (CODE)
                                   2435 	.area XINIT   (CODE)
                                   2436 	.area CABS    (ABS,CODE)
