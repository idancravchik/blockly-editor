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
                                    269 	.globl _IAP_ErasePage
                                    270 	.globl _IAP_WriteWord
                                    271 	.globl _IAP_ReadWord
                                    272 	.globl _IAP_CalculateCRC16
                                    273 	.globl _USB_Init
                                    274 	.globl _USB_Process
                                    275 	.globl _USB_Available
                                    276 	.globl _USB_GetRxBuffer
                                    277 	.globl _USB_ReleaseRx
                                    278 	.globl _USB_SendReport
                                    279 	.globl _USB_Shutdown
                                    280 ;--------------------------------------------------------
                                    281 ; special function registers
                                    282 ;--------------------------------------------------------
                                    283 	.area RSEG    (ABS,DATA)
      000000                        284 	.org 0x0000
                           0000D0   285 _PSW	=	0x00d0
                           0000E0   286 _ACC	=	0x00e0
                           0000F0   287 _B	=	0x00f0
                           000081   288 _SP	=	0x0081
                           000082   289 _DPL	=	0x0082
                           000083   290 _DPH	=	0x0083
                           0000A1   291 _SAFE_MOD	=	0x00a1
                           0000B1   292 _GLOBAL_CFG	=	0x00b1
                           000087   293 _PCON	=	0x0087
                           0000B9   294 _CLOCK_CFG	=	0x00b9
                           0000A9   295 _WAKE_CTRL	=	0x00a9
                           0000FE   296 _RESET_KEEP	=	0x00fe
                           0000FF   297 _WDOG_COUNT	=	0x00ff
                           0000A8   298 _IE	=	0x00a8
                           0000B8   299 _IP	=	0x00b8
                           0000E8   300 _IE_EX	=	0x00e8
                           0000E9   301 _IP_EX	=	0x00e9
                           0000C7   302 _GPIO_IE	=	0x00c7
                           008584   303 _ROM_ADDR	=	0x8584
                           000084   304 _ROM_ADDR_L	=	0x0084
                           000085   305 _ROM_ADDR_H	=	0x0085
                           008F8E   306 _ROM_DATA	=	0x8f8e
                           00008E   307 _ROM_DATA_L	=	0x008e
                           00008F   308 _ROM_DATA_H	=	0x008f
                           000086   309 _ROM_CTRL	=	0x0086
                           000090   310 _P1	=	0x0090
                           000092   311 _P1_MOD_OC	=	0x0092
                           000093   312 _P1_DIR_PU	=	0x0093
                           0000A0   313 _P2	=	0x00a0
                           0000B0   314 _P3	=	0x00b0
                           000096   315 _P3_MOD_OC	=	0x0096
                           000097   316 _P3_DIR_PU	=	0x0097
                           0000C6   317 _PIN_FUNC	=	0x00c6
                           0000A2   318 _XBUS_AUX	=	0x00a2
                           000088   319 _TCON	=	0x0088
                           000089   320 _TMOD	=	0x0089
                           00008A   321 _TL0	=	0x008a
                           00008B   322 _TL1	=	0x008b
                           00008C   323 _TH0	=	0x008c
                           00008D   324 _TH1	=	0x008d
                           000098   325 _SCON	=	0x0098
                           000099   326 _SBUF	=	0x0099
                           0000C8   327 _T2CON	=	0x00c8
                           0000C9   328 _T2MOD	=	0x00c9
                           00CBCA   329 _RCAP2	=	0xcbca
                           0000CA   330 _RCAP2L	=	0x00ca
                           0000CB   331 _RCAP2H	=	0x00cb
                           00CDCC   332 _T2COUNT	=	0xcdcc
                           0000CC   333 _TL2	=	0x00cc
                           0000CD   334 _TH2	=	0x00cd
                           00CFCE   335 _T2CAP1	=	0xcfce
                           0000CE   336 _T2CAP1L	=	0x00ce
                           0000CF   337 _T2CAP1H	=	0x00cf
                           00009B   338 _PWM_DATA2	=	0x009b
                           00009C   339 _PWM_DATA1	=	0x009c
                           00009D   340 _PWM_CTRL	=	0x009d
                           00009E   341 _PWM_CK_SE	=	0x009e
                           0000F8   342 _SPI0_STAT	=	0x00f8
                           0000F9   343 _SPI0_DATA	=	0x00f9
                           0000FA   344 _SPI0_CTRL	=	0x00fa
                           0000FB   345 _SPI0_CK_SE	=	0x00fb
                           0000FC   346 _SPI0_SETUP	=	0x00fc
                           0000C0   347 _SCON1	=	0x00c0
                           0000C1   348 _SBUF1	=	0x00c1
                           0000C2   349 _SBAUD1	=	0x00c2
                           000080   350 _ADC_CTRL	=	0x0080
                           00009A   351 _ADC_CFG	=	0x009a
                           00009F   352 _ADC_DATA	=	0x009f
                           0000C3   353 _TKEY_CTRL	=	0x00c3
                           00C5C4   354 _TKEY_DAT	=	0xc5c4
                           0000C4   355 _TKEY_DATL	=	0x00c4
                           0000C5   356 _TKEY_DATH	=	0x00c5
                           000091   357 _USB_C_CTRL	=	0x0091
                           0000D1   358 _UDEV_CTRL	=	0x00d1
                           0000D2   359 _UEP1_CTRL	=	0x00d2
                           0000D3   360 _UEP1_T_LEN	=	0x00d3
                           0000D4   361 _UEP2_CTRL	=	0x00d4
                           0000D5   362 _UEP2_T_LEN	=	0x00d5
                           0000D6   363 _UEP3_CTRL	=	0x00d6
                           0000D7   364 _UEP3_T_LEN	=	0x00d7
                           0000D8   365 _USB_INT_FG	=	0x00d8
                           0000D9   366 _USB_INT_ST	=	0x00d9
                           0000DA   367 _USB_MIS_ST	=	0x00da
                           0000DB   368 _USB_RX_LEN	=	0x00db
                           0000DC   369 _UEP0_CTRL	=	0x00dc
                           0000DD   370 _UEP0_T_LEN	=	0x00dd
                           0000DE   371 _UEP4_CTRL	=	0x00de
                           0000DF   372 _UEP4_T_LEN	=	0x00df
                           0000E1   373 _USB_INT_EN	=	0x00e1
                           0000E2   374 _USB_CTRL	=	0x00e2
                           0000E3   375 _USB_DEV_AD	=	0x00e3
                           00E5E4   376 _UEP2_DMA	=	0xe5e4
                           0000E4   377 _UEP2_DMA_L	=	0x00e4
                           0000E5   378 _UEP2_DMA_H	=	0x00e5
                           00E7E6   379 _UEP3_DMA	=	0xe7e6
                           0000E6   380 _UEP3_DMA_L	=	0x00e6
                           0000E7   381 _UEP3_DMA_H	=	0x00e7
                           0000EA   382 _UEP4_1_MOD	=	0x00ea
                           0000EB   383 _UEP2_3_MOD	=	0x00eb
                           00EDEC   384 _UEP0_DMA	=	0xedec
                           0000EC   385 _UEP0_DMA_L	=	0x00ec
                           0000ED   386 _UEP0_DMA_H	=	0x00ed
                           00EFEE   387 _UEP1_DMA	=	0xefee
                           0000EE   388 _UEP1_DMA_L	=	0x00ee
                           0000EF   389 _UEP1_DMA_H	=	0x00ef
                                    390 ;--------------------------------------------------------
                                    391 ; special function bits
                                    392 ;--------------------------------------------------------
                                    393 	.area RSEG    (ABS,DATA)
      000000                        394 	.org 0x0000
                           0000D7   395 _CY	=	0x00d7
                           0000D6   396 _AC	=	0x00d6
                           0000D5   397 _F0	=	0x00d5
                           0000D4   398 _RS1	=	0x00d4
                           0000D3   399 _RS0	=	0x00d3
                           0000D2   400 _OV	=	0x00d2
                           0000D1   401 _F1	=	0x00d1
                           0000D0   402 _P	=	0x00d0
                           0000AF   403 _EA	=	0x00af
                           0000AE   404 _E_DIS	=	0x00ae
                           0000AD   405 _ET2	=	0x00ad
                           0000AC   406 _ES	=	0x00ac
                           0000AB   407 _ET1	=	0x00ab
                           0000AA   408 _EX1	=	0x00aa
                           0000A9   409 _ET0	=	0x00a9
                           0000A8   410 _EX0	=	0x00a8
                           0000BF   411 _PH_FLAG	=	0x00bf
                           0000BE   412 _PL_FLAG	=	0x00be
                           0000BD   413 _PT2	=	0x00bd
                           0000BC   414 _PS	=	0x00bc
                           0000BB   415 _PT1	=	0x00bb
                           0000BA   416 _PX1	=	0x00ba
                           0000B9   417 _PT0	=	0x00b9
                           0000B8   418 _PX0	=	0x00b8
                           0000EF   419 _IE_WDOG	=	0x00ef
                           0000EE   420 _IE_GPIO	=	0x00ee
                           0000ED   421 _IE_PWMX	=	0x00ed
                           0000EC   422 _IE_UART1	=	0x00ec
                           0000EB   423 _IE_ADC	=	0x00eb
                           0000EA   424 _IE_USB	=	0x00ea
                           0000E9   425 _IE_TKEY	=	0x00e9
                           0000E8   426 _IE_SPI0	=	0x00e8
                           000097   427 _SCK	=	0x0097
                           000097   428 _TXD1	=	0x0097
                           000097   429 _TIN5	=	0x0097
                           000096   430 _MISO	=	0x0096
                           000096   431 _RXD1	=	0x0096
                           000096   432 _TIN4	=	0x0096
                           000095   433 _MOSI	=	0x0095
                           000095   434 _PWM1	=	0x0095
                           000095   435 _TIN3	=	0x0095
                           000095   436 _UCC2	=	0x0095
                           000095   437 _AIN2	=	0x0095
                           000094   438 _T2_	=	0x0094
                           000094   439 _CAP1_	=	0x0094
                           000094   440 _SCS	=	0x0094
                           000094   441 _TIN2	=	0x0094
                           000094   442 _UCC1	=	0x0094
                           000094   443 _AIN1	=	0x0094
                           000093   444 _TXD_	=	0x0093
                           000092   445 _RXD_	=	0x0092
                           000091   446 _T2EX	=	0x0091
                           000091   447 _CAP2	=	0x0091
                           000091   448 _TIN1	=	0x0091
                           000091   449 _VBUS2	=	0x0091
                           000091   450 _AIN0	=	0x0091
                           000090   451 _T2	=	0x0090
                           000090   452 _CAP1	=	0x0090
                           000090   453 _TIN0	=	0x0090
                           000097   454 _P1_7	=	0x0097
                           000096   455 _P1_6	=	0x0096
                           000095   456 _P1_5	=	0x0095
                           000094   457 _P1_4	=	0x0094
                           000093   458 _P1_3	=	0x0093
                           000092   459 _P1_2	=	0x0092
                           000091   460 _P1_1	=	0x0091
                           000090   461 _P1_0	=	0x0090
                           0000B7   462 _UDM	=	0x00b7
                           0000B6   463 _UDP	=	0x00b6
                           0000B5   464 _T1	=	0x00b5
                           0000B4   465 _PWM2	=	0x00b4
                           0000B4   466 _RXD1_	=	0x00b4
                           0000B4   467 _T0	=	0x00b4
                           0000B3   468 _INT1	=	0x00b3
                           0000B2   469 _TXD1_	=	0x00b2
                           0000B2   470 _INT0	=	0x00b2
                           0000B2   471 _VBUS1	=	0x00b2
                           0000B2   472 _AIN3	=	0x00b2
                           0000B1   473 _PWM2_	=	0x00b1
                           0000B1   474 _TXD	=	0x00b1
                           0000B0   475 _PWM1_	=	0x00b0
                           0000B0   476 _RXD	=	0x00b0
                           0000B7   477 _P3_7	=	0x00b7
                           0000B6   478 _P3_6	=	0x00b6
                           0000B5   479 _P3_5	=	0x00b5
                           0000B4   480 _P3_4	=	0x00b4
                           0000B3   481 _P3_3	=	0x00b3
                           0000B2   482 _P3_2	=	0x00b2
                           0000B1   483 _P3_1	=	0x00b1
                           0000B0   484 _P3_0	=	0x00b0
                           00008F   485 _TF1	=	0x008f
                           00008E   486 _TR1	=	0x008e
                           00008D   487 _TF0	=	0x008d
                           00008C   488 _TR0	=	0x008c
                           00008B   489 _IE1	=	0x008b
                           00008A   490 _IT1	=	0x008a
                           000089   491 _IE0	=	0x0089
                           000088   492 _IT0	=	0x0088
                           00009F   493 _SM0	=	0x009f
                           00009E   494 _SM1	=	0x009e
                           00009D   495 _SM2	=	0x009d
                           00009C   496 _REN	=	0x009c
                           00009B   497 _TB8	=	0x009b
                           00009A   498 _RB8	=	0x009a
                           000099   499 _TI	=	0x0099
                           000098   500 _RI	=	0x0098
                           0000CF   501 _TF2	=	0x00cf
                           0000CF   502 _CAP1F	=	0x00cf
                           0000CE   503 _EXF2	=	0x00ce
                           0000CD   504 _RCLK	=	0x00cd
                           0000CC   505 _TCLK	=	0x00cc
                           0000CB   506 _EXEN2	=	0x00cb
                           0000CA   507 _TR2	=	0x00ca
                           0000C9   508 _C_T2	=	0x00c9
                           0000C8   509 _CP_RL2	=	0x00c8
                           0000FF   510 _S0_FST_ACT	=	0x00ff
                           0000FE   511 _S0_IF_OV	=	0x00fe
                           0000FD   512 _S0_IF_FIRST	=	0x00fd
                           0000FC   513 _S0_IF_BYTE	=	0x00fc
                           0000FB   514 _S0_FREE	=	0x00fb
                           0000FA   515 _S0_T_FIFO	=	0x00fa
                           0000F8   516 _S0_R_FIFO	=	0x00f8
                           0000C7   517 _U1SM0	=	0x00c7
                           0000C5   518 _U1SMOD	=	0x00c5
                           0000C4   519 _U1REN	=	0x00c4
                           0000C3   520 _U1TB8	=	0x00c3
                           0000C2   521 _U1RB8	=	0x00c2
                           0000C1   522 _U1TI	=	0x00c1
                           0000C0   523 _U1RI	=	0x00c0
                           000087   524 _CMPO	=	0x0087
                           000086   525 _CMP_IF	=	0x0086
                           000085   526 _ADC_IF	=	0x0085
                           000084   527 _ADC_START	=	0x0084
                           000083   528 _CMP_CHAN	=	0x0083
                           000081   529 _ADC_CHAN1	=	0x0081
                           000080   530 _ADC_CHAN0	=	0x0080
                           0000DF   531 _U_IS_NAK	=	0x00df
                           0000DE   532 _U_TOG_OK	=	0x00de
                           0000DD   533 _U_SIE_FREE	=	0x00dd
                           0000DC   534 _UIF_FIFO_OV	=	0x00dc
                           0000DB   535 _UIF_HST_SOF	=	0x00db
                           0000DA   536 _UIF_SUSPEND	=	0x00da
                           0000D9   537 _UIF_TRANSFER	=	0x00d9
                           0000D8   538 _UIF_DETECT	=	0x00d8
                           0000D8   539 _UIF_BUS_RST	=	0x00d8
                                    540 ;--------------------------------------------------------
                                    541 ; overlayable register banks
                                    542 ;--------------------------------------------------------
                                    543 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        544 	.ds 8
                                    545 ;--------------------------------------------------------
                                    546 ; internal ram data
                                    547 ;--------------------------------------------------------
                                    548 	.area DSEG    (DATA)
      000021                        549 _rx_ready:
      000021                        550 	.ds 1
      000022                        551 _usb_dev_addr:
      000022                        552 	.ds 1
      000023                        553 _usb_config:
      000023                        554 	.ds 1
      000024                        555 _setup_tx_ptr:
      000024                        556 	.ds 2
      000026                        557 _setup_tx_len:
      000026                        558 	.ds 2
      000028                        559 _USB_SendReport_PARM_2:
      000028                        560 	.ds 1
      000029                        561 _is_unlocked:
      000029                        562 	.ds 1
      00002A                        563 _last_erased_page:
      00002A                        564 	.ds 2
      00002C                        565 _ProcessPacket_rx_10000_126:
      00002C                        566 	.ds 3
      00002F                        567 _ProcessPacket_cmd_10000_126:
      00002F                        568 	.ds 1
      000030                        569 _ProcessPacket_seq_10000_126:
      000030                        570 	.ds 1
      000031                        571 _ProcessPacket_addr_10000_126:
      000031                        572 	.ds 2
      000033                        573 _ProcessPacket_len_10000_126:
      000033                        574 	.ds 1
      000034                        575 _ProcessPacket_erase_err_40000_136:
      000034                        576 	.ds 1
      000035                        577 _ProcessPacket_end_page_40000_136:
      000035                        578 	.ds 2
      000037                        579 _ProcessPacket_err_40000_144:
      000037                        580 	.ds 1
      000038                        581 _ProcessPacket_i_50000_145:
      000038                        582 	.ds 1
      000039                        583 _ProcessPacket_sloc0_1_0:
      000039                        584 	.ds 1
      00003A                        585 _ProcessPacket_sloc1_1_0:
      00003A                        586 	.ds 2
      00003C                        587 _ProcessPacket_sloc2_1_0:
      00003C                        588 	.ds 3
                                    589 ;--------------------------------------------------------
                                    590 ; overlayable items in internal ram
                                    591 ;--------------------------------------------------------
                                    592 	.area	OSEG    (OVR,DATA)
                                    593 	.area	OSEG    (OVR,DATA)
      000008                        594 _IAP_WriteWord_PARM_2:
      000008                        595 	.ds 2
                                    596 	.area	OSEG    (OVR,DATA)
                                    597 	.area	OSEG    (OVR,DATA)
      000008                        598 _IAP_CalculateCRC16_PARM_2:
      000008                        599 	.ds 2
      00000A                        600 _IAP_CalculateCRC16_i_20000_28:
      00000A                        601 	.ds 2
                                    602 	.area	OSEG    (OVR,DATA)
                                    603 ;--------------------------------------------------------
                                    604 ; Stack segment in internal ram
                                    605 ;--------------------------------------------------------
                                    606 	.area SSEG
      00003F                        607 __start__stack:
      00003F                        608 	.ds	1
                                    609 
                                    610 ;--------------------------------------------------------
                                    611 ; indirectly addressable internal ram data
                                    612 ;--------------------------------------------------------
                                    613 	.area ISEG    (DATA)
                                    614 ;--------------------------------------------------------
                                    615 ; absolute internal ram data
                                    616 ;--------------------------------------------------------
                                    617 	.area IABS    (ABS,DATA)
                                    618 	.area IABS    (ABS,DATA)
                                    619 ;--------------------------------------------------------
                                    620 ; bit data
                                    621 ;--------------------------------------------------------
                                    622 	.area BSEG    (BIT)
      000000                        623 _main_sloc0_1_0:
      000000                        624 	.ds 1
                                    625 ;--------------------------------------------------------
                                    626 ; paged external ram data
                                    627 ;--------------------------------------------------------
                                    628 	.area PSEG    (PAG,XDATA)
                                    629 ;--------------------------------------------------------
                                    630 ; uninitialized external ram data
                                    631 ;--------------------------------------------------------
                                    632 	.area XSEG    (XDATA)
                           000000   633 _Ep0Buffer	=	0x0000
                           000040   634 _Ep1Buffer	=	0x0040
      000000                        635 _reply_buf:
      000000                        636 	.ds 64
                                    637 ;--------------------------------------------------------
                                    638 ; absolute external ram data
                                    639 ;--------------------------------------------------------
                                    640 	.area XABS    (ABS,XDATA)
                                    641 ;--------------------------------------------------------
                                    642 ; initialized external ram data
                                    643 ;--------------------------------------------------------
                                    644 	.area XISEG   (XDATA)
                                    645 	.area HOME    (CODE)
                                    646 	.area GSINIT0 (CODE)
                                    647 	.area GSINIT1 (CODE)
                                    648 	.area GSINIT2 (CODE)
                                    649 	.area GSINIT3 (CODE)
                                    650 	.area GSINIT4 (CODE)
                                    651 	.area GSINIT5 (CODE)
                                    652 	.area GSINIT  (CODE)
                                    653 	.area GSFINAL (CODE)
                                    654 	.area CSEG    (CODE)
                                    655 ;--------------------------------------------------------
                                    656 ; interrupt vector
                                    657 ;--------------------------------------------------------
                                    658 	.area HOME    (CODE)
      002C00                        659 __interrupt_vect:
      002C00 02 2C 4E         [24]  660 	ljmp	__sdcc_gsinit_startup
                                    661 ; restartable atomic support routines
      002C03                        662 	.ds	5
      002C08                        663 sdcc_atomic_exchange_rollback_start::
      002C08 00               [12]  664 	nop
      002C09 00               [12]  665 	nop
      002C0A                        666 sdcc_atomic_exchange_pdata_impl:
      002C0A E2               [24]  667 	movx	a, @r0
      002C0B FB               [12]  668 	mov	r3, a
      002C0C EA               [12]  669 	mov	a, r2
      002C0D F2               [24]  670 	movx	@r0, a
      002C0E 80 2C            [24]  671 	sjmp	sdcc_atomic_exchange_exit
      002C10 00               [12]  672 	nop
      002C11 00               [12]  673 	nop
      002C12                        674 sdcc_atomic_exchange_xdata_impl:
      002C12 E0               [24]  675 	movx	a, @dptr
      002C13 FB               [12]  676 	mov	r3, a
      002C14 EA               [12]  677 	mov	a, r2
      002C15 F0               [24]  678 	movx	@dptr, a
      002C16 80 24            [24]  679 	sjmp	sdcc_atomic_exchange_exit
      002C18                        680 sdcc_atomic_compare_exchange_idata_impl:
      002C18 E6               [12]  681 	mov	a, @r0
      002C19 B5 02 02         [24]  682 	cjne	a, ar2, .+#5
      002C1C EB               [12]  683 	mov	a, r3
      002C1D F6               [12]  684 	mov	@r0, a
      002C1E 22               [24]  685 	ret
      002C1F 00               [12]  686 	nop
      002C20                        687 sdcc_atomic_compare_exchange_pdata_impl:
      002C20 E2               [24]  688 	movx	a, @r0
      002C21 B5 02 02         [24]  689 	cjne	a, ar2, .+#5
      002C24 EB               [12]  690 	mov	a, r3
      002C25 F2               [24]  691 	movx	@r0, a
      002C26 22               [24]  692 	ret
      002C27 00               [12]  693 	nop
      002C28                        694 sdcc_atomic_compare_exchange_xdata_impl:
      002C28 E0               [24]  695 	movx	a, @dptr
      002C29 B5 02 02         [24]  696 	cjne	a, ar2, .+#5
      002C2C EB               [12]  697 	mov	a, r3
      002C2D F0               [24]  698 	movx	@dptr, a
      002C2E 22               [24]  699 	ret
      002C2F                        700 sdcc_atomic_exchange_rollback_end::
                                    701 
      002C2F                        702 sdcc_atomic_exchange_gptr_impl::
      002C2F 30 F6 E0         [24]  703 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      002C32 A8 82            [24]  704 	mov	r0, dpl
      002C34 20 F5 D3         [24]  705 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      002C37                        706 sdcc_atomic_exchange_idata_impl:
      002C37 EA               [12]  707 	mov	a, r2
      002C38 C6               [12]  708 	xch	a, @r0
      002C39 F5 82            [12]  709 	mov	dpl, a
      002C3B 22               [24]  710 	ret
      002C3C                        711 sdcc_atomic_exchange_exit:
      002C3C 8B 82            [24]  712 	mov	dpl, r3
      002C3E 22               [24]  713 	ret
      002C3F                        714 sdcc_atomic_compare_exchange_gptr_impl::
      002C3F 30 F6 E6         [24]  715 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      002C42 A8 82            [24]  716 	mov	r0, dpl
      002C44 20 F5 D9         [24]  717 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      002C47 80 CF            [24]  718 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    719 ;--------------------------------------------------------
                                    720 ; global & static initialisations
                                    721 ;--------------------------------------------------------
                                    722 	.area HOME    (CODE)
                                    723 	.area GSINIT  (CODE)
                                    724 	.area GSFINAL (CODE)
                                    725 	.area GSINIT  (CODE)
                                    726 	.globl __sdcc_gsinit_startup
                                    727 	.globl __sdcc_program_startup
                                    728 	.globl __start__stack
                                    729 	.globl __mcs51_genXINIT
                                    730 	.globl __mcs51_genXRAMCLEAR
                                    731 	.globl __mcs51_genRAMCLEAR
                                    732 ;	usb_hid.c:10: static volatile uint8_t rx_ready = 0;
      002CA7 75 21 00         [24]  733 	mov	_rx_ready,#0x00
                                    734 ;	usb_hid.c:11: static uint8_t usb_dev_addr = 0;
      002CAA 75 22 00         [24]  735 	mov	_usb_dev_addr,#0x00
                                    736 ;	usb_hid.c:12: static uint8_t usb_config = 0;
      002CAD 75 23 00         [24]  737 	mov	_usb_config,#0x00
                                    738 ;	usb_hid.c:117: static __code const uint8_t *setup_tx_ptr = 0;
      002CB0 E4               [12]  739 	clr	a
      002CB1 F5 24            [12]  740 	mov	_setup_tx_ptr,a
      002CB3 F5 25            [12]  741 	mov	(_setup_tx_ptr + 1),a
                                    742 ;	usb_hid.c:118: static uint16_t setup_tx_len = 0;
      002CB5 F5 26            [12]  743 	mov	_setup_tx_len,a
      002CB7 F5 27            [12]  744 	mov	(_setup_tx_len + 1),a
                                    745 ;	bootloader.c:27: static uint8_t is_unlocked = 0;
      002CB9 F5 29            [12]  746 	mov	_is_unlocked,a
                                    747 ;	bootloader.c:28: static uint16_t last_erased_page = 0xFFFF;
      002CBB 75 2A FF         [24]  748 	mov	_last_erased_page,#0xff
      002CBE 75 2B FF         [24]  749 	mov	(_last_erased_page + 1),#0xff
                                    750 	.area GSFINAL (CODE)
      002CC1 02 2C 49         [24]  751 	ljmp	__sdcc_program_startup
                                    752 ;--------------------------------------------------------
                                    753 ; Home
                                    754 ;--------------------------------------------------------
                                    755 	.area HOME    (CODE)
                                    756 	.area HOME    (CODE)
      002C49                        757 __sdcc_program_startup:
      002C49 12 34 24         [24]  758 	lcall	_main
      002C4C                        759 __sdcc_program_exit:
      002C4C 80 FE            [24]  760 	sjmp	.
                                    761 ;	return from main will return to caller
                                    762 ;--------------------------------------------------------
                                    763 ; code
                                    764 ;--------------------------------------------------------
                                    765 	.area CSEG    (CODE)
                                    766 ;------------------------------------------------------------
                                    767 ;Allocation info for local variables in function 'IAP_ErasePage'
                                    768 ;------------------------------------------------------------
                                    769 ;addr          Allocated to registers r6 r7 
                                    770 ;status        Allocated to registers r7 
                                    771 ;ea_saved      Allocated to registers r5 
                                    772 ;------------------------------------------------------------
                                    773 ;	iap_flash.c:11: uint8_t IAP_ErasePage(uint16_t addr) {
                                    774 ;	-----------------------------------------
                                    775 ;	 function IAP_ErasePage
                                    776 ;	-----------------------------------------
      002CC4                        777 _IAP_ErasePage:
                           000007   778 	ar7 = 0x07
                           000006   779 	ar6 = 0x06
                           000005   780 	ar5 = 0x05
                           000004   781 	ar4 = 0x04
                           000003   782 	ar3 = 0x03
                           000002   783 	ar2 = 0x02
                           000001   784 	ar1 = 0x01
                           000000   785 	ar0 = 0x00
      002CC4 AF 83            [24]  786 	mov	r7, dph
                                    787 ;	iap_flash.c:16: if (addr >= BOOTLOADER_START) {
      002CC6 74 D4            [12]  788 	mov	a,#0x100 - 0x2c
      002CC8 2F               [12]  789 	add	a,r7
      002CC9 50 04            [24]  790 	jnc	00102$
                                    791 ;	iap_flash.c:17: return 0x03; // Out of bounds error
      002CCB 75 82 03         [24]  792 	mov	dpl, #0x03
      002CCE 22               [24]  793 	ret
      002CCF                        794 00102$:
                                    795 ;	iap_flash.c:21: addr &= ~0x03FF;
      002CCF 7E 00            [12]  796 	mov	r6,#0x00
      002CD1 53 07 FC         [24]  797 	anl	ar7,#0xfc
                                    798 ;	iap_flash.c:24: ea_saved = EA;
      002CD4 A2 AF            [12]  799 	mov	c,_EA
      002CD6 E4               [12]  800 	clr	a
      002CD7 33               [12]  801 	rlc	a
      002CD8 FD               [12]  802 	mov	r5,a
                                    803 ;	iap_flash.c:25: EA = 0;
                                    804 ;	assignBit
      002CD9 C2 AF            [12]  805 	clr	_EA
                                    806 ;	iap_flash.c:28: SAFE_MOD = 0x55;
      002CDB 75 A1 55         [24]  807 	mov	_SAFE_MOD,#0x55
                                    808 ;	iap_flash.c:29: SAFE_MOD = 0xAA;
      002CDE 75 A1 AA         [24]  809 	mov	_SAFE_MOD,#0xaa
                                    810 ;	iap_flash.c:30: GLOBAL_CFG |= bCODE_WE;
      002CE1 43 B1 08         [24]  811 	orl	_GLOBAL_CFG,#0x08
                                    812 ;	iap_flash.c:33: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
      002CE4 8E 84            [24]  813 	mov	_ROM_ADDR_L,r6
                                    814 ;	iap_flash.c:34: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
      002CE6 8F 85            [24]  815 	mov	_ROM_ADDR_H,r7
                                    816 ;	iap_flash.c:37: ROM_CTRL = ROM_CMD_ERASE;
      002CE8 75 86 A6         [24]  817 	mov	_ROM_CTRL,#0xa6
                                    818 ;	iap_flash.c:40: status = ROM_STATUS;
      002CEB AF 86            [24]  819 	mov	r7,_ROM_CTRL
                                    820 ;	iap_flash.c:43: SAFE_MOD = 0x55;
      002CED 75 A1 55         [24]  821 	mov	_SAFE_MOD,#0x55
                                    822 ;	iap_flash.c:44: SAFE_MOD = 0xAA;
      002CF0 75 A1 AA         [24]  823 	mov	_SAFE_MOD,#0xaa
                                    824 ;	iap_flash.c:45: GLOBAL_CFG &= ~bCODE_WE;
      002CF3 53 B1 F7         [24]  825 	anl	_GLOBAL_CFG,#0xf7
                                    826 ;	iap_flash.c:46: SAFE_MOD = 0x00;
      002CF6 75 A1 00         [24]  827 	mov	_SAFE_MOD,#0x00
                                    828 ;	iap_flash.c:49: EA = ea_saved;
                                    829 ;	assignBit
      002CF9 ED               [12]  830 	mov	a,r5
      002CFA 24 FF            [12]  831 	add	a,#0xff
      002CFC 92 AF            [24]  832 	mov	_EA,c
                                    833 ;	iap_flash.c:52: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
      002CFE EF               [12]  834 	mov	a,r7
      002CFF 20 E1 04         [24]  835 	jb	acc.1,00103$
      002D02 EF               [12]  836 	mov	a,r7
      002D03 20 E6 04         [24]  837 	jb	acc.6,00104$
      002D06                        838 00103$:
                                    839 ;	iap_flash.c:53: return 0x04; // Erase error
      002D06 75 82 04         [24]  840 	mov	dpl, #0x04
      002D09 22               [24]  841 	ret
      002D0A                        842 00104$:
                                    843 ;	iap_flash.c:55: return 0x00;
      002D0A 75 82 00         [24]  844 	mov	dpl, #0x00
                                    845 ;	iap_flash.c:56: }
      002D0D 22               [24]  846 	ret
                                    847 ;------------------------------------------------------------
                                    848 ;Allocation info for local variables in function 'IAP_WriteWord'
                                    849 ;------------------------------------------------------------
                                    850 ;data_word     Allocated with name '_IAP_WriteWord_PARM_2'
                                    851 ;addr          Allocated to registers r6 r7 
                                    852 ;status        Allocated to registers r7 
                                    853 ;ea_saved      Allocated to registers r5 
                                    854 ;------------------------------------------------------------
                                    855 ;	iap_flash.c:58: uint8_t IAP_WriteWord(uint16_t addr, uint16_t data_word) {
                                    856 ;	-----------------------------------------
                                    857 ;	 function IAP_WriteWord
                                    858 ;	-----------------------------------------
      002D0E                        859 _IAP_WriteWord:
      002D0E AE 82            [24]  860 	mov	r6, dpl
      002D10 AF 83            [24]  861 	mov	r7, dph
                                    862 ;	iap_flash.c:63: if (addr >= BOOTLOADER_START) {
      002D12 74 D4            [12]  863 	mov	a,#0x100 - 0x2c
      002D14 2F               [12]  864 	add	a,r7
      002D15 50 04            [24]  865 	jnc	00102$
                                    866 ;	iap_flash.c:64: return 0x03; // Out of bounds error
      002D17 75 82 03         [24]  867 	mov	dpl, #0x03
      002D1A 22               [24]  868 	ret
      002D1B                        869 00102$:
                                    870 ;	iap_flash.c:68: addr &= ~0x0001;
      002D1B 53 06 FE         [24]  871 	anl	ar6,#0xfe
                                    872 ;	iap_flash.c:71: ea_saved = EA;
      002D1E A2 AF            [12]  873 	mov	c,_EA
      002D20 E4               [12]  874 	clr	a
      002D21 33               [12]  875 	rlc	a
      002D22 FD               [12]  876 	mov	r5,a
                                    877 ;	iap_flash.c:72: EA = 0;
                                    878 ;	assignBit
      002D23 C2 AF            [12]  879 	clr	_EA
                                    880 ;	iap_flash.c:75: SAFE_MOD = 0x55;
      002D25 75 A1 55         [24]  881 	mov	_SAFE_MOD,#0x55
                                    882 ;	iap_flash.c:76: SAFE_MOD = 0xAA;
      002D28 75 A1 AA         [24]  883 	mov	_SAFE_MOD,#0xaa
                                    884 ;	iap_flash.c:77: GLOBAL_CFG |= bCODE_WE;
      002D2B 43 B1 08         [24]  885 	orl	_GLOBAL_CFG,#0x08
                                    886 ;	iap_flash.c:80: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
      002D2E 8E 84            [24]  887 	mov	_ROM_ADDR_L,r6
                                    888 ;	iap_flash.c:81: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
      002D30 8F 85            [24]  889 	mov	_ROM_ADDR_H,r7
                                    890 ;	iap_flash.c:82: ROM_DATA_L = (uint8_t)(data_word & 0xFF);
      002D32 85 08 8E         [24]  891 	mov	_ROM_DATA_L,_IAP_WriteWord_PARM_2
                                    892 ;	iap_flash.c:83: ROM_DATA_H = (uint8_t)((data_word >> 8) & 0xFF);
      002D35 85 09 8F         [24]  893 	mov	_ROM_DATA_H,(_IAP_WriteWord_PARM_2 + 1)
                                    894 ;	iap_flash.c:86: ROM_CTRL = ROM_CMD_WRITE;
      002D38 75 86 9A         [24]  895 	mov	_ROM_CTRL,#0x9a
                                    896 ;	iap_flash.c:89: status = ROM_STATUS;
      002D3B AF 86            [24]  897 	mov	r7,_ROM_CTRL
                                    898 ;	iap_flash.c:92: SAFE_MOD = 0x55;
      002D3D 75 A1 55         [24]  899 	mov	_SAFE_MOD,#0x55
                                    900 ;	iap_flash.c:93: SAFE_MOD = 0xAA;
      002D40 75 A1 AA         [24]  901 	mov	_SAFE_MOD,#0xaa
                                    902 ;	iap_flash.c:94: GLOBAL_CFG &= ~bCODE_WE;
      002D43 53 B1 F7         [24]  903 	anl	_GLOBAL_CFG,#0xf7
                                    904 ;	iap_flash.c:95: SAFE_MOD = 0x00;
      002D46 75 A1 00         [24]  905 	mov	_SAFE_MOD,#0x00
                                    906 ;	iap_flash.c:98: EA = ea_saved;
                                    907 ;	assignBit
      002D49 ED               [12]  908 	mov	a,r5
      002D4A 24 FF            [12]  909 	add	a,#0xff
      002D4C 92 AF            [24]  910 	mov	_EA,c
                                    911 ;	iap_flash.c:101: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
      002D4E EF               [12]  912 	mov	a,r7
      002D4F 20 E1 04         [24]  913 	jb	acc.1,00103$
      002D52 EF               [12]  914 	mov	a,r7
      002D53 20 E6 04         [24]  915 	jb	acc.6,00104$
      002D56                        916 00103$:
                                    917 ;	iap_flash.c:102: return 0x04; // Write error
      002D56 75 82 04         [24]  918 	mov	dpl, #0x04
      002D59 22               [24]  919 	ret
      002D5A                        920 00104$:
                                    921 ;	iap_flash.c:104: return 0x00;
      002D5A 75 82 00         [24]  922 	mov	dpl, #0x00
                                    923 ;	iap_flash.c:105: }
      002D5D 22               [24]  924 	ret
                                    925 ;------------------------------------------------------------
                                    926 ;Allocation info for local variables in function 'IAP_ReadWord'
                                    927 ;------------------------------------------------------------
                                    928 ;addr          Allocated to registers r6 r7 
                                    929 ;low           Allocated to registers r5 
                                    930 ;high          Allocated to registers 
                                    931 ;ptr           Allocated to registers r6 r7 
                                    932 ;------------------------------------------------------------
                                    933 ;	iap_flash.c:107: uint16_t IAP_ReadWord(uint16_t addr) {
                                    934 ;	-----------------------------------------
                                    935 ;	 function IAP_ReadWord
                                    936 ;	-----------------------------------------
      002D5E                        937 _IAP_ReadWord:
                                    938 ;	iap_flash.c:109: __code const uint8_t *ptr = (__code const uint8_t *)addr;
                                    939 ;	iap_flash.c:110: low = *ptr;
      002D5E AE 82            [24]  940 	mov	r6,dpl
      002D60 AF 83            [24]  941 	mov  r7,dph
      002D62 E4               [12]  942 	clr	a
      002D63 93               [24]  943 	movc	a,@a+dptr
      002D64 FD               [12]  944 	mov	r5,a
                                    945 ;	iap_flash.c:111: high = *(ptr + 1);
      002D65 8E 82            [24]  946 	mov	dpl,r6
      002D67 8F 83            [24]  947 	mov	dph,r7
      002D69 A3               [24]  948 	inc	dptr
      002D6A E4               [12]  949 	clr	a
      002D6B 93               [24]  950 	movc	a,@a+dptr
                                    951 ;	iap_flash.c:112: return ((uint16_t)high << 8) | low;
      002D6C FE               [12]  952 	mov	r6,a
      002D6D E4               [12]  953 	clr	a
      002D6E FF               [12]  954 	mov	r7,a
      002D6F FC               [12]  955 	mov	r4,a
      002D70 ED               [12]  956 	mov	a,r5
      002D71 4F               [12]  957 	orl	a,r7
      002D72 F5 82            [12]  958 	mov	dpl,a
      002D74 EC               [12]  959 	mov	a,r4
      002D75 4E               [12]  960 	orl	a,r6
      002D76 F5 83            [12]  961 	mov	dph,a
                                    962 ;	iap_flash.c:113: }
      002D78 22               [24]  963 	ret
                                    964 ;------------------------------------------------------------
                                    965 ;Allocation info for local variables in function 'IAP_CalculateCRC16'
                                    966 ;------------------------------------------------------------
                                    967 ;length        Allocated with name '_IAP_CalculateCRC16_PARM_2'
                                    968 ;start_addr    Allocated to registers r6 r7 
                                    969 ;crc           Allocated to registers r4 r5 
                                    970 ;ptr           Allocated to registers 
                                    971 ;i             Allocated with name '_IAP_CalculateCRC16_i_20000_28'
                                    972 ;byte          Allocated to registers 
                                    973 ;b             Allocated to registers r1 
                                    974 ;------------------------------------------------------------
                                    975 ;	iap_flash.c:115: uint16_t IAP_CalculateCRC16(uint16_t start_addr, uint16_t length) {
                                    976 ;	-----------------------------------------
                                    977 ;	 function IAP_CalculateCRC16
                                    978 ;	-----------------------------------------
      002D79                        979 _IAP_CalculateCRC16:
      002D79 AE 82            [24]  980 	mov	r6, dpl
      002D7B AF 83            [24]  981 	mov	r7, dph
                                    982 ;	iap_flash.c:116: uint16_t crc = 0xFFFF;
      002D7D 7C FF            [12]  983 	mov	r4,#0xff
      002D7F 7D FF            [12]  984 	mov	r5,#0xff
                                    985 ;	iap_flash.c:117: __code const uint8_t *ptr = (__code const uint8_t *)start_addr;
                                    986 ;	iap_flash.c:119: for (uint16_t i = 0; i < length; i++) {
      002D81 E4               [12]  987 	clr	a
      002D82 F5 0A            [12]  988 	mov	_IAP_CalculateCRC16_i_20000_28,a
      002D84 F5 0B            [12]  989 	mov	(_IAP_CalculateCRC16_i_20000_28 + 1),a
      002D86                        990 00110$:
      002D86 C3               [12]  991 	clr	c
      002D87 E5 0A            [12]  992 	mov	a,_IAP_CalculateCRC16_i_20000_28
      002D89 95 08            [12]  993 	subb	a,_IAP_CalculateCRC16_PARM_2
      002D8B E5 0B            [12]  994 	mov	a,(_IAP_CalculateCRC16_i_20000_28 + 1)
      002D8D 95 09            [12]  995 	subb	a,(_IAP_CalculateCRC16_PARM_2 + 1)
      002D8F 50 46            [24]  996 	jnc	00105$
                                    997 ;	iap_flash.c:120: uint8_t byte = *ptr++;
      002D91 8E 82            [24]  998 	mov	dpl,r6
      002D93 8F 83            [24]  999 	mov	dph,r7
      002D95 E4               [12] 1000 	clr	a
      002D96 93               [24] 1001 	movc	a,@a+dptr
      002D97 F9               [12] 1002 	mov	r1,a
      002D98 A3               [24] 1003 	inc	dptr
      002D99 AE 82            [24] 1004 	mov	r6,dpl
      002D9B AF 83            [24] 1005 	mov	r7,dph
                                   1006 ;	iap_flash.c:121: crc ^= ((uint16_t)byte << 8);
      002D9D 89 00            [24] 1007 	mov	ar0,r1
      002D9F 88 01            [24] 1008 	mov	ar1,r0
      002DA1 E4               [12] 1009 	clr	a
      002DA2 62 04            [12] 1010 	xrl	ar4,a
      002DA4 E9               [12] 1011 	mov	a,r1
      002DA5 62 05            [12] 1012 	xrl	ar5,a
                                   1013 ;	iap_flash.c:122: for (uint8_t b = 0; b < 8; b++) {
      002DA7 79 00            [12] 1014 	mov	r1,#0x00
      002DA9                       1015 00107$:
      002DA9 B9 08 00         [24] 1016 	cjne	r1,#0x08,00152$
      002DAC                       1017 00152$:
      002DAC 50 1F            [24] 1018 	jnc	00111$
                                   1019 ;	iap_flash.c:123: if (crc & 0x8000) {
      002DAE ED               [12] 1020 	mov	a,r5
      002DAF 30 E7 12         [24] 1021 	jnb	acc.7,00102$
                                   1022 ;	iap_flash.c:124: crc = (crc << 1) ^ 0x1021;
      002DB2 EC               [12] 1023 	mov	a,r4
      002DB3 2C               [12] 1024 	add	a,r4
      002DB4 F8               [12] 1025 	mov	r0,a
      002DB5 ED               [12] 1026 	mov	a,r5
      002DB6 33               [12] 1027 	rlc	a
      002DB7 FB               [12] 1028 	mov	r3,a
      002DB8 63 00 21         [24] 1029 	xrl	ar0,#0x21
      002DBB 63 03 10         [24] 1030 	xrl	ar3,#0x10
      002DBE 88 04            [24] 1031 	mov	ar4,r0
      002DC0 8B 05            [24] 1032 	mov	ar5,r3
      002DC2 80 06            [24] 1033 	sjmp	00108$
      002DC4                       1034 00102$:
                                   1035 ;	iap_flash.c:126: crc <<= 1;
      002DC4 EC               [12] 1036 	mov	a,r4
      002DC5 2C               [12] 1037 	add	a,r4
      002DC6 FC               [12] 1038 	mov	r4,a
      002DC7 ED               [12] 1039 	mov	a,r5
      002DC8 33               [12] 1040 	rlc	a
      002DC9 FD               [12] 1041 	mov	r5,a
      002DCA                       1042 00108$:
                                   1043 ;	iap_flash.c:122: for (uint8_t b = 0; b < 8; b++) {
      002DCA 09               [12] 1044 	inc	r1
      002DCB 80 DC            [24] 1045 	sjmp	00107$
      002DCD                       1046 00111$:
                                   1047 ;	iap_flash.c:119: for (uint16_t i = 0; i < length; i++) {
      002DCD 05 0A            [12] 1048 	inc	_IAP_CalculateCRC16_i_20000_28
      002DCF E4               [12] 1049 	clr	a
      002DD0 B5 0A B3         [24] 1050 	cjne	a,_IAP_CalculateCRC16_i_20000_28,00110$
      002DD3 05 0B            [12] 1051 	inc	(_IAP_CalculateCRC16_i_20000_28 + 1)
      002DD5 80 AF            [24] 1052 	sjmp	00110$
      002DD7                       1053 00105$:
                                   1054 ;	iap_flash.c:130: return crc;
      002DD7 8C 82            [24] 1055 	mov	dpl, r4
      002DD9 8D 83            [24] 1056 	mov	dph, r5
                                   1057 ;	iap_flash.c:131: }
      002DDB 22               [24] 1058 	ret
                                   1059 ;------------------------------------------------------------
                                   1060 ;Allocation info for local variables in function 'USB_Init'
                                   1061 ;------------------------------------------------------------
                                   1062 ;	usb_hid.c:120: void USB_Init(void) {
                                   1063 ;	-----------------------------------------
                                   1064 ;	 function USB_Init
                                   1065 ;	-----------------------------------------
      002DDC                       1066 _USB_Init:
                                   1067 ;	usb_hid.c:122: SAFE_MOD = 0x55;
      002DDC 75 A1 55         [24] 1068 	mov	_SAFE_MOD,#0x55
                                   1069 ;	usb_hid.c:123: SAFE_MOD = 0xAA;
      002DDF 75 A1 AA         [24] 1070 	mov	_SAFE_MOD,#0xaa
                                   1071 ;	usb_hid.c:124: CLOCK_CFG = 0x86; // 24MHz internal clock
      002DE2 75 B9 86         [24] 1072 	mov	_CLOCK_CFG,#0x86
                                   1073 ;	usb_hid.c:125: SAFE_MOD = 0x00;
      002DE5 75 A1 00         [24] 1074 	mov	_SAFE_MOD,#0x00
                                   1075 ;	usb_hid.c:128: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL;
      002DE8 75 E2 06         [24] 1076 	mov	_USB_CTRL,#0x06
                                   1077 ;	usb_hid.c:129: USB_CTRL = 0x00;
      002DEB 75 E2 00         [24] 1078 	mov	_USB_CTRL,#0x00
                                   1079 ;	usb_hid.c:132: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
      002DEE 75 EC 00         [24] 1080 	mov	_UEP0_DMA_L,#_Ep0Buffer
                                   1081 ;	usb_hid.c:133: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
      002DF1 7E 00            [12] 1082 	mov	r6,#_Ep0Buffer
      002DF3 7F 00            [12] 1083 	mov	r7,#(_Ep0Buffer >> 8)
      002DF5 8F ED            [24] 1084 	mov	_UEP0_DMA_H,r7
                                   1085 ;	usb_hid.c:135: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
      002DF7 75 EE 40         [24] 1086 	mov	_UEP1_DMA_L,#_Ep1Buffer
                                   1087 ;	usb_hid.c:136: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
      002DFA 7E 40            [12] 1088 	mov	r6,#_Ep1Buffer
      002DFC 7F 00            [12] 1089 	mov	r7,#(_Ep1Buffer >> 8)
      002DFE 8F EF            [24] 1090 	mov	_UEP1_DMA_H,r7
                                   1091 ;	usb_hid.c:139: UEP4_1_MOD = 0xC0;
      002E00 75 EA C0         [24] 1092 	mov	_UEP4_1_MOD,#0xc0
                                   1093 ;	usb_hid.c:140: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002E03 75 D2 12         [24] 1094 	mov	_UEP1_CTRL,#0x12
                                   1095 ;	usb_hid.c:141: UEP1_T_LEN = 0;
      002E06 75 D3 00         [24] 1096 	mov	_UEP1_T_LEN,#0x00
                                   1097 ;	usb_hid.c:144: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002E09 75 DC 02         [24] 1098 	mov	_UEP0_CTRL,#0x02
                                   1099 ;	usb_hid.c:147: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
      002E0C 75 E2 29         [24] 1100 	mov	_USB_CTRL,#0x29
                                   1101 ;	usb_hid.c:148: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN; // Full speed 12Mbps
      002E0F 75 D1 81         [24] 1102 	mov	_UDEV_CTRL,#0x81
                                   1103 ;	usb_hid.c:149: USB_DEV_AD = 0x00;
      002E12 75 E3 00         [24] 1104 	mov	_USB_DEV_AD,#0x00
                                   1105 ;	usb_hid.c:151: rx_ready = 0;
      002E15 75 21 00         [24] 1106 	mov	_rx_ready,#0x00
                                   1107 ;	usb_hid.c:152: usb_dev_addr = 0;
      002E18 75 22 00         [24] 1108 	mov	_usb_dev_addr,#0x00
                                   1109 ;	usb_hid.c:153: usb_config = 0;
      002E1B 75 23 00         [24] 1110 	mov	_usb_config,#0x00
                                   1111 ;	usb_hid.c:154: }
      002E1E 22               [24] 1112 	ret
                                   1113 ;------------------------------------------------------------
                                   1114 ;Allocation info for local variables in function 'Handle_EP0_Setup'
                                   1115 ;------------------------------------------------------------
                                   1116 ;req_type      Allocated to registers r7 
                                   1117 ;req           Allocated to registers r6 
                                   1118 ;value         Allocated to registers r4 r5 
                                   1119 ;length        Allocated to registers r3 r2 
                                   1120 ;send_len      Allocated to registers r7 
                                   1121 ;------------------------------------------------------------
                                   1122 ;	usb_hid.c:156: static void Handle_EP0_Setup(void) {
                                   1123 ;	-----------------------------------------
                                   1124 ;	 function Handle_EP0_Setup
                                   1125 ;	-----------------------------------------
      002E1F                       1126 _Handle_EP0_Setup:
                                   1127 ;	usb_hid.c:157: uint8_t req_type = Ep0Buffer[0];
      002E1F 90 00 00         [24] 1128 	mov	dptr,#_Ep0Buffer
      002E22 E0               [24] 1129 	movx	a,@dptr
      002E23 FF               [12] 1130 	mov	r7,a
                                   1131 ;	usb_hid.c:158: uint8_t req = Ep0Buffer[1];
      002E24 90 00 01         [24] 1132 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002E27 E0               [24] 1133 	movx	a,@dptr
      002E28 FE               [12] 1134 	mov	r6,a
                                   1135 ;	usb_hid.c:159: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
      002E29 90 00 02         [24] 1136 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002E2C E0               [24] 1137 	movx	a,@dptr
      002E2D FD               [12] 1138 	mov	r5,a
      002E2E 90 00 03         [24] 1139 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002E31 E0               [24] 1140 	movx	a,@dptr
      002E32 FB               [12] 1141 	mov	r3,a
      002E33 7C 00            [12] 1142 	mov	r4,#0x00
      002E35 8D 02            [24] 1143 	mov	ar2,r5
      002E37 7D 00            [12] 1144 	mov	r5,#0x00
      002E39 EC               [12] 1145 	mov	a,r4
      002E3A 4A               [12] 1146 	orl	a,r2
      002E3B FC               [12] 1147 	mov	r4,a
      002E3C EB               [12] 1148 	mov	a,r3
      002E3D 4D               [12] 1149 	orl	a,r5
      002E3E FD               [12] 1150 	mov	r5,a
                                   1151 ;	usb_hid.c:160: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
      002E3F 90 00 06         [24] 1152 	mov	dptr,#(_Ep0Buffer + 0x0006)
      002E42 E0               [24] 1153 	movx	a,@dptr
      002E43 FB               [12] 1154 	mov	r3,a
      002E44 90 00 07         [24] 1155 	mov	dptr,#(_Ep0Buffer + 0x0007)
      002E47 E0               [24] 1156 	movx	a,@dptr
      002E48 FA               [12] 1157 	mov	r2,a
      002E49 E4               [12] 1158 	clr	a
      002E4A F9               [12] 1159 	mov	r1,a
      002E4B F8               [12] 1160 	mov	r0,a
      002E4C 4B               [12] 1161 	orl	a,r3
      002E4D FB               [12] 1162 	mov	r3,a
      002E4E EA               [12] 1163 	mov	a,r2
      002E4F 48               [12] 1164 	orl	a,r0
      002E50 FA               [12] 1165 	mov	r2,a
                                   1166 ;	usb_hid.c:162: setup_tx_ptr = 0;
      002E51 E4               [12] 1167 	clr	a
      002E52 F5 24            [12] 1168 	mov	_setup_tx_ptr,a
      002E54 F5 25            [12] 1169 	mov	(_setup_tx_ptr + 1),a
                                   1170 ;	usb_hid.c:163: setup_tx_len = 0;
      002E56 F5 26            [12] 1171 	mov	_setup_tx_len,a
      002E58 F5 27            [12] 1172 	mov	(_setup_tx_len + 1),a
                                   1173 ;	usb_hid.c:165: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
      002E5A EF               [12] 1174 	mov	a,r7
      002E5B 54 60            [12] 1175 	anl	a,#0x60
      002E5D 60 03            [24] 1176 	jz	00234$
      002E5F 02 2F 28         [24] 1177 	ljmp	00123$
      002E62                       1178 00234$:
                                   1179 ;	usb_hid.c:166: switch (req) {
      002E62 EE               [12] 1180 	mov	a,r6
      002E63 70 03            [24] 1181 	jnz	00235$
      002E65 02 2F 1A         [24] 1182 	ljmp	00114$
      002E68                       1183 00235$:
      002E68 BE 05 03         [24] 1184 	cjne	r6,#0x05,00236$
      002E6B 02 2F 12         [24] 1185 	ljmp	00112$
      002E6E                       1186 00236$:
      002E6E BE 06 02         [24] 1187 	cjne	r6,#0x06,00237$
      002E71 80 09            [24] 1188 	sjmp	00101$
      002E73                       1189 00237$:
      002E73 BE 09 03         [24] 1190 	cjne	r6,#0x09,00238$
      002E76 02 2F 16         [24] 1191 	ljmp	00113$
      002E79                       1192 00238$:
      002E79 02 2F 28         [24] 1193 	ljmp	00123$
                                   1194 ;	usb_hid.c:167: case USB_GET_DESCRIPTOR:
      002E7C                       1195 00101$:
                                   1196 ;	usb_hid.c:168: switch (Ep0Buffer[3]) {
      002E7C 90 00 03         [24] 1197 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002E7F E0               [24] 1198 	movx	a,@dptr
      002E80 FF               [12] 1199 	mov	r7,a
      002E81 BF 01 02         [24] 1200 	cjne	r7,#0x01,00239$
      002E84 80 12            [24] 1201 	sjmp	00102$
      002E86                       1202 00239$:
      002E86 BF 02 02         [24] 1203 	cjne	r7,#0x02,00240$
      002E89 80 1C            [24] 1204 	sjmp	00103$
      002E8B                       1205 00240$:
      002E8B BF 03 02         [24] 1206 	cjne	r7,#0x03,00241$
      002E8E 80 25            [24] 1207 	sjmp	00104$
      002E90                       1208 00241$:
      002E90 BF 22 02         [24] 1209 	cjne	r7,#0x22,00242$
      002E93 80 6F            [24] 1210 	sjmp	00110$
      002E95                       1211 00242$:
      002E95 02 2F 28         [24] 1212 	ljmp	00123$
                                   1213 ;	usb_hid.c:169: case 0x01: // Device Descriptor
      002E98                       1214 00102$:
                                   1215 ;	usb_hid.c:170: setup_tx_ptr = DevDesc;
      002E98 75 24 C2         [24] 1216 	mov	_setup_tx_ptr,#_DevDesc
      002E9B 75 25 35         [24] 1217 	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
                                   1218 ;	usb_hid.c:171: setup_tx_len = sizeof(DevDesc);
      002E9E 75 26 12         [24] 1219 	mov	_setup_tx_len,#0x12
      002EA1 75 27 00         [24] 1220 	mov	(_setup_tx_len + 1),#0x00
                                   1221 ;	usb_hid.c:172: break;
      002EA4 02 2F 28         [24] 1222 	ljmp	00123$
                                   1223 ;	usb_hid.c:173: case 0x02: // Configuration Descriptor
      002EA7                       1224 00103$:
                                   1225 ;	usb_hid.c:174: setup_tx_ptr = CfgDesc;
      002EA7 75 24 F6         [24] 1226 	mov	_setup_tx_ptr,#_CfgDesc
      002EAA 75 25 35         [24] 1227 	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
                                   1228 ;	usb_hid.c:175: setup_tx_len = sizeof(CfgDesc);
      002EAD 75 26 29         [24] 1229 	mov	_setup_tx_len,#0x29
      002EB0 75 27 00         [24] 1230 	mov	(_setup_tx_len + 1),#0x00
                                   1231 ;	usb_hid.c:176: break;
                                   1232 ;	usb_hid.c:177: case 0x03: // String Descriptor
      002EB3 80 73            [24] 1233 	sjmp	00123$
      002EB5                       1234 00104$:
                                   1235 ;	usb_hid.c:178: switch (Ep0Buffer[2]) {
      002EB5 90 00 02         [24] 1236 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002EB8 E0               [24] 1237 	movx	a,@dptr
      002EB9 FF               [12] 1238 	mov  r7,a
      002EBA 24 FC            [12] 1239 	add	a,#0xff - 0x03
      002EBC 40 6A            [24] 1240 	jc	00123$
                                   1241 ;	free result
      002EBE EF               [12] 1242 	mov	a,r7
      002EBF 2F               [12] 1243 	add	a,r7
                                   1244 ;	usb_hid.c:179: case 0: setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); break;
      002EC0 90 2E C4         [24] 1245 	mov	dptr,#00244$
      002EC3 73               [24] 1246 	jmp	@a+dptr
      002EC4                       1247 00244$:
      002EC4 80 06            [24] 1248 	sjmp	00105$
      002EC6 80 12            [24] 1249 	sjmp	00106$
      002EC8 80 1E            [24] 1250 	sjmp	00107$
      002ECA 80 2A            [24] 1251 	sjmp	00108$
      002ECC                       1252 00105$:
      002ECC 75 24 1F         [24] 1253 	mov	_setup_tx_ptr,#_Str0Desc
      002ECF 75 25 36         [24] 1254 	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
      002ED2 75 26 04         [24] 1255 	mov	_setup_tx_len,#0x04
      002ED5 75 27 00         [24] 1256 	mov	(_setup_tx_len + 1),#0x00
                                   1257 ;	usb_hid.c:180: case 1: setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); break;
      002ED8 80 4E            [24] 1258 	sjmp	00123$
      002EDA                       1259 00106$:
      002EDA 75 24 23         [24] 1260 	mov	_setup_tx_ptr,#_Str1Desc
      002EDD 75 25 36         [24] 1261 	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
      002EE0 75 26 0E         [24] 1262 	mov	_setup_tx_len,#0x0e
      002EE3 75 27 00         [24] 1263 	mov	(_setup_tx_len + 1),#0x00
                                   1264 ;	usb_hid.c:181: case 2: setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); break;
      002EE6 80 40            [24] 1265 	sjmp	00123$
      002EE8                       1266 00107$:
      002EE8 75 24 31         [24] 1267 	mov	_setup_tx_ptr,#_Str2Desc
      002EEB 75 25 36         [24] 1268 	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
      002EEE 75 26 20         [24] 1269 	mov	_setup_tx_len,#0x20
      002EF1 75 27 00         [24] 1270 	mov	(_setup_tx_len + 1),#0x00
                                   1271 ;	usb_hid.c:182: case 3: setup_tx_ptr = Str3Desc; setup_tx_len = sizeof(Str3Desc); break;
      002EF4 80 32            [24] 1272 	sjmp	00123$
      002EF6                       1273 00108$:
      002EF6 75 24 51         [24] 1274 	mov	_setup_tx_ptr,#_Str3Desc
      002EF9 75 25 36         [24] 1275 	mov	(_setup_tx_ptr + 1),#(_Str3Desc >> 8)
      002EFC 75 26 0A         [24] 1276 	mov	_setup_tx_len,#0x0a
      002EFF 75 27 00         [24] 1277 	mov	(_setup_tx_len + 1),#0x00
                                   1278 ;	usb_hid.c:184: break;
                                   1279 ;	usb_hid.c:185: case 0x22: // HID Report Descriptor
      002F02 80 24            [24] 1280 	sjmp	00123$
      002F04                       1281 00110$:
                                   1282 ;	usb_hid.c:186: setup_tx_ptr = ReportDesc;
      002F04 75 24 D4         [24] 1283 	mov	_setup_tx_ptr,#_ReportDesc
      002F07 75 25 35         [24] 1284 	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
                                   1285 ;	usb_hid.c:187: setup_tx_len = sizeof(ReportDesc);
      002F0A 75 26 22         [24] 1286 	mov	_setup_tx_len,#0x22
      002F0D 75 27 00         [24] 1287 	mov	(_setup_tx_len + 1),#0x00
                                   1288 ;	usb_hid.c:190: break;
                                   1289 ;	usb_hid.c:192: case USB_SET_ADDRESS:
      002F10 80 16            [24] 1290 	sjmp	00123$
      002F12                       1291 00112$:
                                   1292 ;	usb_hid.c:193: usb_dev_addr = (uint8_t)value;
      002F12 8C 22            [24] 1293 	mov	_usb_dev_addr,r4
                                   1294 ;	usb_hid.c:194: break;
                                   1295 ;	usb_hid.c:196: case USB_SET_CONFIGURATION:
      002F14 80 12            [24] 1296 	sjmp	00123$
      002F16                       1297 00113$:
                                   1298 ;	usb_hid.c:197: usb_config = (uint8_t)value;
      002F16 8C 23            [24] 1299 	mov	_usb_config,r4
                                   1300 ;	usb_hid.c:198: break;
                                   1301 ;	usb_hid.c:200: case USB_GET_STATUS:
      002F18 80 0E            [24] 1302 	sjmp	00123$
      002F1A                       1303 00114$:
                                   1304 ;	usb_hid.c:201: Ep0Buffer[0] = 0x00;
      002F1A 90 00 00         [24] 1305 	mov	dptr,#_Ep0Buffer
      002F1D E4               [12] 1306 	clr	a
      002F1E F0               [24] 1307 	movx	@dptr,a
                                   1308 ;	usb_hid.c:202: Ep0Buffer[1] = 0x00;
      002F1F 90 00 01         [24] 1309 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002F22 F0               [24] 1310 	movx	@dptr,a
                                   1311 ;	usb_hid.c:203: setup_tx_len = 2;
      002F23 75 26 02         [24] 1312 	mov	_setup_tx_len,#0x02
      002F26 F5 27            [12] 1313 	mov	(_setup_tx_len + 1),a
                                   1314 ;	usb_hid.c:212: }
      002F28                       1315 00123$:
                                   1316 ;	usb_hid.c:215: if (setup_tx_len > length) {
      002F28 C3               [12] 1317 	clr	c
      002F29 EB               [12] 1318 	mov	a,r3
      002F2A 95 26            [12] 1319 	subb	a,_setup_tx_len
      002F2C EA               [12] 1320 	mov	a,r2
      002F2D 95 27            [12] 1321 	subb	a,(_setup_tx_len + 1)
      002F2F 50 04            [24] 1322 	jnc	00125$
                                   1323 ;	free result
                                   1324 ;	usb_hid.c:216: setup_tx_len = length;
      002F31 8B 26            [24] 1325 	mov	_setup_tx_len,r3
      002F33 8A 27            [24] 1326 	mov	(_setup_tx_len + 1),r2
      002F35                       1327 00125$:
                                   1328 ;	usb_hid.c:219: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002F35 AE 26            [24] 1329 	mov	r6,_setup_tx_len
      002F37 AF 27            [24] 1330 	mov	r7,(_setup_tx_len + 1)
      002F39 C3               [12] 1331 	clr	c
      002F3A 74 40            [12] 1332 	mov	a,#0x40
      002F3C 9E               [12] 1333 	subb	a,r6
      002F3D E4               [12] 1334 	clr	a
      002F3E 9F               [12] 1335 	subb	a,r7
      002F3F 50 04            [24] 1336 	jnc	00131$
                                   1337 ;	free result
      002F41 7F 40            [12] 1338 	mov	r7,#0x40
      002F43 80 04            [24] 1339 	sjmp	00132$
      002F45                       1340 00131$:
      002F45 AE 26            [24] 1341 	mov	r6,_setup_tx_len
      002F47 8E 07            [24] 1342 	mov	ar7,r6
      002F49                       1343 00132$:
                                   1344 ;	usb_hid.c:220: if (setup_tx_ptr && send_len > 0) {
      002F49 E5 24            [12] 1345 	mov	a,_setup_tx_ptr
      002F4B 45 25            [12] 1346 	orl	a,(_setup_tx_ptr + 1)
      002F4D 60 3B            [24] 1347 	jz	00127$
      002F4F EF               [12] 1348 	mov	a,r7
      002F50 60 38            [24] 1349 	jz	00127$
                                   1350 ;	usb_hid.c:221: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002F52 85 24 08         [24] 1351 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002F55 85 25 09         [24] 1352 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002F58 75 0A 80         [24] 1353 	mov	(___memcpy_PARM_2 + 2),#0x80
      002F5B 8F 0B            [24] 1354 	mov	___memcpy_PARM_3,r7
      002F5D 75 0C 00         [24] 1355 	mov	(___memcpy_PARM_3 + 1),#0x00
      002F60 90 00 00         [24] 1356 	mov	dptr,#_Ep0Buffer
      002F63 75 F0 00         [24] 1357 	mov	b, #0x00
      002F66 C0 07            [24] 1358 	push	ar7
      002F68 12 35 13         [24] 1359 	lcall	___memcpy
      002F6B D0 07            [24] 1360 	pop	ar7
                                   1361 ;	usb_hid.c:222: setup_tx_ptr += send_len;
      002F6D EF               [12] 1362 	mov	a,r7
      002F6E 25 24            [12] 1363 	add	a, _setup_tx_ptr
      002F70 F5 24            [12] 1364 	mov	_setup_tx_ptr,a
      002F72 E4               [12] 1365 	clr	a
      002F73 35 25            [12] 1366 	addc	a, (_setup_tx_ptr + 1)
      002F75 F5 25            [12] 1367 	mov	(_setup_tx_ptr + 1),a
                                   1368 ;	usb_hid.c:223: setup_tx_len -= send_len;
      002F77 8F 05            [24] 1369 	mov	ar5,r7
      002F79 7E 00            [12] 1370 	mov	r6,#0x00
      002F7B AB 26            [24] 1371 	mov	r3,_setup_tx_len
      002F7D AC 27            [24] 1372 	mov	r4,(_setup_tx_len + 1)
      002F7F EB               [12] 1373 	mov	a,r3
      002F80 C3               [12] 1374 	clr	c
      002F81 9D               [12] 1375 	subb	a,r5
      002F82 FB               [12] 1376 	mov	r3,a
      002F83 EC               [12] 1377 	mov	a,r4
      002F84 9E               [12] 1378 	subb	a,r6
      002F85 FC               [12] 1379 	mov	r4,a
      002F86 8B 26            [24] 1380 	mov	_setup_tx_len,r3
      002F88 8C 27            [24] 1381 	mov	(_setup_tx_len + 1),r4
      002F8A                       1382 00127$:
                                   1383 ;	usb_hid.c:226: UEP0_T_LEN = send_len;
      002F8A 8F DD            [24] 1384 	mov	_UEP0_T_LEN,r7
                                   1385 ;	usb_hid.c:227: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
      002F8C 75 DC C0         [24] 1386 	mov	_UEP0_CTRL,#0xc0
                                   1387 ;	usb_hid.c:228: }
      002F8F 22               [24] 1388 	ret
                                   1389 ;------------------------------------------------------------
                                   1390 ;Allocation info for local variables in function 'USB_Process'
                                   1391 ;------------------------------------------------------------
                                   1392 ;token         Allocated to registers r7 
                                   1393 ;endp          Allocated to registers r5 
                                   1394 ;send_len      Allocated to registers r6 
                                   1395 ;------------------------------------------------------------
                                   1396 ;	usb_hid.c:230: void USB_Process(void) {
                                   1397 ;	-----------------------------------------
                                   1398 ;	 function USB_Process
                                   1399 ;	-----------------------------------------
      002F90                       1400 _USB_Process:
                                   1401 ;	usb_hid.c:231: if (UIF_BUS_RST) {
      002F90 30 D8 0F         [24] 1402 	jnb	_UIF_BUS_RST,00102$
                                   1403 ;	usb_hid.c:232: USB_DEV_AD = 0x00;
      002F93 75 E3 00         [24] 1404 	mov	_USB_DEV_AD,#0x00
                                   1405 ;	usb_hid.c:233: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002F96 75 DC 02         [24] 1406 	mov	_UEP0_CTRL,#0x02
                                   1407 ;	usb_hid.c:234: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002F99 75 D2 12         [24] 1408 	mov	_UEP1_CTRL,#0x12
                                   1409 ;	usb_hid.c:235: UIF_BUS_RST = 0; // Clear reset flag
                                   1410 ;	assignBit
      002F9C C2 D8            [12] 1411 	clr	_UIF_BUS_RST
                                   1412 ;	usb_hid.c:236: rx_ready = 0;
      002F9E 75 21 00         [24] 1413 	mov	_rx_ready,#0x00
                                   1414 ;	usb_hid.c:237: return;
      002FA1 22               [24] 1415 	ret
      002FA2                       1416 00102$:
                                   1417 ;	usb_hid.c:240: if (UIF_TRANSFER) {
      002FA2 20 D9 01         [24] 1418 	jb	_UIF_TRANSFER,00225$
      002FA5 22               [24] 1419 	ret
      002FA6                       1420 00225$:
                                   1421 ;	usb_hid.c:241: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
      002FA6 E5 D9            [12] 1422 	mov	a,_USB_INT_ST
      002FA8 54 30            [12] 1423 	anl	a,#0x30
      002FAA FF               [12] 1424 	mov	r7,a
                                   1425 ;	usb_hid.c:242: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
      002FAB E5 D9            [12] 1426 	mov	a,_USB_INT_ST
      002FAD 54 0F            [12] 1427 	anl	a,#0x0f
                                   1428 ;	usb_hid.c:244: if (endp == 0) { // Endpoint 0
      002FAF FD               [12] 1429 	mov	r5,a
      002FB0 60 03            [24] 1430 	jz	00226$
      002FB2 02 30 38         [24] 1431 	ljmp	00125$
      002FB5                       1432 00226$:
                                   1433 ;	usb_hid.c:245: if (token == UIS_TOKEN_SETUP) {
      002FB5 BF 30 06         [24] 1434 	cjne	r7,#0x30,00115$
                                   1435 ;	usb_hid.c:246: Handle_EP0_Setup();
      002FB8 12 2E 1F         [24] 1436 	lcall	_Handle_EP0_Setup
      002FBB 02 30 59         [24] 1437 	ljmp	00126$
      002FBE                       1438 00115$:
                                   1439 ;	usb_hid.c:247: } else if (token == UIS_TOKEN_IN) {
      002FBE BF 20 6F         [24] 1440 	cjne	r7,#0x20,00112$
                                   1441 ;	usb_hid.c:248: if (usb_dev_addr != 0 && USB_DEV_AD == 0) {
      002FC1 E5 22            [12] 1442 	mov	a,_usb_dev_addr
      002FC3 60 07            [24] 1443 	jz	00104$
      002FC5 E5 E3            [12] 1444 	mov	a,_USB_DEV_AD
      002FC7 70 03            [24] 1445 	jnz	00104$
                                   1446 ;	usb_hid.c:249: USB_DEV_AD = usb_dev_addr;
      002FC9 85 22 E3         [24] 1447 	mov	_USB_DEV_AD,_usb_dev_addr
      002FCC                       1448 00104$:
                                   1449 ;	usb_hid.c:251: if (setup_tx_len > 0) {
      002FCC E5 26            [12] 1450 	mov	a,_setup_tx_len
      002FCE 45 27            [12] 1451 	orl	a,(_setup_tx_len + 1)
      002FD0 60 56            [24] 1452 	jz	00107$
                                   1453 ;	usb_hid.c:252: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002FD2 AC 26            [24] 1454 	mov	r4,_setup_tx_len
      002FD4 AE 27            [24] 1455 	mov	r6,(_setup_tx_len + 1)
      002FD6 C3               [12] 1456 	clr	c
      002FD7 74 40            [12] 1457 	mov	a,#0x40
      002FD9 9C               [12] 1458 	subb	a,r4
      002FDA E4               [12] 1459 	clr	a
      002FDB 9E               [12] 1460 	subb	a,r6
      002FDC 50 04            [24] 1461 	jnc	00131$
                                   1462 ;	free result
      002FDE 7E 40            [12] 1463 	mov	r6,#0x40
      002FE0 80 04            [24] 1464 	sjmp	00132$
      002FE2                       1465 00131$:
      002FE2 AC 26            [24] 1466 	mov	r4,_setup_tx_len
      002FE4 8C 06            [24] 1467 	mov	ar6,r4
      002FE6                       1468 00132$:
                                   1469 ;	usb_hid.c:253: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002FE6 85 24 08         [24] 1470 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002FE9 85 25 09         [24] 1471 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002FEC 75 0A 80         [24] 1472 	mov	(___memcpy_PARM_2 + 2),#0x80
      002FEF 8E 0B            [24] 1473 	mov	___memcpy_PARM_3,r6
      002FF1 75 0C 00         [24] 1474 	mov	(___memcpy_PARM_3 + 1),#0x00
      002FF4 90 00 00         [24] 1475 	mov	dptr,#_Ep0Buffer
      002FF7 75 F0 00         [24] 1476 	mov	b, #0x00
      002FFA C0 06            [24] 1477 	push	ar6
      002FFC 12 35 13         [24] 1478 	lcall	___memcpy
      002FFF D0 06            [24] 1479 	pop	ar6
                                   1480 ;	usb_hid.c:254: setup_tx_ptr += send_len;
      003001 EE               [12] 1481 	mov	a,r6
      003002 25 24            [12] 1482 	add	a, _setup_tx_ptr
      003004 F5 24            [12] 1483 	mov	_setup_tx_ptr,a
      003006 E4               [12] 1484 	clr	a
      003007 35 25            [12] 1485 	addc	a, (_setup_tx_ptr + 1)
      003009 F5 25            [12] 1486 	mov	(_setup_tx_ptr + 1),a
                                   1487 ;	usb_hid.c:255: setup_tx_len -= send_len;
      00300B 8E 03            [24] 1488 	mov	ar3,r6
      00300D 7C 00            [12] 1489 	mov	r4,#0x00
      00300F A9 26            [24] 1490 	mov	r1,_setup_tx_len
      003011 AA 27            [24] 1491 	mov	r2,(_setup_tx_len + 1)
      003013 E9               [12] 1492 	mov	a,r1
      003014 C3               [12] 1493 	clr	c
      003015 9B               [12] 1494 	subb	a,r3
      003016 F9               [12] 1495 	mov	r1,a
      003017 EA               [12] 1496 	mov	a,r2
      003018 9C               [12] 1497 	subb	a,r4
      003019 FA               [12] 1498 	mov	r2,a
      00301A 89 26            [24] 1499 	mov	_setup_tx_len,r1
      00301C 8A 27            [24] 1500 	mov	(_setup_tx_len + 1),r2
                                   1501 ;	usb_hid.c:256: UEP0_T_LEN = send_len;
      00301E 8E DD            [24] 1502 	mov	_UEP0_T_LEN,r6
                                   1503 ;	usb_hid.c:257: UEP0_CTRL ^= bUEP_T_TOG;
      003020 63 DC 40         [24] 1504 	xrl	_UEP0_CTRL,#0x40
                                   1505 ;	usb_hid.c:258: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      003023 53 DC FC         [24] 1506 	anl	_UEP0_CTRL,#0xfc
      003026 80 31            [24] 1507 	sjmp	00126$
      003028                       1508 00107$:
                                   1509 ;	usb_hid.c:260: UEP0_T_LEN = 0;
      003028 75 DD 00         [24] 1510 	mov	_UEP0_T_LEN,#0x00
                                   1511 ;	usb_hid.c:261: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      00302B 75 DC 02         [24] 1512 	mov	_UEP0_CTRL,#0x02
      00302E 80 29            [24] 1513 	sjmp	00126$
      003030                       1514 00112$:
                                   1515 ;	usb_hid.c:263: } else if (token == UIS_TOKEN_OUT) {
      003030 EF               [12] 1516 	mov	a,r7
      003031 70 26            [24] 1517 	jnz	00126$
                                   1518 ;	usb_hid.c:264: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      003033 75 DC 02         [24] 1519 	mov	_UEP0_CTRL,#0x02
      003036 80 21            [24] 1520 	sjmp	00126$
      003038                       1521 00125$:
                                   1522 ;	usb_hid.c:266: } else if (endp == 1) { // Endpoint 1 (HID Data)
      003038 BD 01 1E         [24] 1523 	cjne	r5,#0x01,00126$
                                   1524 ;	usb_hid.c:267: if (token == UIS_TOKEN_OUT) {
      00303B EF               [12] 1525 	mov	a,r7
      00303C 70 0D            [24] 1526 	jnz	00120$
                                   1527 ;	usb_hid.c:268: rx_ready = 1;
      00303E 75 21 01         [24] 1528 	mov	_rx_ready,#0x01
                                   1529 ;	usb_hid.c:269: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_NAK;
      003041 74 F3            [12] 1530 	mov	a,#0xf3
      003043 55 D2            [12] 1531 	anl	a,_UEP1_CTRL
      003045 44 08            [12] 1532 	orl	a,#0x08
      003047 F5 D2            [12] 1533 	mov	_UEP1_CTRL,a
      003049 80 0E            [24] 1534 	sjmp	00126$
      00304B                       1535 00120$:
                                   1536 ;	usb_hid.c:270: } else if (token == UIS_TOKEN_IN) {
      00304B BF 20 0B         [24] 1537 	cjne	r7,#0x20,00126$
                                   1538 ;	usb_hid.c:271: UEP1_T_LEN = 0;
      00304E 75 D3 00         [24] 1539 	mov	_UEP1_T_LEN,#0x00
                                   1540 ;	usb_hid.c:272: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
      003051 74 FC            [12] 1541 	mov	a,#0xfc
      003053 55 D2            [12] 1542 	anl	a,_UEP1_CTRL
      003055 44 02            [12] 1543 	orl	a,#0x02
      003057 F5 D2            [12] 1544 	mov	_UEP1_CTRL,a
      003059                       1545 00126$:
                                   1546 ;	usb_hid.c:276: UIF_TRANSFER = 0; // Clear transfer flag
                                   1547 ;	assignBit
      003059 C2 D9            [12] 1548 	clr	_UIF_TRANSFER
                                   1549 ;	usb_hid.c:278: }
      00305B 22               [24] 1550 	ret
                                   1551 ;------------------------------------------------------------
                                   1552 ;Allocation info for local variables in function 'USB_Available'
                                   1553 ;------------------------------------------------------------
                                   1554 ;	usb_hid.c:280: uint8_t USB_Available(void) {
                                   1555 ;	-----------------------------------------
                                   1556 ;	 function USB_Available
                                   1557 ;	-----------------------------------------
      00305C                       1558 _USB_Available:
                                   1559 ;	usb_hid.c:281: return rx_ready;
      00305C 85 21 82         [24] 1560 	mov	dpl, _rx_ready
                                   1561 ;	usb_hid.c:282: }
      00305F 22               [24] 1562 	ret
                                   1563 ;------------------------------------------------------------
                                   1564 ;Allocation info for local variables in function 'USB_GetRxBuffer'
                                   1565 ;------------------------------------------------------------
                                   1566 ;	usb_hid.c:284: uint8_t *USB_GetRxBuffer(void) {
                                   1567 ;	-----------------------------------------
                                   1568 ;	 function USB_GetRxBuffer
                                   1569 ;	-----------------------------------------
      003060                       1570 _USB_GetRxBuffer:
                                   1571 ;	usb_hid.c:285: return &Ep1Buffer[0];
      003060 90 00 40         [24] 1572 	mov	dptr,#_Ep1Buffer
      003063 75 F0 00         [24] 1573 	mov	b, #0x00
                                   1574 ;	usb_hid.c:286: }
      003066 22               [24] 1575 	ret
                                   1576 ;------------------------------------------------------------
                                   1577 ;Allocation info for local variables in function 'USB_ReleaseRx'
                                   1578 ;------------------------------------------------------------
                                   1579 ;	usb_hid.c:288: void USB_ReleaseRx(void) {
                                   1580 ;	-----------------------------------------
                                   1581 ;	 function USB_ReleaseRx
                                   1582 ;	-----------------------------------------
      003067                       1583 _USB_ReleaseRx:
                                   1584 ;	usb_hid.c:289: rx_ready = 0;
      003067 75 21 00         [24] 1585 	mov	_rx_ready,#0x00
                                   1586 ;	usb_hid.c:290: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_ACK;
      00306A 53 D2 F3         [24] 1587 	anl	_UEP1_CTRL,#0xf3
                                   1588 ;	usb_hid.c:291: }
      00306D 22               [24] 1589 	ret
                                   1590 ;------------------------------------------------------------
                                   1591 ;Allocation info for local variables in function 'USB_SendReport'
                                   1592 ;------------------------------------------------------------
                                   1593 ;len           Allocated with name '_USB_SendReport_PARM_2'
                                   1594 ;buf           Allocated to registers r5 r6 r7 
                                   1595 ;------------------------------------------------------------
                                   1596 ;	usb_hid.c:293: void USB_SendReport(const uint8_t *buf, uint8_t len) {
                                   1597 ;	-----------------------------------------
                                   1598 ;	 function USB_SendReport
                                   1599 ;	-----------------------------------------
      00306E                       1600 _USB_SendReport:
      00306E AD 82            [24] 1601 	mov	r5, dpl
      003070 AE 83            [24] 1602 	mov	r6, dph
      003072 AF F0            [24] 1603 	mov	r7, b
                                   1604 ;	usb_hid.c:294: memcpy(&Ep1Buffer[64], buf, len);
      003074 8D 08            [24] 1605 	mov	___memcpy_PARM_2,r5
      003076 8E 09            [24] 1606 	mov	(___memcpy_PARM_2 + 1),r6
      003078 8F 0A            [24] 1607 	mov	(___memcpy_PARM_2 + 2),r7
      00307A 85 28 0B         [24] 1608 	mov	___memcpy_PARM_3,_USB_SendReport_PARM_2
      00307D 75 0C 00         [24] 1609 	mov	(___memcpy_PARM_3 + 1),#0x00
      003080 90 00 80         [24] 1610 	mov	dptr,#(_Ep1Buffer + 0x0040)
      003083 75 F0 00         [24] 1611 	mov	b, #0x00
      003086 12 35 13         [24] 1612 	lcall	___memcpy
                                   1613 ;	usb_hid.c:295: UEP1_T_LEN = len;
      003089 85 28 D3         [24] 1614 	mov	_UEP1_T_LEN,_USB_SendReport_PARM_2
                                   1615 ;	usb_hid.c:296: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      00308C 53 D2 FC         [24] 1616 	anl	_UEP1_CTRL,#0xfc
                                   1617 ;	usb_hid.c:297: }
      00308F 22               [24] 1618 	ret
                                   1619 ;------------------------------------------------------------
                                   1620 ;Allocation info for local variables in function 'USB_Shutdown'
                                   1621 ;------------------------------------------------------------
                                   1622 ;	usb_hid.c:299: void USB_Shutdown(void) {
                                   1623 ;	-----------------------------------------
                                   1624 ;	 function USB_Shutdown
                                   1625 ;	-----------------------------------------
      003090                       1626 _USB_Shutdown:
                                   1627 ;	usb_hid.c:300: USB_CTRL = 0x00;
      003090 75 E2 00         [24] 1628 	mov	_USB_CTRL,#0x00
                                   1629 ;	usb_hid.c:301: UDEV_CTRL = 0x00;
      003093 75 D1 00         [24] 1630 	mov	_UDEV_CTRL,#0x00
                                   1631 ;	usb_hid.c:302: }
      003096 22               [24] 1632 	ret
                                   1633 ;------------------------------------------------------------
                                   1634 ;Allocation info for local variables in function 'DelayMs'
                                   1635 ;------------------------------------------------------------
                                   1636 ;ms            Allocated to registers 
                                   1637 ;i             Allocated to registers r4 r5 
                                   1638 ;------------------------------------------------------------
                                   1639 ;	bootloader.c:31: static void DelayMs(uint16_t ms) {
                                   1640 ;	-----------------------------------------
                                   1641 ;	 function DelayMs
                                   1642 ;	-----------------------------------------
      003097                       1643 _DelayMs:
      003097 AE 82            [24] 1644 	mov	r6, dpl
      003099 AF 83            [24] 1645 	mov	r7, dph
                                   1646 ;	bootloader.c:32: while (ms--) {
      00309B                       1647 00102$:
      00309B 8E 04            [24] 1648 	mov	ar4,r6
      00309D 8F 05            [24] 1649 	mov	ar5,r7
      00309F 1E               [12] 1650 	dec	r6
      0030A0 BE FF 01         [24] 1651 	cjne	r6,#0xff,00139$
      0030A3 1F               [12] 1652 	dec	r7
      0030A4                       1653 00139$:
      0030A4 EC               [12] 1654 	mov	a,r4
      0030A5 4D               [12] 1655 	orl	a,r5
      0030A6 60 19            [24] 1656 	jz	00108$
                                   1657 ;	bootloader.c:33: for (uint16_t i = 0; i < 2400; i++) {
      0030A8 7C 00            [12] 1658 	mov	r4,#0x00
      0030AA 7D 00            [12] 1659 	mov	r5,#0x00
      0030AC                       1660 00106$:
      0030AC 8C 02            [24] 1661 	mov	ar2,r4
      0030AE 8D 03            [24] 1662 	mov	ar3,r5
      0030B0 C3               [12] 1663 	clr	c
      0030B1 EA               [12] 1664 	mov	a,r2
      0030B2 94 60            [12] 1665 	subb	a,#0x60
      0030B4 EB               [12] 1666 	mov	a,r3
      0030B5 94 09            [12] 1667 	subb	a,#0x09
      0030B7 50 E2            [24] 1668 	jnc	00102$
                                   1669 ;	bootloader.c:34: __asm nop __endasm;
      0030B9 00               [12] 1670 	nop	
                                   1671 ;	bootloader.c:33: for (uint16_t i = 0; i < 2400; i++) {
      0030BA 0C               [12] 1672 	inc	r4
      0030BB BC 00 EE         [24] 1673 	cjne	r4,#0x00,00106$
      0030BE 0D               [12] 1674 	inc	r5
      0030BF 80 EB            [24] 1675 	sjmp	00106$
      0030C1                       1676 00108$:
                                   1677 ;	bootloader.c:37: }
      0030C1 22               [24] 1678 	ret
                                   1679 ;------------------------------------------------------------
                                   1680 ;Allocation info for local variables in function 'JumpToApp'
                                   1681 ;------------------------------------------------------------
                                   1682 ;	bootloader.c:39: static void JumpToApp(void) {
                                   1683 ;	-----------------------------------------
                                   1684 ;	 function JumpToApp
                                   1685 ;	-----------------------------------------
      0030C2                       1686 _JumpToApp:
                                   1687 ;	bootloader.c:40: USB_Shutdown();
      0030C2 12 30 90         [24] 1688 	lcall	_USB_Shutdown
                                   1689 ;	bootloader.c:41: DelayMs(10);
      0030C5 90 00 0A         [24] 1690 	mov	dptr,#0x000a
      0030C8 12 30 97         [24] 1691 	lcall	_DelayMs
                                   1692 ;	bootloader.c:45: __endasm;
      0030CB 02 00 00         [24] 1693 	ljmp 0x0000
                                   1694 ;	bootloader.c:46: }
      0030CE 22               [24] 1695 	ret
                                   1696 ;------------------------------------------------------------
                                   1697 ;Allocation info for local variables in function 'ProcessPacket'
                                   1698 ;------------------------------------------------------------
                                   1699 ;rx            Allocated with name '_ProcessPacket_rx_10000_126'
                                   1700 ;cmd           Allocated with name '_ProcessPacket_cmd_10000_126'
                                   1701 ;seq           Allocated with name '_ProcessPacket_seq_10000_126'
                                   1702 ;addr          Allocated with name '_ProcessPacket_addr_10000_126'
                                   1703 ;len           Allocated with name '_ProcessPacket_len_10000_126'
                                   1704 ;erase_err     Allocated with name '_ProcessPacket_erase_err_40000_136'
                                   1705 ;page          Allocated to registers r0 r2 
                                   1706 ;end_page      Allocated with name '_ProcessPacket_end_page_40000_136'
                                   1707 ;err           Allocated with name '_ProcessPacket_err_40000_144'
                                   1708 ;i             Allocated with name '_ProcessPacket_i_50000_145'
                                   1709 ;word          Allocated to registers 
                                   1710 ;expected_crc  Allocated to registers r4 r7 
                                   1711 ;calc_crc      Allocated to registers r5 r6 
                                   1712 ;sloc0         Allocated with name '_ProcessPacket_sloc0_1_0'
                                   1713 ;sloc1         Allocated with name '_ProcessPacket_sloc1_1_0'
                                   1714 ;sloc2         Allocated with name '_ProcessPacket_sloc2_1_0'
                                   1715 ;------------------------------------------------------------
                                   1716 ;	bootloader.c:48: static void ProcessPacket(void) {
                                   1717 ;	-----------------------------------------
                                   1718 ;	 function ProcessPacket
                                   1719 ;	-----------------------------------------
      0030CF                       1720 _ProcessPacket:
                                   1721 ;	bootloader.c:49: uint8_t *rx = USB_GetRxBuffer();
      0030CF 12 30 60         [24] 1722 	lcall	_USB_GetRxBuffer
                                   1723 ;	bootloader.c:50: uint8_t cmd = rx[0];
      0030D2 85 82 2C         [24] 1724 	mov	_ProcessPacket_rx_10000_126,dpl
      0030D5 85 83 2D         [24] 1725 	mov	(_ProcessPacket_rx_10000_126 + 1),dph
      0030D8 85 F0 2E         [24] 1726 	mov	(_ProcessPacket_rx_10000_126 + 2),b
      0030DB 12 35 A2         [24] 1727 	lcall	__gptrget
      0030DE F5 2F            [12] 1728 	mov	_ProcessPacket_cmd_10000_126,a
                                   1729 ;	bootloader.c:51: uint8_t seq = rx[1];
      0030E0 74 01            [12] 1730 	mov	a,#0x01
      0030E2 25 2C            [12] 1731 	add	a, _ProcessPacket_rx_10000_126
      0030E4 F9               [12] 1732 	mov	r1,a
      0030E5 E4               [12] 1733 	clr	a
      0030E6 35 2D            [12] 1734 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      0030E8 FA               [12] 1735 	mov	r2,a
      0030E9 AB 2E            [24] 1736 	mov	r3,(_ProcessPacket_rx_10000_126 + 2)
      0030EB 89 82            [24] 1737 	mov	dpl,r1
      0030ED 8A 83            [24] 1738 	mov	dph,r2
      0030EF 8B F0            [24] 1739 	mov	b,r3
      0030F1 12 35 A2         [24] 1740 	lcall	__gptrget
      0030F4 F5 30            [12] 1741 	mov	_ProcessPacket_seq_10000_126,a
                                   1742 ;	bootloader.c:52: uint16_t addr = rx[2] | ((uint16_t)rx[3] << 8);
      0030F6 74 02            [12] 1743 	mov	a,#0x02
      0030F8 25 2C            [12] 1744 	add	a, _ProcessPacket_rx_10000_126
      0030FA F8               [12] 1745 	mov	r0,a
      0030FB E4               [12] 1746 	clr	a
      0030FC 35 2D            [12] 1747 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      0030FE FA               [12] 1748 	mov	r2,a
      0030FF AB 2E            [24] 1749 	mov	r3,(_ProcessPacket_rx_10000_126 + 2)
      003101 88 82            [24] 1750 	mov	dpl,r0
      003103 8A 83            [24] 1751 	mov	dph,r2
      003105 8B F0            [24] 1752 	mov	b,r3
      003107 12 35 A2         [24] 1753 	lcall	__gptrget
      00310A F5 39            [12] 1754 	mov	_ProcessPacket_sloc0_1_0,a
      00310C 74 03            [12] 1755 	mov	a,#0x03
      00310E 25 2C            [12] 1756 	add	a, _ProcessPacket_rx_10000_126
      003110 F5 3C            [12] 1757 	mov	_ProcessPacket_sloc2_1_0,a
      003112 E4               [12] 1758 	clr	a
      003113 35 2D            [12] 1759 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003115 F5 3D            [12] 1760 	mov	(_ProcessPacket_sloc2_1_0 + 1),a
      003117 85 2E 3E         [24] 1761 	mov	(_ProcessPacket_sloc2_1_0 + 2),(_ProcessPacket_rx_10000_126 + 2)
      00311A 85 3C 82         [24] 1762 	mov	dpl,_ProcessPacket_sloc2_1_0
      00311D 85 3D 83         [24] 1763 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      003120 85 3E F0         [24] 1764 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      003123 12 35 A2         [24] 1765 	lcall	__gptrget
      003126 F9               [12] 1766 	mov	r1,a
      003127 7D 00            [12] 1767 	mov	r5,#0x00
      003129 89 3B            [24] 1768 	mov	(_ProcessPacket_sloc1_1_0 + 1),r1
      00312B 8D 3A            [24] 1769 	mov	_ProcessPacket_sloc1_1_0,r5
      00312D A9 39            [24] 1770 	mov	r1,_ProcessPacket_sloc0_1_0
      00312F 89 31            [24] 1771 	mov	_ProcessPacket_addr_10000_126,r1
      003131 E5 3B            [12] 1772 	mov	a,(_ProcessPacket_sloc1_1_0 + 1)
      003133 4D               [12] 1773 	orl	a,r5
      003134 F5 32            [12] 1774 	mov	(_ProcessPacket_addr_10000_126 + 1),a
                                   1775 ;	bootloader.c:53: uint8_t len = rx[4];
      003136 74 04            [12] 1776 	mov	a,#0x04
      003138 25 2C            [12] 1777 	add	a, _ProcessPacket_rx_10000_126
      00313A F9               [12] 1778 	mov	r1,a
      00313B E4               [12] 1779 	clr	a
      00313C 35 2D            [12] 1780 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      00313E FD               [12] 1781 	mov	r5,a
      00313F AF 2E            [24] 1782 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      003141 89 82            [24] 1783 	mov	dpl,r1
      003143 8D 83            [24] 1784 	mov	dph,r5
      003145 8F F0            [24] 1785 	mov	b,r7
      003147 12 35 A2         [24] 1786 	lcall	__gptrget
      00314A F5 33            [12] 1787 	mov	_ProcessPacket_len_10000_126,a
                                   1788 ;	bootloader.c:55: memset(reply_buf, 0, 64);
      00314C 75 08 00         [24] 1789 	mov	_memset_PARM_2,#0x00
      00314F 75 09 40         [24] 1790 	mov	_memset_PARM_3,#0x40
      003152 75 0A 00         [24] 1791 	mov	(_memset_PARM_3 + 1),#0x00
      003155 90 00 00         [24] 1792 	mov	dptr,#_reply_buf
      003158 75 F0 00         [24] 1793 	mov	b, #0x00
      00315B C0 03            [24] 1794 	push	ar3
      00315D C0 02            [24] 1795 	push	ar2
      00315F C0 00            [24] 1796 	push	ar0
      003161 12 35 68         [24] 1797 	lcall	_memset
      003164 D0 00            [24] 1798 	pop	ar0
      003166 D0 02            [24] 1799 	pop	ar2
      003168 D0 03            [24] 1800 	pop	ar3
                                   1801 ;	bootloader.c:56: reply_buf[0] = cmd;
      00316A 90 00 00         [24] 1802 	mov	dptr,#_reply_buf
      00316D E5 2F            [12] 1803 	mov	a,_ProcessPacket_cmd_10000_126
      00316F F0               [24] 1804 	movx	@dptr,a
                                   1805 ;	bootloader.c:57: reply_buf[1] = seq;
      003170 90 00 01         [24] 1806 	mov	dptr,#(_reply_buf + 0x0001)
      003173 E5 30            [12] 1807 	mov	a,_ProcessPacket_seq_10000_126
      003175 F0               [24] 1808 	movx	@dptr,a
                                   1809 ;	bootloader.c:58: reply_buf[2] = rx[2];
      003176 88 82            [24] 1810 	mov	dpl,r0
      003178 8A 83            [24] 1811 	mov	dph,r2
      00317A 8B F0            [24] 1812 	mov	b,r3
      00317C 12 35 A2         [24] 1813 	lcall	__gptrget
      00317F F8               [12] 1814 	mov	r0,a
      003180 90 00 02         [24] 1815 	mov	dptr,#(_reply_buf + 0x0002)
      003183 F0               [24] 1816 	movx	@dptr,a
                                   1817 ;	bootloader.c:59: reply_buf[3] = rx[3];
      003184 85 3C 82         [24] 1818 	mov	dpl,_ProcessPacket_sloc2_1_0
      003187 85 3D 83         [24] 1819 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      00318A 85 3E F0         [24] 1820 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      00318D 12 35 A2         [24] 1821 	lcall	__gptrget
      003190 FE               [12] 1822 	mov	r6,a
      003191 90 00 03         [24] 1823 	mov	dptr,#(_reply_buf + 0x0003)
      003194 F0               [24] 1824 	movx	@dptr,a
                                   1825 ;	bootloader.c:60: reply_buf[59] = STATUS_OK;
      003195 90 00 3B         [24] 1826 	mov	dptr,#(_reply_buf + 0x003b)
      003198 E4               [12] 1827 	clr	a
      003199 F0               [24] 1828 	movx	@dptr,a
                                   1829 ;	bootloader.c:62: switch (cmd) {
      00319A E5 2F            [12] 1830 	mov	a,_ProcessPacket_cmd_10000_126
      00319C 24 F9            [12] 1831 	add	a,#0xff - 0x06
      00319E 50 03            [24] 1832 	jnc	00259$
      0031A0 02 34 0F         [24] 1833 	ljmp	00129$
      0031A3                       1834 00259$:
                                   1835 ;	free result
      0031A3 E5 2F            [12] 1836 	mov	a,_ProcessPacket_cmd_10000_126
      0031A5 75 F0 03         [24] 1837 	mov	b,#0x03
      0031A8 A4               [48] 1838 	mul	ab
      0031A9 90 31 AD         [24] 1839 	mov	dptr,#00260$
      0031AC 73               [24] 1840 	jmp	@a+dptr
      0031AD                       1841 00260$:
      0031AD 02 34 0F         [24] 1842 	ljmp	00129$
      0031B0 02 31 C2         [24] 1843 	ljmp	00101$
      0031B3 02 31 E2         [24] 1844 	ljmp	00102$
      0031B6 02 34 0F         [24] 1845 	ljmp	00129$
      0031B9 02 32 5F         [24] 1846 	ljmp	00109$
      0031BC 02 33 88         [24] 1847 	ljmp	00127$
      0031BF 02 33 F6         [24] 1848 	ljmp	00128$
                                   1849 ;	bootloader.c:63: case CMD_HELLO:
      0031C2                       1850 00101$:
                                   1851 ;	bootloader.c:64: reply_buf[4] = 0x52; // Chip ID: CH552
      0031C2 90 00 04         [24] 1852 	mov	dptr,#(_reply_buf + 0x0004)
      0031C5 74 52            [12] 1853 	mov	a,#0x52
      0031C7 F0               [24] 1854 	movx	@dptr,a
                                   1855 ;	bootloader.c:65: reply_buf[5] = 0x01; // Bootloader v1.0
      0031C8 90 00 05         [24] 1856 	mov	dptr,#(_reply_buf + 0x0005)
      0031CB 74 01            [12] 1857 	mov	a,#0x01
      0031CD F0               [24] 1858 	movx	@dptr,a
                                   1859 ;	bootloader.c:66: reply_buf[6] = (uint8_t)(USER_FLASH_END & 0xFF);
      0031CE 90 00 06         [24] 1860 	mov	dptr,#(_reply_buf + 0x0006)
      0031D1 74 FF            [12] 1861 	mov	a,#0xff
      0031D3 F0               [24] 1862 	movx	@dptr,a
                                   1863 ;	bootloader.c:67: reply_buf[7] = (uint8_t)((USER_FLASH_END >> 8) & 0xFF); // 11 KB usable
      0031D4 90 00 07         [24] 1864 	mov	dptr,#(_reply_buf + 0x0007)
      0031D7 74 2B            [12] 1865 	mov	a,#0x2b
      0031D9 F0               [24] 1866 	movx	@dptr,a
                                   1867 ;	bootloader.c:68: reply_buf[59] = STATUS_OK;
      0031DA 90 00 3B         [24] 1868 	mov	dptr,#(_reply_buf + 0x003b)
      0031DD E4               [12] 1869 	clr	a
      0031DE F0               [24] 1870 	movx	@dptr,a
                                   1871 ;	bootloader.c:69: break;
      0031DF 02 34 15         [24] 1872 	ljmp	00130$
                                   1873 ;	bootloader.c:71: case CMD_UNLOCK:
      0031E2                       1874 00102$:
                                   1875 ;	bootloader.c:72: if (rx[5] == 0x5A && rx[6] == 0xC3 && rx[7] == 0x3C && rx[8] == 0xA5) {
      0031E2 74 05            [12] 1876 	mov	a,#0x05
      0031E4 25 2C            [12] 1877 	add	a, _ProcessPacket_rx_10000_126
      0031E6 FC               [12] 1878 	mov	r4,a
      0031E7 E4               [12] 1879 	clr	a
      0031E8 35 2D            [12] 1880 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      0031EA FD               [12] 1881 	mov	r5,a
      0031EB AE 2E            [24] 1882 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      0031ED 8C 82            [24] 1883 	mov	dpl,r4
      0031EF 8D 83            [24] 1884 	mov	dph,r5
      0031F1 8E F0            [24] 1885 	mov	b,r6
      0031F3 12 35 A2         [24] 1886 	lcall	__gptrget
      0031F6 FC               [12] 1887 	mov	r4,a
      0031F7 BC 5A 59         [24] 1888 	cjne	r4,#0x5a,00104$
      0031FA 74 06            [12] 1889 	mov	a,#0x06
      0031FC 25 2C            [12] 1890 	add	a, _ProcessPacket_rx_10000_126
      0031FE FC               [12] 1891 	mov	r4,a
      0031FF E4               [12] 1892 	clr	a
      003200 35 2D            [12] 1893 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003202 FD               [12] 1894 	mov	r5,a
      003203 AE 2E            [24] 1895 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      003205 8C 82            [24] 1896 	mov	dpl,r4
      003207 8D 83            [24] 1897 	mov	dph,r5
      003209 8E F0            [24] 1898 	mov	b,r6
      00320B 12 35 A2         [24] 1899 	lcall	__gptrget
      00320E FC               [12] 1900 	mov	r4,a
      00320F BC C3 41         [24] 1901 	cjne	r4,#0xc3,00104$
      003212 74 07            [12] 1902 	mov	a,#0x07
      003214 25 2C            [12] 1903 	add	a, _ProcessPacket_rx_10000_126
      003216 FC               [12] 1904 	mov	r4,a
      003217 E4               [12] 1905 	clr	a
      003218 35 2D            [12] 1906 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      00321A FD               [12] 1907 	mov	r5,a
      00321B AE 2E            [24] 1908 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      00321D 8C 82            [24] 1909 	mov	dpl,r4
      00321F 8D 83            [24] 1910 	mov	dph,r5
      003221 8E F0            [24] 1911 	mov	b,r6
      003223 12 35 A2         [24] 1912 	lcall	__gptrget
      003226 FC               [12] 1913 	mov	r4,a
      003227 BC 3C 29         [24] 1914 	cjne	r4,#0x3c,00104$
      00322A 74 08            [12] 1915 	mov	a,#0x08
      00322C 25 2C            [12] 1916 	add	a, _ProcessPacket_rx_10000_126
      00322E FC               [12] 1917 	mov	r4,a
      00322F E4               [12] 1918 	clr	a
      003230 35 2D            [12] 1919 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003232 FD               [12] 1920 	mov	r5,a
      003233 AE 2E            [24] 1921 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      003235 8C 82            [24] 1922 	mov	dpl,r4
      003237 8D 83            [24] 1923 	mov	dph,r5
      003239 8E F0            [24] 1924 	mov	b,r6
      00323B 12 35 A2         [24] 1925 	lcall	__gptrget
      00323E FC               [12] 1926 	mov	r4,a
      00323F BC A5 11         [24] 1927 	cjne	r4,#0xa5,00104$
                                   1928 ;	bootloader.c:73: is_unlocked = 1;
      003242 75 29 01         [24] 1929 	mov	_is_unlocked,#0x01
                                   1930 ;	bootloader.c:74: last_erased_page = 0xFFFF; // Reset page erase tracking for new session
      003245 75 2A FF         [24] 1931 	mov	_last_erased_page,#0xff
      003248 75 2B FF         [24] 1932 	mov	(_last_erased_page + 1),#0xff
                                   1933 ;	bootloader.c:75: reply_buf[59] = STATUS_OK;
      00324B 90 00 3B         [24] 1934 	mov	dptr,#(_reply_buf + 0x003b)
      00324E E4               [12] 1935 	clr	a
      00324F F0               [24] 1936 	movx	@dptr,a
      003250 02 34 15         [24] 1937 	ljmp	00130$
      003253                       1938 00104$:
                                   1939 ;	bootloader.c:77: is_unlocked = 0;
      003253 75 29 00         [24] 1940 	mov	_is_unlocked,#0x00
                                   1941 ;	bootloader.c:78: reply_buf[59] = STATUS_LOCKED;
      003256 90 00 3B         [24] 1942 	mov	dptr,#(_reply_buf + 0x003b)
      003259 74 02            [12] 1943 	mov	a,#0x02
      00325B F0               [24] 1944 	movx	@dptr,a
                                   1945 ;	bootloader.c:80: break;
      00325C 02 34 15         [24] 1946 	ljmp	00130$
                                   1947 ;	bootloader.c:82: case CMD_WRITE_BLOCK:
      00325F                       1948 00109$:
                                   1949 ;	bootloader.c:83: if (!is_unlocked) {
      00325F E5 29            [12] 1950 	mov	a,_is_unlocked
      003261 70 09            [24] 1951 	jnz	00111$
                                   1952 ;	bootloader.c:84: reply_buf[59] = STATUS_LOCKED;
      003263 90 00 3B         [24] 1953 	mov	dptr,#(_reply_buf + 0x003b)
      003266 74 02            [12] 1954 	mov	a,#0x02
      003268 F0               [24] 1955 	movx	@dptr,a
                                   1956 ;	bootloader.c:85: break;
      003269 02 34 15         [24] 1957 	ljmp	00130$
      00326C                       1958 00111$:
                                   1959 ;	bootloader.c:88: if (addr + len > BOOTLOADER_START) {
      00326C AD 33            [24] 1960 	mov	r5,_ProcessPacket_len_10000_126
      00326E 7E 00            [12] 1961 	mov	r6,#0x00
      003270 A9 31            [24] 1962 	mov	r1,_ProcessPacket_addr_10000_126
      003272 AC 32            [24] 1963 	mov	r4,(_ProcessPacket_addr_10000_126 + 1)
      003274 ED               [12] 1964 	mov	a,r5
      003275 29               [12] 1965 	add	a, r1
      003276 FA               [12] 1966 	mov	r2,a
      003277 EE               [12] 1967 	mov	a,r6
      003278 3C               [12] 1968 	addc	a, r4
      003279 FB               [12] 1969 	mov	r3,a
      00327A C3               [12] 1970 	clr	c
      00327B E4               [12] 1971 	clr	a
      00327C 9A               [12] 1972 	subb	a,r2
      00327D 74 2C            [12] 1973 	mov	a,#0x2c
      00327F 9B               [12] 1974 	subb	a,r3
      003280 50 09            [24] 1975 	jnc	00113$
                                   1976 ;	free result
                                   1977 ;	bootloader.c:89: reply_buf[59] = STATUS_OOB; // Protect bootloader
      003282 90 00 3B         [24] 1978 	mov	dptr,#(_reply_buf + 0x003b)
      003285 74 03            [12] 1979 	mov	a,#0x03
      003287 F0               [24] 1980 	movx	@dptr,a
                                   1981 ;	bootloader.c:90: break;
      003288 02 34 15         [24] 1982 	ljmp	00130$
      00328B                       1983 00113$:
                                   1984 ;	bootloader.c:95: uint8_t erase_err = 0;
                                   1985 ;	bootloader.c:96: uint16_t page = addr & ~0x03FF;
      00328B E4               [12] 1986 	clr	a
      00328C F5 34            [12] 1987 	mov	_ProcessPacket_erase_err_40000_136,a
      00328E F8               [12] 1988 	mov	r0,a
      00328F 74 FC            [12] 1989 	mov	a,#0xfc
      003291 5C               [12] 1990 	anl	a,r4
      003292 FA               [12] 1991 	mov	r2,a
                                   1992 ;	bootloader.c:97: uint16_t end_page = (addr + len - 1) & ~0x03FF;
      003293 ED               [12] 1993 	mov	a,r5
      003294 29               [12] 1994 	add	a, r1
      003295 FD               [12] 1995 	mov	r5,a
      003296 EE               [12] 1996 	mov	a,r6
      003297 3C               [12] 1997 	addc	a, r4
      003298 FE               [12] 1998 	mov	r6,a
      003299 1D               [12] 1999 	dec	r5
      00329A BD FF 01         [24] 2000 	cjne	r5,#0xff,00271$
      00329D 1E               [12] 2001 	dec	r6
      00329E                       2002 00271$:
      00329E 7D 00            [12] 2003 	mov	r5,#0x00
      0032A0 53 06 FC         [24] 2004 	anl	ar6,#0xfc
      0032A3 8D 35            [24] 2005 	mov	_ProcessPacket_end_page_40000_136,r5
      0032A5 8E 36            [24] 2006 	mov	(_ProcessPacket_end_page_40000_136 + 1),r6
                                   2007 ;	bootloader.c:98: while (page <= end_page) {
      0032A7                       2008 00119$:
      0032A7 C3               [12] 2009 	clr	c
      0032A8 E5 35            [12] 2010 	mov	a,_ProcessPacket_end_page_40000_136
      0032AA 98               [12] 2011 	subb	a,r0
      0032AB E5 36            [12] 2012 	mov	a,(_ProcessPacket_end_page_40000_136 + 1)
      0032AD 9A               [12] 2013 	subb	a,r2
      0032AE 40 47            [24] 2014 	jc	00121$
                                   2015 ;	free result
                                   2016 ;	bootloader.c:99: if (last_erased_page == 0xFFFF || page > last_erased_page) {
      0032B0 AB 2A            [24] 2017 	mov	r3,_last_erased_page
      0032B2 AE 2B            [24] 2018 	mov	r6,(_last_erased_page + 1)
      0032B4 BB FF 05         [24] 2019 	cjne	r3,#0xff,00273$
      0032B7 BE FF 02         [24] 2020 	cjne	r6,#0xff,00273$
      0032BA 80 09            [24] 2021 	sjmp	00116$
      0032BC                       2022 00273$:
      0032BC C3               [12] 2023 	clr	c
      0032BD E5 2A            [12] 2024 	mov	a,_last_erased_page
      0032BF 98               [12] 2025 	subb	a,r0
      0032C0 E5 2B            [12] 2026 	mov	a,(_last_erased_page + 1)
      0032C2 9A               [12] 2027 	subb	a,r2
      0032C3 50 24            [24] 2028 	jnc	00117$
                                   2029 ;	free result
      0032C5                       2030 00116$:
                                   2031 ;	bootloader.c:100: if (IAP_ErasePage(page) != 0) {
      0032C5 88 82            [24] 2032 	mov	dpl, r0
      0032C7 8A 83            [24] 2033 	mov	dph, r2
      0032C9 C0 04            [24] 2034 	push	ar4
      0032CB C0 02            [24] 2035 	push	ar2
      0032CD C0 01            [24] 2036 	push	ar1
      0032CF C0 00            [24] 2037 	push	ar0
      0032D1 12 2C C4         [24] 2038 	lcall	_IAP_ErasePage
      0032D4 E5 82            [12] 2039 	mov	a, dpl
      0032D6 D0 00            [24] 2040 	pop	ar0
      0032D8 D0 01            [24] 2041 	pop	ar1
      0032DA D0 02            [24] 2042 	pop	ar2
      0032DC D0 04            [24] 2043 	pop	ar4
      0032DE 60 05            [24] 2044 	jz	00115$
                                   2045 ;	bootloader.c:101: erase_err = 1;
      0032E0 75 34 01         [24] 2046 	mov	_ProcessPacket_erase_err_40000_136,#0x01
                                   2047 ;	bootloader.c:102: break;
      0032E3 80 12            [24] 2048 	sjmp	00121$
      0032E5                       2049 00115$:
                                   2050 ;	bootloader.c:104: last_erased_page = page;
      0032E5 88 2A            [24] 2051 	mov	_last_erased_page,r0
      0032E7 8A 2B            [24] 2052 	mov	(_last_erased_page + 1),r2
      0032E9                       2053 00117$:
                                   2054 ;	bootloader.c:106: page += 0x0400;
      0032E9 88 05            [24] 2055 	mov	ar5,r0
      0032EB 8A 06            [24] 2056 	mov	ar6,r2
      0032ED 74 04            [12] 2057 	mov	a,#0x04
      0032EF 2E               [12] 2058 	add	a, r6
      0032F0 FE               [12] 2059 	mov	r6,a
      0032F1 8D 00            [24] 2060 	mov	ar0,r5
      0032F3 8E 02            [24] 2061 	mov	ar2,r6
      0032F5 80 B0            [24] 2062 	sjmp	00119$
      0032F7                       2063 00121$:
                                   2064 ;	bootloader.c:108: if (erase_err) {
      0032F7 E5 34            [12] 2065 	mov	a,_ProcessPacket_erase_err_40000_136
      0032F9 60 09            [24] 2066 	jz	00123$
                                   2067 ;	bootloader.c:109: reply_buf[59] = STATUS_WRITE_ERR;
      0032FB 90 00 3B         [24] 2068 	mov	dptr,#(_reply_buf + 0x003b)
      0032FE 74 04            [12] 2069 	mov	a,#0x04
      003300 F0               [24] 2070 	movx	@dptr,a
                                   2071 ;	bootloader.c:110: break;
      003301 02 34 15         [24] 2072 	ljmp	00130$
      003304                       2073 00123$:
                                   2074 ;	bootloader.c:116: uint8_t err = 0;
      003304 75 37 00         [24] 2075 	mov	_ProcessPacket_err_40000_144,#0x00
                                   2076 ;	bootloader.c:117: for (uint8_t i = 0; i < len; i += 2) {
      003307 75 38 00         [24] 2077 	mov	_ProcessPacket_i_50000_145,#0x00
      00330A                       2078 00132$:
      00330A C3               [12] 2079 	clr	c
      00330B E5 38            [12] 2080 	mov	a,_ProcessPacket_i_50000_145
      00330D 95 33            [12] 2081 	subb	a,_ProcessPacket_len_10000_126
      00330F 50 6A            [24] 2082 	jnc	00126$
                                   2083 ;	bootloader.c:118: uint16_t word = rx[5 + i] | ((uint16_t)rx[6 + i] << 8);
      003311 AA 38            [24] 2084 	mov	r2,_ProcessPacket_i_50000_145
      003313 7B 00            [12] 2085 	mov	r3,#0x00
      003315 74 05            [12] 2086 	mov	a,#0x05
      003317 2A               [12] 2087 	add	a, r2
      003318 F8               [12] 2088 	mov	r0,a
      003319 E4               [12] 2089 	clr	a
      00331A 3B               [12] 2090 	addc	a, r3
      00331B FE               [12] 2091 	mov	r6,a
      00331C E8               [12] 2092 	mov	a,r0
      00331D 25 2C            [12] 2093 	add	a, _ProcessPacket_rx_10000_126
      00331F F8               [12] 2094 	mov	r0,a
      003320 EE               [12] 2095 	mov	a,r6
      003321 35 2D            [12] 2096 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003323 FE               [12] 2097 	mov	r6,a
      003324 AF 2E            [24] 2098 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      003326 88 82            [24] 2099 	mov	dpl,r0
      003328 8E 83            [24] 2100 	mov	dph,r6
      00332A 8F F0            [24] 2101 	mov	b,r7
      00332C 12 35 A2         [24] 2102 	lcall	__gptrget
      00332F F8               [12] 2103 	mov	r0,a
      003330 74 06            [12] 2104 	mov	a,#0x06
      003332 2A               [12] 2105 	add	a, r2
      003333 FE               [12] 2106 	mov	r6,a
      003334 E4               [12] 2107 	clr	a
      003335 3B               [12] 2108 	addc	a, r3
      003336 FF               [12] 2109 	mov	r7,a
      003337 EE               [12] 2110 	mov	a,r6
      003338 25 2C            [12] 2111 	add	a, _ProcessPacket_rx_10000_126
      00333A FE               [12] 2112 	mov	r6,a
      00333B EF               [12] 2113 	mov	a,r7
      00333C 35 2D            [12] 2114 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      00333E FD               [12] 2115 	mov	r5,a
      00333F AF 2E            [24] 2116 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      003341 8E 82            [24] 2117 	mov	dpl,r6
      003343 8D 83            [24] 2118 	mov	dph,r5
      003345 8F F0            [24] 2119 	mov	b,r7
      003347 12 35 A2         [24] 2120 	lcall	__gptrget
      00334A FF               [12] 2121 	mov	r7,a
      00334B E4               [12] 2122 	clr	a
      00334C FD               [12] 2123 	mov	r5,a
      00334D 48               [12] 2124 	orl	a,r0
      00334E F5 08            [12] 2125 	mov	_IAP_WriteWord_PARM_2,a
      003350 EF               [12] 2126 	mov	a,r7
      003351 4D               [12] 2127 	orl	a,r5
      003352 F5 09            [12] 2128 	mov	(_IAP_WriteWord_PARM_2 + 1),a
                                   2129 ;	bootloader.c:119: if (IAP_WriteWord(addr + i, word) != 0) {
      003354 EA               [12] 2130 	mov	a,r2
      003355 29               [12] 2131 	add	a, r1
      003356 FA               [12] 2132 	mov	r2,a
      003357 EB               [12] 2133 	mov	a,r3
      003358 3C               [12] 2134 	addc	a, r4
      003359 FB               [12] 2135 	mov	r3,a
      00335A 8A 82            [24] 2136 	mov	dpl,r2
      00335C 8B 83            [24] 2137 	mov	dph,r3
      00335E C0 04            [24] 2138 	push	ar4
      003360 C0 01            [24] 2139 	push	ar1
      003362 12 2D 0E         [24] 2140 	lcall	_IAP_WriteWord
      003365 E5 82            [12] 2141 	mov	a, dpl
      003367 D0 01            [24] 2142 	pop	ar1
      003369 D0 04            [24] 2143 	pop	ar4
      00336B 60 05            [24] 2144 	jz	00133$
                                   2145 ;	bootloader.c:120: err = 1;
      00336D 75 37 01         [24] 2146 	mov	_ProcessPacket_err_40000_144,#0x01
                                   2147 ;	bootloader.c:121: break;
      003370 80 09            [24] 2148 	sjmp	00126$
      003372                       2149 00133$:
                                   2150 ;	bootloader.c:117: for (uint8_t i = 0; i < len; i += 2) {
      003372 AD 38            [24] 2151 	mov	r5,_ProcessPacket_i_50000_145
      003374 74 02            [12] 2152 	mov	a,#0x02
      003376 2D               [12] 2153 	add	a, r5
      003377 F5 38            [12] 2154 	mov	_ProcessPacket_i_50000_145,a
      003379 80 8F            [24] 2155 	sjmp	00132$
      00337B                       2156 00126$:
                                   2157 ;	bootloader.c:124: reply_buf[59] = err ? STATUS_WRITE_ERR : STATUS_OK;
      00337B E5 37            [12] 2158 	mov	a,_ProcessPacket_err_40000_144
      00337D 60 02            [24] 2159 	jz	00136$
      00337F 74 04            [12] 2160 	mov	a,#0x04
      003381                       2161 00136$:
      003381 90 00 3B         [24] 2162 	mov	dptr,#(_reply_buf + 0x003b)
      003384 F0               [24] 2163 	movx	@dptr,a
                                   2164 ;	bootloader.c:126: break;
      003385 02 34 15         [24] 2165 	ljmp	00130$
                                   2166 ;	bootloader.c:128: case CMD_VERIFY_CRC:
      003388                       2167 00127$:
                                   2168 ;	bootloader.c:130: uint16_t expected_crc = rx[5] | ((uint16_t)rx[6] << 8);
      003388 74 05            [12] 2169 	mov	a,#0x05
      00338A 25 2C            [12] 2170 	add	a, _ProcessPacket_rx_10000_126
      00338C FD               [12] 2171 	mov	r5,a
      00338D E4               [12] 2172 	clr	a
      00338E 35 2D            [12] 2173 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003390 FE               [12] 2174 	mov	r6,a
      003391 AF 2E            [24] 2175 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      003393 8D 82            [24] 2176 	mov	dpl,r5
      003395 8E 83            [24] 2177 	mov	dph,r6
      003397 8F F0            [24] 2178 	mov	b,r7
      003399 12 35 A2         [24] 2179 	lcall	__gptrget
      00339C FD               [12] 2180 	mov	r5,a
      00339D 74 06            [12] 2181 	mov	a,#0x06
      00339F 25 2C            [12] 2182 	add	a, _ProcessPacket_rx_10000_126
      0033A1 FC               [12] 2183 	mov	r4,a
      0033A2 E4               [12] 2184 	clr	a
      0033A3 35 2D            [12] 2185 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      0033A5 FE               [12] 2186 	mov	r6,a
      0033A6 AF 2E            [24] 2187 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      0033A8 8C 82            [24] 2188 	mov	dpl,r4
      0033AA 8E 83            [24] 2189 	mov	dph,r6
      0033AC 8F F0            [24] 2190 	mov	b,r7
      0033AE 12 35 A2         [24] 2191 	lcall	__gptrget
      0033B1 FF               [12] 2192 	mov	r7,a
      0033B2 E4               [12] 2193 	clr	a
      0033B3 FC               [12] 2194 	mov	r4,a
      0033B4 FE               [12] 2195 	mov	r6,a
      0033B5 ED               [12] 2196 	mov	a,r5
      0033B6 42 04            [12] 2197 	orl	ar4,a
      0033B8 EE               [12] 2198 	mov	a,r6
      0033B9 42 07            [12] 2199 	orl	ar7,a
                                   2200 ;	bootloader.c:131: uint16_t calc_crc = IAP_CalculateCRC16(0x0000, addr);
      0033BB 85 31 08         [24] 2201 	mov	_IAP_CalculateCRC16_PARM_2,_ProcessPacket_addr_10000_126
      0033BE 85 32 09         [24] 2202 	mov	(_IAP_CalculateCRC16_PARM_2 + 1),(_ProcessPacket_addr_10000_126 + 1)
      0033C1 90 00 00         [24] 2203 	mov	dptr,#0x0000
      0033C4 C0 07            [24] 2204 	push	ar7
      0033C6 C0 04            [24] 2205 	push	ar4
      0033C8 12 2D 79         [24] 2206 	lcall	_IAP_CalculateCRC16
      0033CB AD 82            [24] 2207 	mov	r5, dpl
      0033CD AE 83            [24] 2208 	mov	r6, dph
      0033CF D0 04            [24] 2209 	pop	ar4
      0033D1 D0 07            [24] 2210 	pop	ar7
                                   2211 ;	bootloader.c:132: reply_buf[4] = (uint8_t)(calc_crc & 0xFF);
      0033D3 8D 03            [24] 2212 	mov	ar3,r5
      0033D5 90 00 04         [24] 2213 	mov	dptr,#(_reply_buf + 0x0004)
      0033D8 EB               [12] 2214 	mov	a,r3
      0033D9 F0               [24] 2215 	movx	@dptr,a
                                   2216 ;	bootloader.c:133: reply_buf[5] = (uint8_t)((calc_crc >> 8) & 0xFF);
      0033DA 8E 03            [24] 2217 	mov	ar3,r6
      0033DC 90 00 05         [24] 2218 	mov	dptr,#(_reply_buf + 0x0005)
      0033DF EB               [12] 2219 	mov	a,r3
      0033E0 F0               [24] 2220 	movx	@dptr,a
                                   2221 ;	bootloader.c:134: reply_buf[59] = (calc_crc == expected_crc) ? STATUS_OK : STATUS_BAD_CRC;
      0033E1 ED               [12] 2222 	mov	a,r5
      0033E2 B5 04 08         [24] 2223 	cjne	a,ar4,00138$
      0033E5 EE               [12] 2224 	mov	a,r6
      0033E6 B5 07 04         [24] 2225 	cjne	a,ar7,00138$
      0033E9 7F 00            [12] 2226 	mov	r7,#0x00
      0033EB 80 02            [24] 2227 	sjmp	00139$
      0033ED                       2228 00138$:
      0033ED 7F 01            [12] 2229 	mov	r7,#0x01
      0033EF                       2230 00139$:
      0033EF 90 00 3B         [24] 2231 	mov	dptr,#(_reply_buf + 0x003b)
      0033F2 EF               [12] 2232 	mov	a,r7
      0033F3 F0               [24] 2233 	movx	@dptr,a
                                   2234 ;	bootloader.c:136: break;
                                   2235 ;	bootloader.c:138: case CMD_REBOOT:
      0033F4 80 1F            [24] 2236 	sjmp	00130$
      0033F6                       2237 00128$:
                                   2238 ;	bootloader.c:139: reply_buf[59] = STATUS_OK;
      0033F6 90 00 3B         [24] 2239 	mov	dptr,#(_reply_buf + 0x003b)
      0033F9 E4               [12] 2240 	clr	a
      0033FA F0               [24] 2241 	movx	@dptr,a
                                   2242 ;	bootloader.c:140: USB_SendReport(reply_buf, 64);
      0033FB 75 28 40         [24] 2243 	mov	_USB_SendReport_PARM_2,#0x40
      0033FE 90 00 00         [24] 2244 	mov	dptr,#_reply_buf
      003401 F5 F0            [12] 2245 	mov	b,a
      003403 12 30 6E         [24] 2246 	lcall	_USB_SendReport
                                   2247 ;	bootloader.c:141: DelayMs(50);
      003406 90 00 32         [24] 2248 	mov	dptr,#0x0032
      003409 12 30 97         [24] 2249 	lcall	_DelayMs
                                   2250 ;	bootloader.c:142: JumpToApp();
                                   2251 ;	bootloader.c:143: return;
                                   2252 ;	bootloader.c:145: default:
      00340C 02 30 C2         [24] 2253 	ljmp	_JumpToApp
      00340F                       2254 00129$:
                                   2255 ;	bootloader.c:146: reply_buf[59] = STATUS_UNKNOWN;
      00340F 90 00 3B         [24] 2256 	mov	dptr,#(_reply_buf + 0x003b)
      003412 74 FF            [12] 2257 	mov	a,#0xff
      003414 F0               [24] 2258 	movx	@dptr,a
                                   2259 ;	bootloader.c:148: }
      003415                       2260 00130$:
                                   2261 ;	bootloader.c:150: USB_SendReport(reply_buf, 64);
      003415 75 28 40         [24] 2262 	mov	_USB_SendReport_PARM_2,#0x40
      003418 90 00 00         [24] 2263 	mov	dptr,#_reply_buf
      00341B 75 F0 00         [24] 2264 	mov	b, #0x00
      00341E 12 30 6E         [24] 2265 	lcall	_USB_SendReport
                                   2266 ;	bootloader.c:151: USB_ReleaseRx();
                                   2267 ;	bootloader.c:152: }
      003421 02 30 67         [24] 2268 	ljmp	_USB_ReleaseRx
                                   2269 ;------------------------------------------------------------
                                   2270 ;Allocation info for local variables in function 'main'
                                   2271 ;------------------------------------------------------------
                                   2272 ;button_pressed Allocated to registers r7 
                                   2273 ;first_word    Allocated to registers r5 r6 
                                   2274 ;vec_word      Allocated to registers r3 r4 
                                   2275 ;is_blank      Allocated to registers r6 
                                   2276 ;timeout       Allocated to registers 
                                   2277 ;stay_in_bootloader Allocated to registers r7 
                                   2278 ;------------------------------------------------------------
                                   2279 ;	bootloader.c:154: void main(void) {
                                   2280 ;	-----------------------------------------
                                   2281 ;	 function main
                                   2282 ;	-----------------------------------------
      003424                       2283 _main:
                                   2284 ;	bootloader.c:156: P3_MOD_OC &= ~(1 << BOOT_PIN_BIT); // Quasi-bidirectional / pull-up mode
      003424 53 96 FB         [24] 2285 	anl	_P3_MOD_OC,#0xfb
                                   2286 ;	bootloader.c:157: P3_DIR_PU |=  (1 << BOOT_PIN_BIT); // Enable pullup
      003427 43 97 04         [24] 2287 	orl	_P3_DIR_PU,#0x04
                                   2288 ;	bootloader.c:158: P3_2 = 1; // High impedance input read
                                   2289 ;	assignBit
      00342A D2 B2            [12] 2290 	setb	_P3_2
                                   2291 ;	bootloader.c:161: P1_MOD_OC &= ~(1 << 5);
      00342C 53 92 DF         [24] 2292 	anl	_P1_MOD_OC,#0xdf
                                   2293 ;	bootloader.c:162: P1_DIR_PU |=  (1 << 5);
      00342F 43 93 20         [24] 2294 	orl	_P1_DIR_PU,#0x20
                                   2295 ;	bootloader.c:163: P1_5 = 1;
                                   2296 ;	assignBit
      003432 D2 95            [12] 2297 	setb	_P1_5
                                   2298 ;	bootloader.c:166: uint8_t button_pressed = (P3_2 == 0) || (P1_5 == 0);
      003434 30 B2 07         [24] 2299 	jnb	_P3_2,00113$
      003437 30 95 04         [24] 2300 	jnb	_P1_5,00113$
                                   2301 ;	assignBit
      00343A C2 00            [12] 2302 	clr	_main_sloc0_1_0
      00343C 80 02            [24] 2303 	sjmp	00114$
      00343E                       2304 00113$:
                                   2305 ;	assignBit
      00343E D2 00            [12] 2306 	setb	_main_sloc0_1_0
      003440                       2307 00114$:
      003440 A2 00            [12] 2308 	mov	c,_main_sloc0_1_0
      003442 E4               [12] 2309 	clr	a
      003443 33               [12] 2310 	rlc	a
      003444 FF               [12] 2311 	mov	r7,a
                                   2312 ;	bootloader.c:169: uint16_t first_word = IAP_ReadWord(0x0000);
      003445 90 00 00         [24] 2313 	mov	dptr,#0x0000
      003448 C0 07            [24] 2314 	push	ar7
      00344A 12 2D 5E         [24] 2315 	lcall	_IAP_ReadWord
      00344D AD 82            [24] 2316 	mov	r5, dpl
      00344F AE 83            [24] 2317 	mov	r6, dph
                                   2318 ;	bootloader.c:170: uint16_t vec_word   = IAP_ReadWord(0x0008);
      003451 90 00 08         [24] 2319 	mov	dptr,#0x0008
      003454 C0 06            [24] 2320 	push	ar6
      003456 C0 05            [24] 2321 	push	ar5
      003458 12 2D 5E         [24] 2322 	lcall	_IAP_ReadWord
      00345B AB 82            [24] 2323 	mov	r3, dpl
      00345D AC 83            [24] 2324 	mov	r4, dph
      00345F D0 05            [24] 2325 	pop	ar5
      003461 D0 06            [24] 2326 	pop	ar6
      003463 D0 07            [24] 2327 	pop	ar7
                                   2328 ;	bootloader.c:171: uint8_t is_blank = (first_word == 0xFFFF) || (vec_word == 0xFFFF);
      003465 BD FF 05         [24] 2329 	cjne	r5,#0xff,00193$
      003468 BE FF 02         [24] 2330 	cjne	r6,#0xff,00193$
      00346B 80 0C            [24] 2331 	sjmp	00116$
      00346D                       2332 00193$:
      00346D BB FF 05         [24] 2333 	cjne	r3,#0xff,00194$
      003470 BC FF 02         [24] 2334 	cjne	r4,#0xff,00194$
      003473 80 04            [24] 2335 	sjmp	00116$
      003475                       2336 00194$:
                                   2337 ;	assignBit
      003475 C2 00            [12] 2338 	clr	_main_sloc0_1_0
      003477 80 02            [24] 2339 	sjmp	00117$
      003479                       2340 00116$:
                                   2341 ;	assignBit
      003479 D2 00            [12] 2342 	setb	_main_sloc0_1_0
      00347B                       2343 00117$:
      00347B A2 00            [12] 2344 	mov	c,_main_sloc0_1_0
      00347D E4               [12] 2345 	clr	a
      00347E 33               [12] 2346 	rlc	a
      00347F FE               [12] 2347 	mov	r6,a
                                   2348 ;	bootloader.c:174: USB_Init();
      003480 C0 07            [24] 2349 	push	ar7
      003482 C0 06            [24] 2350 	push	ar6
      003484 12 2D DC         [24] 2351 	lcall	_USB_Init
      003487 D0 06            [24] 2352 	pop	ar6
      003489 D0 07            [24] 2353 	pop	ar7
                                   2354 ;	bootloader.c:178: uint8_t stay_in_bootloader = button_pressed || is_blank;
      00348B EF               [12] 2355 	mov	a,r7
      00348C 70 07            [24] 2356 	jnz	00119$
      00348E EE               [12] 2357 	mov	a,r6
      00348F 70 04            [24] 2358 	jnz	00119$
                                   2359 ;	assignBit
      003491 C2 00            [12] 2360 	clr	_main_sloc0_1_0
      003493 80 02            [24] 2361 	sjmp	00120$
      003495                       2362 00119$:
                                   2363 ;	assignBit
      003495 D2 00            [12] 2364 	setb	_main_sloc0_1_0
      003497                       2365 00120$:
      003497 A2 00            [12] 2366 	mov	c,_main_sloc0_1_0
      003499 E4               [12] 2367 	clr	a
      00349A 33               [12] 2368 	rlc	a
      00349B FF               [12] 2369 	mov	r7,a
                                   2370 ;	bootloader.c:180: while (1) {
      00349C 7B 00            [12] 2371 	mov	r3,#0x00
      00349E 7C 00            [12] 2372 	mov	r4,#0x00
      0034A0 7D 00            [12] 2373 	mov	r5,#0x00
      0034A2 7E 00            [12] 2374 	mov	r6,#0x00
      0034A4                       2375 00108$:
                                   2376 ;	bootloader.c:181: USB_Process();
      0034A4 C0 07            [24] 2377 	push	ar7
      0034A6 C0 06            [24] 2378 	push	ar6
      0034A8 C0 05            [24] 2379 	push	ar5
      0034AA C0 04            [24] 2380 	push	ar4
      0034AC C0 03            [24] 2381 	push	ar3
      0034AE 12 2F 90         [24] 2382 	lcall	_USB_Process
                                   2383 ;	bootloader.c:183: if (USB_Available()) {
      0034B1 12 30 5C         [24] 2384 	lcall	_USB_Available
      0034B4 E5 82            [12] 2385 	mov	a, dpl
      0034B6 D0 03            [24] 2386 	pop	ar3
      0034B8 D0 04            [24] 2387 	pop	ar4
      0034BA D0 05            [24] 2388 	pop	ar5
      0034BC D0 06            [24] 2389 	pop	ar6
      0034BE D0 07            [24] 2390 	pop	ar7
      0034C0 60 19            [24] 2391 	jz	00102$
                                   2392 ;	bootloader.c:184: stay_in_bootloader = 1; // Handshake received, cancel timeout
      0034C2 7F 01            [12] 2393 	mov	r7,#0x01
                                   2394 ;	bootloader.c:185: ProcessPacket();
      0034C4 C0 07            [24] 2395 	push	ar7
      0034C6 C0 06            [24] 2396 	push	ar6
      0034C8 C0 05            [24] 2397 	push	ar5
      0034CA C0 04            [24] 2398 	push	ar4
      0034CC C0 03            [24] 2399 	push	ar3
      0034CE 12 30 CF         [24] 2400 	lcall	_ProcessPacket
      0034D1 D0 03            [24] 2401 	pop	ar3
      0034D3 D0 04            [24] 2402 	pop	ar4
      0034D5 D0 05            [24] 2403 	pop	ar5
      0034D7 D0 06            [24] 2404 	pop	ar6
      0034D9 D0 07            [24] 2405 	pop	ar7
      0034DB                       2406 00102$:
                                   2407 ;	bootloader.c:188: if (!stay_in_bootloader) {
      0034DB EF               [12] 2408 	mov	a,r7
      0034DC 70 C6            [24] 2409 	jnz	00108$
                                   2410 ;	bootloader.c:189: timeout++;
      0034DE 0B               [12] 2411 	inc	r3
      0034DF BB 00 09         [24] 2412 	cjne	r3,#0x00,00199$
      0034E2 0C               [12] 2413 	inc	r4
      0034E3 BC 00 05         [24] 2414 	cjne	r4,#0x00,00199$
      0034E6 0D               [12] 2415 	inc	r5
      0034E7 BD 00 01         [24] 2416 	cjne	r5,#0x00,00199$
      0034EA 0E               [12] 2417 	inc	r6
      0034EB                       2418 00199$:
                                   2419 ;	bootloader.c:190: if (timeout > 2000000UL) { // ~4.0s timeout at 24MHz
      0034EB C3               [12] 2420 	clr	c
      0034EC 74 80            [12] 2421 	mov	a,#0x80
      0034EE 9B               [12] 2422 	subb	a,r3
      0034EF 74 84            [12] 2423 	mov	a,#0x84
      0034F1 9C               [12] 2424 	subb	a,r4
      0034F2 74 1E            [12] 2425 	mov	a,#0x1e
      0034F4 9D               [12] 2426 	subb	a,r5
      0034F5 E4               [12] 2427 	clr	a
      0034F6 9E               [12] 2428 	subb	a,r6
      0034F7 50 AB            [24] 2429 	jnc	00108$
                                   2430 ;	free result
                                   2431 ;	bootloader.c:191: JumpToApp();
      0034F9 C0 07            [24] 2432 	push	ar7
      0034FB C0 06            [24] 2433 	push	ar6
      0034FD C0 05            [24] 2434 	push	ar5
      0034FF C0 04            [24] 2435 	push	ar4
      003501 C0 03            [24] 2436 	push	ar3
      003503 12 30 C2         [24] 2437 	lcall	_JumpToApp
      003506 D0 03            [24] 2438 	pop	ar3
      003508 D0 04            [24] 2439 	pop	ar4
      00350A D0 05            [24] 2440 	pop	ar5
      00350C D0 06            [24] 2441 	pop	ar6
      00350E D0 07            [24] 2442 	pop	ar7
                                   2443 ;	bootloader.c:195: }
      003510 02 34 A4         [24] 2444 	ljmp	00108$
                                   2445 	.area CSEG    (CODE)
                                   2446 	.area CONST   (CODE)
                                   2447 	.area CONST   (CODE)
      0035C2                       2448 _DevDesc:
      0035C2 12                    2449 	.db #0x12	; 18
      0035C3 01                    2450 	.db #0x01	; 1
      0035C4 10                    2451 	.db #0x10	; 16
      0035C5 01                    2452 	.db #0x01	; 1
      0035C6 00                    2453 	.db #0x00	; 0
      0035C7 00                    2454 	.db #0x00	; 0
      0035C8 00                    2455 	.db #0x00	; 0
      0035C9 40                    2456 	.db #0x40	; 64
      0035CA 09                    2457 	.db #0x09	; 9
      0035CB 12                    2458 	.db #0x12	; 18
      0035CC 5D                    2459 	.db #0x5d	; 93
      0035CD C5                    2460 	.db #0xc5	; 197
      0035CE 00                    2461 	.db #0x00	; 0
      0035CF 01                    2462 	.db #0x01	; 1
      0035D0 01                    2463 	.db #0x01	; 1
      0035D1 02                    2464 	.db #0x02	; 2
      0035D2 03                    2465 	.db #0x03	; 3
      0035D3 01                    2466 	.db #0x01	; 1
                                   2467 	.area CSEG    (CODE)
                                   2468 	.area CONST   (CODE)
      0035D4                       2469 _ReportDesc:
      0035D4 06                    2470 	.db #0x06	; 6
      0035D5 00                    2471 	.db #0x00	; 0
      0035D6 FF                    2472 	.db #0xff	; 255
      0035D7 09                    2473 	.db #0x09	; 9
      0035D8 01                    2474 	.db #0x01	; 1
      0035D9 A1                    2475 	.db #0xa1	; 161
      0035DA 01                    2476 	.db #0x01	; 1
      0035DB 09                    2477 	.db #0x09	; 9
      0035DC 02                    2478 	.db #0x02	; 2
      0035DD 15                    2479 	.db #0x15	; 21
      0035DE 00                    2480 	.db #0x00	; 0
      0035DF 26                    2481 	.db #0x26	; 38
      0035E0 FF                    2482 	.db #0xff	; 255
      0035E1 00                    2483 	.db #0x00	; 0
      0035E2 75                    2484 	.db #0x75	; 117	'u'
      0035E3 08                    2485 	.db #0x08	; 8
      0035E4 95                    2486 	.db #0x95	; 149
      0035E5 40                    2487 	.db #0x40	; 64
      0035E6 91                    2488 	.db #0x91	; 145
      0035E7 02                    2489 	.db #0x02	; 2
      0035E8 09                    2490 	.db #0x09	; 9
      0035E9 03                    2491 	.db #0x03	; 3
      0035EA 15                    2492 	.db #0x15	; 21
      0035EB 00                    2493 	.db #0x00	; 0
      0035EC 26                    2494 	.db #0x26	; 38
      0035ED FF                    2495 	.db #0xff	; 255
      0035EE 00                    2496 	.db #0x00	; 0
      0035EF 75                    2497 	.db #0x75	; 117	'u'
      0035F0 08                    2498 	.db #0x08	; 8
      0035F1 95                    2499 	.db #0x95	; 149
      0035F2 40                    2500 	.db #0x40	; 64
      0035F3 81                    2501 	.db #0x81	; 129
      0035F4 02                    2502 	.db #0x02	; 2
      0035F5 C0                    2503 	.db #0xc0	; 192
                                   2504 	.area CSEG    (CODE)
                                   2505 	.area CONST   (CODE)
      0035F6                       2506 _CfgDesc:
      0035F6 09                    2507 	.db #0x09	; 9
      0035F7 02                    2508 	.db #0x02	; 2
      0035F8 29                    2509 	.db #0x29	; 41
      0035F9 00                    2510 	.db #0x00	; 0
      0035FA 01                    2511 	.db #0x01	; 1
      0035FB 01                    2512 	.db #0x01	; 1
      0035FC 00                    2513 	.db #0x00	; 0
      0035FD 80                    2514 	.db #0x80	; 128
      0035FE 32                    2515 	.db #0x32	; 50	'2'
      0035FF 09                    2516 	.db #0x09	; 9
      003600 04                    2517 	.db #0x04	; 4
      003601 00                    2518 	.db #0x00	; 0
      003602 00                    2519 	.db #0x00	; 0
      003603 02                    2520 	.db #0x02	; 2
      003604 03                    2521 	.db #0x03	; 3
      003605 00                    2522 	.db #0x00	; 0
      003606 00                    2523 	.db #0x00	; 0
      003607 00                    2524 	.db #0x00	; 0
      003608 09                    2525 	.db #0x09	; 9
      003609 21                    2526 	.db #0x21	; 33
      00360A 11                    2527 	.db #0x11	; 17
      00360B 01                    2528 	.db #0x01	; 1
      00360C 00                    2529 	.db #0x00	; 0
      00360D 01                    2530 	.db #0x01	; 1
      00360E 22                    2531 	.db #0x22	; 34
      00360F 22                    2532 	.db #0x22	; 34
      003610 00                    2533 	.db #0x00	; 0
      003611 07                    2534 	.db #0x07	; 7
      003612 05                    2535 	.db #0x05	; 5
      003613 01                    2536 	.db #0x01	; 1
      003614 03                    2537 	.db #0x03	; 3
      003615 40                    2538 	.db #0x40	; 64
      003616 00                    2539 	.db #0x00	; 0
      003617 01                    2540 	.db #0x01	; 1
      003618 07                    2541 	.db #0x07	; 7
      003619 05                    2542 	.db #0x05	; 5
      00361A 81                    2543 	.db #0x81	; 129
      00361B 03                    2544 	.db #0x03	; 3
      00361C 40                    2545 	.db #0x40	; 64
      00361D 00                    2546 	.db #0x00	; 0
      00361E 01                    2547 	.db #0x01	; 1
                                   2548 	.area CSEG    (CODE)
                                   2549 	.area CONST   (CODE)
      00361F                       2550 _Str0Desc:
      00361F 04                    2551 	.db #0x04	; 4
      003620 03                    2552 	.db #0x03	; 3
      003621 09                    2553 	.db #0x09	; 9
      003622 04                    2554 	.db #0x04	; 4
                                   2555 	.area CSEG    (CODE)
                                   2556 	.area CONST   (CODE)
      003623                       2557 _Str1Desc:
      003623 0E                    2558 	.db #0x0e	; 14
      003624 03                    2559 	.db #0x03	; 3
      003625 44                    2560 	.db #0x44	; 68	'D'
      003626 00                    2561 	.db #0x00	; 0
      003627 65                    2562 	.db #0x65	; 101	'e'
      003628 00                    2563 	.db #0x00	; 0
      003629 76                    2564 	.db #0x76	; 118	'v'
      00362A 00                    2565 	.db #0x00	; 0
      00362B 42                    2566 	.db #0x42	; 66	'B'
      00362C 00                    2567 	.db #0x00	; 0
      00362D 6F                    2568 	.db #0x6f	; 111	'o'
      00362E 00                    2569 	.db #0x00	; 0
      00362F 78                    2570 	.db #0x78	; 120	'x'
      003630 00                    2571 	.db #0x00	; 0
                                   2572 	.area CSEG    (CODE)
                                   2573 	.area CONST   (CODE)
      003631                       2574 _Str2Desc:
      003631 20                    2575 	.db #0x20	; 32
      003632 03                    2576 	.db #0x03	; 3
      003633 49                    2577 	.db #0x49	; 73	'I'
      003634 00                    2578 	.db #0x00	; 0
      003635 64                    2579 	.db #0x64	; 100	'd'
      003636 00                    2580 	.db #0x00	; 0
      003637 61                    2581 	.db #0x61	; 97	'a'
      003638 00                    2582 	.db #0x00	; 0
      003639 6E                    2583 	.db #0x6e	; 110	'n'
      00363A 00                    2584 	.db #0x00	; 0
      00363B 27                    2585 	.db #0x27	; 39
      00363C 00                    2586 	.db #0x00	; 0
      00363D 73                    2587 	.db #0x73	; 115	's'
      00363E 00                    2588 	.db #0x00	; 0
      00363F 20                    2589 	.db #0x20	; 32
      003640 00                    2590 	.db #0x00	; 0
      003641 44                    2591 	.db #0x44	; 68	'D'
      003642 00                    2592 	.db #0x00	; 0
      003643 65                    2593 	.db #0x65	; 101	'e'
      003644 00                    2594 	.db #0x00	; 0
      003645 76                    2595 	.db #0x76	; 118	'v'
      003646 00                    2596 	.db #0x00	; 0
      003647 42                    2597 	.db #0x42	; 66	'B'
      003648 00                    2598 	.db #0x00	; 0
      003649 6F                    2599 	.db #0x6f	; 111	'o'
      00364A 00                    2600 	.db #0x00	; 0
      00364B 61                    2601 	.db #0x61	; 97	'a'
      00364C 00                    2602 	.db #0x00	; 0
      00364D 72                    2603 	.db #0x72	; 114	'r'
      00364E 00                    2604 	.db #0x00	; 0
      00364F 64                    2605 	.db #0x64	; 100	'd'
      003650 00                    2606 	.db #0x00	; 0
                                   2607 	.area CSEG    (CODE)
                                   2608 	.area CONST   (CODE)
      003651                       2609 _Str3Desc:
      003651 0A                    2610 	.db #0x0a	; 10
      003652 03                    2611 	.db #0x03	; 3
      003653 76                    2612 	.db #0x76	; 118	'v'
      003654 00                    2613 	.db #0x00	; 0
      003655 31                    2614 	.db #0x31	; 49	'1'
      003656 00                    2615 	.db #0x00	; 0
      003657 2E                    2616 	.db #0x2e	; 46
      003658 00                    2617 	.db #0x00	; 0
      003659 30                    2618 	.db #0x30	; 48	'0'
      00365A 00                    2619 	.db #0x00	; 0
                                   2620 	.area CSEG    (CODE)
                                   2621 	.area XINIT   (CODE)
                                   2622 	.area CABS    (ABS,CODE)
