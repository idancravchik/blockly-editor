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
      002C49 12 34 2A         [24]  758 	lcall	_main
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
                                    773 ;	iap_flash.c:3: uint8_t IAP_ErasePage(uint16_t addr) {
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
                                    787 ;	iap_flash.c:8: if (addr >= BOOTLOADER_START) {
      002CC6 74 D4            [12]  788 	mov	a,#0x100 - 0x2c
      002CC8 2F               [12]  789 	add	a,r7
      002CC9 50 04            [24]  790 	jnc	00102$
                                    791 ;	iap_flash.c:9: return 0x03; // Out of bounds error
      002CCB 75 82 03         [24]  792 	mov	dpl, #0x03
      002CCE 22               [24]  793 	ret
      002CCF                        794 00102$:
                                    795 ;	iap_flash.c:13: addr &= ~0x03FF;
      002CCF 7E 00            [12]  796 	mov	r6,#0x00
      002CD1 53 07 FC         [24]  797 	anl	ar7,#0xfc
                                    798 ;	iap_flash.c:16: ea_saved = EA;
      002CD4 A2 AF            [12]  799 	mov	c,_EA
      002CD6 E4               [12]  800 	clr	a
      002CD7 33               [12]  801 	rlc	a
      002CD8 FD               [12]  802 	mov	r5,a
                                    803 ;	iap_flash.c:17: EA = 0;
                                    804 ;	assignBit
      002CD9 C2 AF            [12]  805 	clr	_EA
                                    806 ;	iap_flash.c:20: SAFE_MOD = 0x55;
      002CDB 75 A1 55         [24]  807 	mov	_SAFE_MOD,#0x55
                                    808 ;	iap_flash.c:21: SAFE_MOD = 0xAA;
      002CDE 75 A1 AA         [24]  809 	mov	_SAFE_MOD,#0xaa
                                    810 ;	iap_flash.c:22: GLOBAL_CFG |= bCODE_WE;
      002CE1 43 B1 08         [24]  811 	orl	_GLOBAL_CFG,#0x08
                                    812 ;	iap_flash.c:23: SAFE_MOD = 0x00;
      002CE4 75 A1 00         [24]  813 	mov	_SAFE_MOD,#0x00
                                    814 ;	iap_flash.c:26: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
      002CE7 8E 84            [24]  815 	mov	_ROM_ADDR_L,r6
                                    816 ;	iap_flash.c:27: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
      002CE9 8F 85            [24]  817 	mov	_ROM_ADDR_H,r7
                                    818 ;	iap_flash.c:30: ROM_CTRL = ROM_CMD_ERASE;
      002CEB 75 86 A6         [24]  819 	mov	_ROM_CTRL,#0xa6
                                    820 ;	iap_flash.c:33: status = ROM_STATUS;
      002CEE AF 86            [24]  821 	mov	r7,_ROM_CTRL
                                    822 ;	iap_flash.c:36: SAFE_MOD = 0x55;
      002CF0 75 A1 55         [24]  823 	mov	_SAFE_MOD,#0x55
                                    824 ;	iap_flash.c:37: SAFE_MOD = 0xAA;
      002CF3 75 A1 AA         [24]  825 	mov	_SAFE_MOD,#0xaa
                                    826 ;	iap_flash.c:38: GLOBAL_CFG &= ~bCODE_WE;
      002CF6 53 B1 F7         [24]  827 	anl	_GLOBAL_CFG,#0xf7
                                    828 ;	iap_flash.c:39: SAFE_MOD = 0x00;
      002CF9 75 A1 00         [24]  829 	mov	_SAFE_MOD,#0x00
                                    830 ;	iap_flash.c:42: EA = ea_saved;
                                    831 ;	assignBit
      002CFC ED               [12]  832 	mov	a,r5
      002CFD 24 FF            [12]  833 	add	a,#0xff
      002CFF 92 AF            [24]  834 	mov	_EA,c
                                    835 ;	iap_flash.c:45: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
      002D01 EF               [12]  836 	mov	a,r7
      002D02 20 E1 04         [24]  837 	jb	acc.1,00103$
      002D05 EF               [12]  838 	mov	a,r7
      002D06 20 E6 04         [24]  839 	jb	acc.6,00104$
      002D09                        840 00103$:
                                    841 ;	iap_flash.c:46: return 0x04; // Erase error
      002D09 75 82 04         [24]  842 	mov	dpl, #0x04
      002D0C 22               [24]  843 	ret
      002D0D                        844 00104$:
                                    845 ;	iap_flash.c:48: return 0x00;
      002D0D 75 82 00         [24]  846 	mov	dpl, #0x00
                                    847 ;	iap_flash.c:49: }
      002D10 22               [24]  848 	ret
                                    849 ;------------------------------------------------------------
                                    850 ;Allocation info for local variables in function 'IAP_WriteWord'
                                    851 ;------------------------------------------------------------
                                    852 ;data_word     Allocated with name '_IAP_WriteWord_PARM_2'
                                    853 ;addr          Allocated to registers r6 r7 
                                    854 ;status        Allocated to registers r7 
                                    855 ;ea_saved      Allocated to registers r5 
                                    856 ;------------------------------------------------------------
                                    857 ;	iap_flash.c:51: uint8_t IAP_WriteWord(uint16_t addr, uint16_t data_word) {
                                    858 ;	-----------------------------------------
                                    859 ;	 function IAP_WriteWord
                                    860 ;	-----------------------------------------
      002D11                        861 _IAP_WriteWord:
      002D11 AE 82            [24]  862 	mov	r6, dpl
      002D13 AF 83            [24]  863 	mov	r7, dph
                                    864 ;	iap_flash.c:56: if (addr >= BOOTLOADER_START) {
      002D15 74 D4            [12]  865 	mov	a,#0x100 - 0x2c
      002D17 2F               [12]  866 	add	a,r7
      002D18 50 04            [24]  867 	jnc	00102$
                                    868 ;	iap_flash.c:57: return 0x03; // Out of bounds error
      002D1A 75 82 03         [24]  869 	mov	dpl, #0x03
      002D1D 22               [24]  870 	ret
      002D1E                        871 00102$:
                                    872 ;	iap_flash.c:61: addr &= ~0x0001;
      002D1E 53 06 FE         [24]  873 	anl	ar6,#0xfe
                                    874 ;	iap_flash.c:64: ea_saved = EA;
      002D21 A2 AF            [12]  875 	mov	c,_EA
      002D23 E4               [12]  876 	clr	a
      002D24 33               [12]  877 	rlc	a
      002D25 FD               [12]  878 	mov	r5,a
                                    879 ;	iap_flash.c:65: EA = 0;
                                    880 ;	assignBit
      002D26 C2 AF            [12]  881 	clr	_EA
                                    882 ;	iap_flash.c:68: SAFE_MOD = 0x55;
      002D28 75 A1 55         [24]  883 	mov	_SAFE_MOD,#0x55
                                    884 ;	iap_flash.c:69: SAFE_MOD = 0xAA;
      002D2B 75 A1 AA         [24]  885 	mov	_SAFE_MOD,#0xaa
                                    886 ;	iap_flash.c:70: GLOBAL_CFG |= bCODE_WE;
      002D2E 43 B1 08         [24]  887 	orl	_GLOBAL_CFG,#0x08
                                    888 ;	iap_flash.c:71: SAFE_MOD = 0x00;
      002D31 75 A1 00         [24]  889 	mov	_SAFE_MOD,#0x00
                                    890 ;	iap_flash.c:74: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
      002D34 8E 84            [24]  891 	mov	_ROM_ADDR_L,r6
                                    892 ;	iap_flash.c:75: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
      002D36 8F 85            [24]  893 	mov	_ROM_ADDR_H,r7
                                    894 ;	iap_flash.c:76: ROM_DATA_L = (uint8_t)(data_word & 0xFF);
      002D38 85 08 8E         [24]  895 	mov	_ROM_DATA_L,_IAP_WriteWord_PARM_2
                                    896 ;	iap_flash.c:77: ROM_DATA_H = (uint8_t)((data_word >> 8) & 0xFF);
      002D3B 85 09 8F         [24]  897 	mov	_ROM_DATA_H,(_IAP_WriteWord_PARM_2 + 1)
                                    898 ;	iap_flash.c:80: ROM_CTRL = ROM_CMD_WRITE;
      002D3E 75 86 9A         [24]  899 	mov	_ROM_CTRL,#0x9a
                                    900 ;	iap_flash.c:83: status = ROM_STATUS;
      002D41 AF 86            [24]  901 	mov	r7,_ROM_CTRL
                                    902 ;	iap_flash.c:86: SAFE_MOD = 0x55;
      002D43 75 A1 55         [24]  903 	mov	_SAFE_MOD,#0x55
                                    904 ;	iap_flash.c:87: SAFE_MOD = 0xAA;
      002D46 75 A1 AA         [24]  905 	mov	_SAFE_MOD,#0xaa
                                    906 ;	iap_flash.c:88: GLOBAL_CFG &= ~bCODE_WE;
      002D49 53 B1 F7         [24]  907 	anl	_GLOBAL_CFG,#0xf7
                                    908 ;	iap_flash.c:89: SAFE_MOD = 0x00;
      002D4C 75 A1 00         [24]  909 	mov	_SAFE_MOD,#0x00
                                    910 ;	iap_flash.c:92: EA = ea_saved;
                                    911 ;	assignBit
      002D4F ED               [12]  912 	mov	a,r5
      002D50 24 FF            [12]  913 	add	a,#0xff
      002D52 92 AF            [24]  914 	mov	_EA,c
                                    915 ;	iap_flash.c:95: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
      002D54 EF               [12]  916 	mov	a,r7
      002D55 20 E1 04         [24]  917 	jb	acc.1,00103$
      002D58 EF               [12]  918 	mov	a,r7
      002D59 20 E6 04         [24]  919 	jb	acc.6,00104$
      002D5C                        920 00103$:
                                    921 ;	iap_flash.c:96: return 0x04; // Write error
      002D5C 75 82 04         [24]  922 	mov	dpl, #0x04
      002D5F 22               [24]  923 	ret
      002D60                        924 00104$:
                                    925 ;	iap_flash.c:98: return 0x00;
      002D60 75 82 00         [24]  926 	mov	dpl, #0x00
                                    927 ;	iap_flash.c:99: }
      002D63 22               [24]  928 	ret
                                    929 ;------------------------------------------------------------
                                    930 ;Allocation info for local variables in function 'IAP_ReadWord'
                                    931 ;------------------------------------------------------------
                                    932 ;addr          Allocated to registers r6 r7 
                                    933 ;low           Allocated to registers r5 
                                    934 ;high          Allocated to registers 
                                    935 ;ptr           Allocated to registers r6 r7 
                                    936 ;------------------------------------------------------------
                                    937 ;	iap_flash.c:101: uint16_t IAP_ReadWord(uint16_t addr) {
                                    938 ;	-----------------------------------------
                                    939 ;	 function IAP_ReadWord
                                    940 ;	-----------------------------------------
      002D64                        941 _IAP_ReadWord:
                                    942 ;	iap_flash.c:103: __code const uint8_t *ptr = (__code const uint8_t *)addr;
                                    943 ;	iap_flash.c:104: low = *ptr;
      002D64 AE 82            [24]  944 	mov	r6,dpl
      002D66 AF 83            [24]  945 	mov  r7,dph
      002D68 E4               [12]  946 	clr	a
      002D69 93               [24]  947 	movc	a,@a+dptr
      002D6A FD               [12]  948 	mov	r5,a
                                    949 ;	iap_flash.c:105: high = *(ptr + 1);
      002D6B 8E 82            [24]  950 	mov	dpl,r6
      002D6D 8F 83            [24]  951 	mov	dph,r7
      002D6F A3               [24]  952 	inc	dptr
      002D70 E4               [12]  953 	clr	a
      002D71 93               [24]  954 	movc	a,@a+dptr
                                    955 ;	iap_flash.c:106: return ((uint16_t)high << 8) | low;
      002D72 FE               [12]  956 	mov	r6,a
      002D73 E4               [12]  957 	clr	a
      002D74 FF               [12]  958 	mov	r7,a
      002D75 FC               [12]  959 	mov	r4,a
      002D76 ED               [12]  960 	mov	a,r5
      002D77 4F               [12]  961 	orl	a,r7
      002D78 F5 82            [12]  962 	mov	dpl,a
      002D7A EC               [12]  963 	mov	a,r4
      002D7B 4E               [12]  964 	orl	a,r6
      002D7C F5 83            [12]  965 	mov	dph,a
                                    966 ;	iap_flash.c:107: }
      002D7E 22               [24]  967 	ret
                                    968 ;------------------------------------------------------------
                                    969 ;Allocation info for local variables in function 'IAP_CalculateCRC16'
                                    970 ;------------------------------------------------------------
                                    971 ;length        Allocated with name '_IAP_CalculateCRC16_PARM_2'
                                    972 ;start_addr    Allocated to registers r6 r7 
                                    973 ;crc           Allocated to registers r4 r5 
                                    974 ;ptr           Allocated to registers 
                                    975 ;i             Allocated with name '_IAP_CalculateCRC16_i_20000_28'
                                    976 ;byte          Allocated to registers 
                                    977 ;b             Allocated to registers r1 
                                    978 ;------------------------------------------------------------
                                    979 ;	iap_flash.c:109: uint16_t IAP_CalculateCRC16(uint16_t start_addr, uint16_t length) {
                                    980 ;	-----------------------------------------
                                    981 ;	 function IAP_CalculateCRC16
                                    982 ;	-----------------------------------------
      002D7F                        983 _IAP_CalculateCRC16:
      002D7F AE 82            [24]  984 	mov	r6, dpl
      002D81 AF 83            [24]  985 	mov	r7, dph
                                    986 ;	iap_flash.c:110: uint16_t crc = 0xFFFF;
      002D83 7C FF            [12]  987 	mov	r4,#0xff
      002D85 7D FF            [12]  988 	mov	r5,#0xff
                                    989 ;	iap_flash.c:111: __code const uint8_t *ptr = (__code const uint8_t *)start_addr;
                                    990 ;	iap_flash.c:113: for (uint16_t i = 0; i < length; i++) {
      002D87 E4               [12]  991 	clr	a
      002D88 F5 0A            [12]  992 	mov	_IAP_CalculateCRC16_i_20000_28,a
      002D8A F5 0B            [12]  993 	mov	(_IAP_CalculateCRC16_i_20000_28 + 1),a
      002D8C                        994 00110$:
      002D8C C3               [12]  995 	clr	c
      002D8D E5 0A            [12]  996 	mov	a,_IAP_CalculateCRC16_i_20000_28
      002D8F 95 08            [12]  997 	subb	a,_IAP_CalculateCRC16_PARM_2
      002D91 E5 0B            [12]  998 	mov	a,(_IAP_CalculateCRC16_i_20000_28 + 1)
      002D93 95 09            [12]  999 	subb	a,(_IAP_CalculateCRC16_PARM_2 + 1)
      002D95 50 46            [24] 1000 	jnc	00105$
                                   1001 ;	iap_flash.c:114: uint8_t byte = *ptr++;
      002D97 8E 82            [24] 1002 	mov	dpl,r6
      002D99 8F 83            [24] 1003 	mov	dph,r7
      002D9B E4               [12] 1004 	clr	a
      002D9C 93               [24] 1005 	movc	a,@a+dptr
      002D9D F9               [12] 1006 	mov	r1,a
      002D9E A3               [24] 1007 	inc	dptr
      002D9F AE 82            [24] 1008 	mov	r6,dpl
      002DA1 AF 83            [24] 1009 	mov	r7,dph
                                   1010 ;	iap_flash.c:115: crc ^= ((uint16_t)byte << 8);
      002DA3 89 00            [24] 1011 	mov	ar0,r1
      002DA5 88 01            [24] 1012 	mov	ar1,r0
      002DA7 E4               [12] 1013 	clr	a
      002DA8 62 04            [12] 1014 	xrl	ar4,a
      002DAA E9               [12] 1015 	mov	a,r1
      002DAB 62 05            [12] 1016 	xrl	ar5,a
                                   1017 ;	iap_flash.c:116: for (uint8_t b = 0; b < 8; b++) {
      002DAD 79 00            [12] 1018 	mov	r1,#0x00
      002DAF                       1019 00107$:
      002DAF B9 08 00         [24] 1020 	cjne	r1,#0x08,00152$
      002DB2                       1021 00152$:
      002DB2 50 1F            [24] 1022 	jnc	00111$
                                   1023 ;	iap_flash.c:117: if (crc & 0x8000) {
      002DB4 ED               [12] 1024 	mov	a,r5
      002DB5 30 E7 12         [24] 1025 	jnb	acc.7,00102$
                                   1026 ;	iap_flash.c:118: crc = (crc << 1) ^ 0x1021;
      002DB8 EC               [12] 1027 	mov	a,r4
      002DB9 2C               [12] 1028 	add	a,r4
      002DBA F8               [12] 1029 	mov	r0,a
      002DBB ED               [12] 1030 	mov	a,r5
      002DBC 33               [12] 1031 	rlc	a
      002DBD FB               [12] 1032 	mov	r3,a
      002DBE 63 00 21         [24] 1033 	xrl	ar0,#0x21
      002DC1 63 03 10         [24] 1034 	xrl	ar3,#0x10
      002DC4 88 04            [24] 1035 	mov	ar4,r0
      002DC6 8B 05            [24] 1036 	mov	ar5,r3
      002DC8 80 06            [24] 1037 	sjmp	00108$
      002DCA                       1038 00102$:
                                   1039 ;	iap_flash.c:120: crc <<= 1;
      002DCA EC               [12] 1040 	mov	a,r4
      002DCB 2C               [12] 1041 	add	a,r4
      002DCC FC               [12] 1042 	mov	r4,a
      002DCD ED               [12] 1043 	mov	a,r5
      002DCE 33               [12] 1044 	rlc	a
      002DCF FD               [12] 1045 	mov	r5,a
      002DD0                       1046 00108$:
                                   1047 ;	iap_flash.c:116: for (uint8_t b = 0; b < 8; b++) {
      002DD0 09               [12] 1048 	inc	r1
      002DD1 80 DC            [24] 1049 	sjmp	00107$
      002DD3                       1050 00111$:
                                   1051 ;	iap_flash.c:113: for (uint16_t i = 0; i < length; i++) {
      002DD3 05 0A            [12] 1052 	inc	_IAP_CalculateCRC16_i_20000_28
      002DD5 E4               [12] 1053 	clr	a
      002DD6 B5 0A B3         [24] 1054 	cjne	a,_IAP_CalculateCRC16_i_20000_28,00110$
      002DD9 05 0B            [12] 1055 	inc	(_IAP_CalculateCRC16_i_20000_28 + 1)
      002DDB 80 AF            [24] 1056 	sjmp	00110$
      002DDD                       1057 00105$:
                                   1058 ;	iap_flash.c:124: return crc;
      002DDD 8C 82            [24] 1059 	mov	dpl, r4
      002DDF 8D 83            [24] 1060 	mov	dph, r5
                                   1061 ;	iap_flash.c:125: }
      002DE1 22               [24] 1062 	ret
                                   1063 ;------------------------------------------------------------
                                   1064 ;Allocation info for local variables in function 'USB_Init'
                                   1065 ;------------------------------------------------------------
                                   1066 ;	usb_hid.c:120: void USB_Init(void) {
                                   1067 ;	-----------------------------------------
                                   1068 ;	 function USB_Init
                                   1069 ;	-----------------------------------------
      002DE2                       1070 _USB_Init:
                                   1071 ;	usb_hid.c:122: SAFE_MOD = 0x55;
      002DE2 75 A1 55         [24] 1072 	mov	_SAFE_MOD,#0x55
                                   1073 ;	usb_hid.c:123: SAFE_MOD = 0xAA;
      002DE5 75 A1 AA         [24] 1074 	mov	_SAFE_MOD,#0xaa
                                   1075 ;	usb_hid.c:124: CLOCK_CFG = 0x86; // 24MHz internal clock
      002DE8 75 B9 86         [24] 1076 	mov	_CLOCK_CFG,#0x86
                                   1077 ;	usb_hid.c:125: SAFE_MOD = 0x00;
      002DEB 75 A1 00         [24] 1078 	mov	_SAFE_MOD,#0x00
                                   1079 ;	usb_hid.c:128: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL;
      002DEE 75 E2 06         [24] 1080 	mov	_USB_CTRL,#0x06
                                   1081 ;	usb_hid.c:129: USB_CTRL = 0x00;
      002DF1 75 E2 00         [24] 1082 	mov	_USB_CTRL,#0x00
                                   1083 ;	usb_hid.c:132: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
      002DF4 75 EC 00         [24] 1084 	mov	_UEP0_DMA_L,#_Ep0Buffer
                                   1085 ;	usb_hid.c:133: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
      002DF7 7E 00            [12] 1086 	mov	r6,#_Ep0Buffer
      002DF9 7F 00            [12] 1087 	mov	r7,#(_Ep0Buffer >> 8)
      002DFB 8F ED            [24] 1088 	mov	_UEP0_DMA_H,r7
                                   1089 ;	usb_hid.c:135: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
      002DFD 75 EE 40         [24] 1090 	mov	_UEP1_DMA_L,#_Ep1Buffer
                                   1091 ;	usb_hid.c:136: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
      002E00 7E 40            [12] 1092 	mov	r6,#_Ep1Buffer
      002E02 7F 00            [12] 1093 	mov	r7,#(_Ep1Buffer >> 8)
      002E04 8F EF            [24] 1094 	mov	_UEP1_DMA_H,r7
                                   1095 ;	usb_hid.c:139: UEP4_1_MOD = 0xC0;
      002E06 75 EA C0         [24] 1096 	mov	_UEP4_1_MOD,#0xc0
                                   1097 ;	usb_hid.c:140: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002E09 75 D2 12         [24] 1098 	mov	_UEP1_CTRL,#0x12
                                   1099 ;	usb_hid.c:141: UEP1_T_LEN = 0;
      002E0C 75 D3 00         [24] 1100 	mov	_UEP1_T_LEN,#0x00
                                   1101 ;	usb_hid.c:144: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002E0F 75 DC 02         [24] 1102 	mov	_UEP0_CTRL,#0x02
                                   1103 ;	usb_hid.c:147: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
      002E12 75 E2 29         [24] 1104 	mov	_USB_CTRL,#0x29
                                   1105 ;	usb_hid.c:148: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN; // Full speed 12Mbps
      002E15 75 D1 81         [24] 1106 	mov	_UDEV_CTRL,#0x81
                                   1107 ;	usb_hid.c:149: USB_DEV_AD = 0x00;
      002E18 75 E3 00         [24] 1108 	mov	_USB_DEV_AD,#0x00
                                   1109 ;	usb_hid.c:151: rx_ready = 0;
      002E1B 75 21 00         [24] 1110 	mov	_rx_ready,#0x00
                                   1111 ;	usb_hid.c:152: usb_dev_addr = 0;
      002E1E 75 22 00         [24] 1112 	mov	_usb_dev_addr,#0x00
                                   1113 ;	usb_hid.c:153: usb_config = 0;
      002E21 75 23 00         [24] 1114 	mov	_usb_config,#0x00
                                   1115 ;	usb_hid.c:154: }
      002E24 22               [24] 1116 	ret
                                   1117 ;------------------------------------------------------------
                                   1118 ;Allocation info for local variables in function 'Handle_EP0_Setup'
                                   1119 ;------------------------------------------------------------
                                   1120 ;req_type      Allocated to registers r7 
                                   1121 ;req           Allocated to registers r6 
                                   1122 ;value         Allocated to registers r4 r5 
                                   1123 ;length        Allocated to registers r3 r2 
                                   1124 ;send_len      Allocated to registers r7 
                                   1125 ;------------------------------------------------------------
                                   1126 ;	usb_hid.c:156: static void Handle_EP0_Setup(void) {
                                   1127 ;	-----------------------------------------
                                   1128 ;	 function Handle_EP0_Setup
                                   1129 ;	-----------------------------------------
      002E25                       1130 _Handle_EP0_Setup:
                                   1131 ;	usb_hid.c:157: uint8_t req_type = Ep0Buffer[0];
      002E25 90 00 00         [24] 1132 	mov	dptr,#_Ep0Buffer
      002E28 E0               [24] 1133 	movx	a,@dptr
      002E29 FF               [12] 1134 	mov	r7,a
                                   1135 ;	usb_hid.c:158: uint8_t req = Ep0Buffer[1];
      002E2A 90 00 01         [24] 1136 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002E2D E0               [24] 1137 	movx	a,@dptr
      002E2E FE               [12] 1138 	mov	r6,a
                                   1139 ;	usb_hid.c:159: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
      002E2F 90 00 02         [24] 1140 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002E32 E0               [24] 1141 	movx	a,@dptr
      002E33 FD               [12] 1142 	mov	r5,a
      002E34 90 00 03         [24] 1143 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002E37 E0               [24] 1144 	movx	a,@dptr
      002E38 FB               [12] 1145 	mov	r3,a
      002E39 7C 00            [12] 1146 	mov	r4,#0x00
      002E3B 8D 02            [24] 1147 	mov	ar2,r5
      002E3D 7D 00            [12] 1148 	mov	r5,#0x00
      002E3F EC               [12] 1149 	mov	a,r4
      002E40 4A               [12] 1150 	orl	a,r2
      002E41 FC               [12] 1151 	mov	r4,a
      002E42 EB               [12] 1152 	mov	a,r3
      002E43 4D               [12] 1153 	orl	a,r5
      002E44 FD               [12] 1154 	mov	r5,a
                                   1155 ;	usb_hid.c:160: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
      002E45 90 00 06         [24] 1156 	mov	dptr,#(_Ep0Buffer + 0x0006)
      002E48 E0               [24] 1157 	movx	a,@dptr
      002E49 FB               [12] 1158 	mov	r3,a
      002E4A 90 00 07         [24] 1159 	mov	dptr,#(_Ep0Buffer + 0x0007)
      002E4D E0               [24] 1160 	movx	a,@dptr
      002E4E FA               [12] 1161 	mov	r2,a
      002E4F E4               [12] 1162 	clr	a
      002E50 F9               [12] 1163 	mov	r1,a
      002E51 F8               [12] 1164 	mov	r0,a
      002E52 4B               [12] 1165 	orl	a,r3
      002E53 FB               [12] 1166 	mov	r3,a
      002E54 EA               [12] 1167 	mov	a,r2
      002E55 48               [12] 1168 	orl	a,r0
      002E56 FA               [12] 1169 	mov	r2,a
                                   1170 ;	usb_hid.c:162: setup_tx_ptr = 0;
      002E57 E4               [12] 1171 	clr	a
      002E58 F5 24            [12] 1172 	mov	_setup_tx_ptr,a
      002E5A F5 25            [12] 1173 	mov	(_setup_tx_ptr + 1),a
                                   1174 ;	usb_hid.c:163: setup_tx_len = 0;
      002E5C F5 26            [12] 1175 	mov	_setup_tx_len,a
      002E5E F5 27            [12] 1176 	mov	(_setup_tx_len + 1),a
                                   1177 ;	usb_hid.c:165: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
      002E60 EF               [12] 1178 	mov	a,r7
      002E61 54 60            [12] 1179 	anl	a,#0x60
      002E63 60 03            [24] 1180 	jz	00234$
      002E65 02 2F 2E         [24] 1181 	ljmp	00123$
      002E68                       1182 00234$:
                                   1183 ;	usb_hid.c:166: switch (req) {
      002E68 EE               [12] 1184 	mov	a,r6
      002E69 70 03            [24] 1185 	jnz	00235$
      002E6B 02 2F 20         [24] 1186 	ljmp	00114$
      002E6E                       1187 00235$:
      002E6E BE 05 03         [24] 1188 	cjne	r6,#0x05,00236$
      002E71 02 2F 18         [24] 1189 	ljmp	00112$
      002E74                       1190 00236$:
      002E74 BE 06 02         [24] 1191 	cjne	r6,#0x06,00237$
      002E77 80 09            [24] 1192 	sjmp	00101$
      002E79                       1193 00237$:
      002E79 BE 09 03         [24] 1194 	cjne	r6,#0x09,00238$
      002E7C 02 2F 1C         [24] 1195 	ljmp	00113$
      002E7F                       1196 00238$:
      002E7F 02 2F 2E         [24] 1197 	ljmp	00123$
                                   1198 ;	usb_hid.c:167: case USB_GET_DESCRIPTOR:
      002E82                       1199 00101$:
                                   1200 ;	usb_hid.c:168: switch (Ep0Buffer[3]) {
      002E82 90 00 03         [24] 1201 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002E85 E0               [24] 1202 	movx	a,@dptr
      002E86 FF               [12] 1203 	mov	r7,a
      002E87 BF 01 02         [24] 1204 	cjne	r7,#0x01,00239$
      002E8A 80 12            [24] 1205 	sjmp	00102$
      002E8C                       1206 00239$:
      002E8C BF 02 02         [24] 1207 	cjne	r7,#0x02,00240$
      002E8F 80 1C            [24] 1208 	sjmp	00103$
      002E91                       1209 00240$:
      002E91 BF 03 02         [24] 1210 	cjne	r7,#0x03,00241$
      002E94 80 25            [24] 1211 	sjmp	00104$
      002E96                       1212 00241$:
      002E96 BF 22 02         [24] 1213 	cjne	r7,#0x22,00242$
      002E99 80 6F            [24] 1214 	sjmp	00110$
      002E9B                       1215 00242$:
      002E9B 02 2F 2E         [24] 1216 	ljmp	00123$
                                   1217 ;	usb_hid.c:169: case 0x01: // Device Descriptor
      002E9E                       1218 00102$:
                                   1219 ;	usb_hid.c:170: setup_tx_ptr = DevDesc;
      002E9E 75 24 C8         [24] 1220 	mov	_setup_tx_ptr,#_DevDesc
      002EA1 75 25 35         [24] 1221 	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
                                   1222 ;	usb_hid.c:171: setup_tx_len = sizeof(DevDesc);
      002EA4 75 26 12         [24] 1223 	mov	_setup_tx_len,#0x12
      002EA7 75 27 00         [24] 1224 	mov	(_setup_tx_len + 1),#0x00
                                   1225 ;	usb_hid.c:172: break;
      002EAA 02 2F 2E         [24] 1226 	ljmp	00123$
                                   1227 ;	usb_hid.c:173: case 0x02: // Configuration Descriptor
      002EAD                       1228 00103$:
                                   1229 ;	usb_hid.c:174: setup_tx_ptr = CfgDesc;
      002EAD 75 24 FC         [24] 1230 	mov	_setup_tx_ptr,#_CfgDesc
      002EB0 75 25 35         [24] 1231 	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
                                   1232 ;	usb_hid.c:175: setup_tx_len = sizeof(CfgDesc);
      002EB3 75 26 29         [24] 1233 	mov	_setup_tx_len,#0x29
      002EB6 75 27 00         [24] 1234 	mov	(_setup_tx_len + 1),#0x00
                                   1235 ;	usb_hid.c:176: break;
                                   1236 ;	usb_hid.c:177: case 0x03: // String Descriptor
      002EB9 80 73            [24] 1237 	sjmp	00123$
      002EBB                       1238 00104$:
                                   1239 ;	usb_hid.c:178: switch (Ep0Buffer[2]) {
      002EBB 90 00 02         [24] 1240 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002EBE E0               [24] 1241 	movx	a,@dptr
      002EBF FF               [12] 1242 	mov  r7,a
      002EC0 24 FC            [12] 1243 	add	a,#0xff - 0x03
      002EC2 40 6A            [24] 1244 	jc	00123$
                                   1245 ;	free result
      002EC4 EF               [12] 1246 	mov	a,r7
      002EC5 2F               [12] 1247 	add	a,r7
                                   1248 ;	usb_hid.c:179: case 0: setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); break;
      002EC6 90 2E CA         [24] 1249 	mov	dptr,#00244$
      002EC9 73               [24] 1250 	jmp	@a+dptr
      002ECA                       1251 00244$:
      002ECA 80 06            [24] 1252 	sjmp	00105$
      002ECC 80 12            [24] 1253 	sjmp	00106$
      002ECE 80 1E            [24] 1254 	sjmp	00107$
      002ED0 80 2A            [24] 1255 	sjmp	00108$
      002ED2                       1256 00105$:
      002ED2 75 24 25         [24] 1257 	mov	_setup_tx_ptr,#_Str0Desc
      002ED5 75 25 36         [24] 1258 	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
      002ED8 75 26 04         [24] 1259 	mov	_setup_tx_len,#0x04
      002EDB 75 27 00         [24] 1260 	mov	(_setup_tx_len + 1),#0x00
                                   1261 ;	usb_hid.c:180: case 1: setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); break;
      002EDE 80 4E            [24] 1262 	sjmp	00123$
      002EE0                       1263 00106$:
      002EE0 75 24 29         [24] 1264 	mov	_setup_tx_ptr,#_Str1Desc
      002EE3 75 25 36         [24] 1265 	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
      002EE6 75 26 0E         [24] 1266 	mov	_setup_tx_len,#0x0e
      002EE9 75 27 00         [24] 1267 	mov	(_setup_tx_len + 1),#0x00
                                   1268 ;	usb_hid.c:181: case 2: setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); break;
      002EEC 80 40            [24] 1269 	sjmp	00123$
      002EEE                       1270 00107$:
      002EEE 75 24 37         [24] 1271 	mov	_setup_tx_ptr,#_Str2Desc
      002EF1 75 25 36         [24] 1272 	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
      002EF4 75 26 20         [24] 1273 	mov	_setup_tx_len,#0x20
      002EF7 75 27 00         [24] 1274 	mov	(_setup_tx_len + 1),#0x00
                                   1275 ;	usb_hid.c:182: case 3: setup_tx_ptr = Str3Desc; setup_tx_len = sizeof(Str3Desc); break;
      002EFA 80 32            [24] 1276 	sjmp	00123$
      002EFC                       1277 00108$:
      002EFC 75 24 57         [24] 1278 	mov	_setup_tx_ptr,#_Str3Desc
      002EFF 75 25 36         [24] 1279 	mov	(_setup_tx_ptr + 1),#(_Str3Desc >> 8)
      002F02 75 26 0A         [24] 1280 	mov	_setup_tx_len,#0x0a
      002F05 75 27 00         [24] 1281 	mov	(_setup_tx_len + 1),#0x00
                                   1282 ;	usb_hid.c:184: break;
                                   1283 ;	usb_hid.c:185: case 0x22: // HID Report Descriptor
      002F08 80 24            [24] 1284 	sjmp	00123$
      002F0A                       1285 00110$:
                                   1286 ;	usb_hid.c:186: setup_tx_ptr = ReportDesc;
      002F0A 75 24 DA         [24] 1287 	mov	_setup_tx_ptr,#_ReportDesc
      002F0D 75 25 35         [24] 1288 	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
                                   1289 ;	usb_hid.c:187: setup_tx_len = sizeof(ReportDesc);
      002F10 75 26 22         [24] 1290 	mov	_setup_tx_len,#0x22
      002F13 75 27 00         [24] 1291 	mov	(_setup_tx_len + 1),#0x00
                                   1292 ;	usb_hid.c:190: break;
                                   1293 ;	usb_hid.c:192: case USB_SET_ADDRESS:
      002F16 80 16            [24] 1294 	sjmp	00123$
      002F18                       1295 00112$:
                                   1296 ;	usb_hid.c:193: usb_dev_addr = (uint8_t)value;
      002F18 8C 22            [24] 1297 	mov	_usb_dev_addr,r4
                                   1298 ;	usb_hid.c:194: break;
                                   1299 ;	usb_hid.c:196: case USB_SET_CONFIGURATION:
      002F1A 80 12            [24] 1300 	sjmp	00123$
      002F1C                       1301 00113$:
                                   1302 ;	usb_hid.c:197: usb_config = (uint8_t)value;
      002F1C 8C 23            [24] 1303 	mov	_usb_config,r4
                                   1304 ;	usb_hid.c:198: break;
                                   1305 ;	usb_hid.c:200: case USB_GET_STATUS:
      002F1E 80 0E            [24] 1306 	sjmp	00123$
      002F20                       1307 00114$:
                                   1308 ;	usb_hid.c:201: Ep0Buffer[0] = 0x00;
      002F20 90 00 00         [24] 1309 	mov	dptr,#_Ep0Buffer
      002F23 E4               [12] 1310 	clr	a
      002F24 F0               [24] 1311 	movx	@dptr,a
                                   1312 ;	usb_hid.c:202: Ep0Buffer[1] = 0x00;
      002F25 90 00 01         [24] 1313 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002F28 F0               [24] 1314 	movx	@dptr,a
                                   1315 ;	usb_hid.c:203: setup_tx_len = 2;
      002F29 75 26 02         [24] 1316 	mov	_setup_tx_len,#0x02
      002F2C F5 27            [12] 1317 	mov	(_setup_tx_len + 1),a
                                   1318 ;	usb_hid.c:212: }
      002F2E                       1319 00123$:
                                   1320 ;	usb_hid.c:215: if (setup_tx_len > length) {
      002F2E C3               [12] 1321 	clr	c
      002F2F EB               [12] 1322 	mov	a,r3
      002F30 95 26            [12] 1323 	subb	a,_setup_tx_len
      002F32 EA               [12] 1324 	mov	a,r2
      002F33 95 27            [12] 1325 	subb	a,(_setup_tx_len + 1)
      002F35 50 04            [24] 1326 	jnc	00125$
                                   1327 ;	free result
                                   1328 ;	usb_hid.c:216: setup_tx_len = length;
      002F37 8B 26            [24] 1329 	mov	_setup_tx_len,r3
      002F39 8A 27            [24] 1330 	mov	(_setup_tx_len + 1),r2
      002F3B                       1331 00125$:
                                   1332 ;	usb_hid.c:219: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002F3B AE 26            [24] 1333 	mov	r6,_setup_tx_len
      002F3D AF 27            [24] 1334 	mov	r7,(_setup_tx_len + 1)
      002F3F C3               [12] 1335 	clr	c
      002F40 74 40            [12] 1336 	mov	a,#0x40
      002F42 9E               [12] 1337 	subb	a,r6
      002F43 E4               [12] 1338 	clr	a
      002F44 9F               [12] 1339 	subb	a,r7
      002F45 50 04            [24] 1340 	jnc	00131$
                                   1341 ;	free result
      002F47 7F 40            [12] 1342 	mov	r7,#0x40
      002F49 80 04            [24] 1343 	sjmp	00132$
      002F4B                       1344 00131$:
      002F4B AE 26            [24] 1345 	mov	r6,_setup_tx_len
      002F4D 8E 07            [24] 1346 	mov	ar7,r6
      002F4F                       1347 00132$:
                                   1348 ;	usb_hid.c:220: if (setup_tx_ptr && send_len > 0) {
      002F4F E5 24            [12] 1349 	mov	a,_setup_tx_ptr
      002F51 45 25            [12] 1350 	orl	a,(_setup_tx_ptr + 1)
      002F53 60 3B            [24] 1351 	jz	00127$
      002F55 EF               [12] 1352 	mov	a,r7
      002F56 60 38            [24] 1353 	jz	00127$
                                   1354 ;	usb_hid.c:221: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002F58 85 24 08         [24] 1355 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002F5B 85 25 09         [24] 1356 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002F5E 75 0A 80         [24] 1357 	mov	(___memcpy_PARM_2 + 2),#0x80
      002F61 8F 0B            [24] 1358 	mov	___memcpy_PARM_3,r7
      002F63 75 0C 00         [24] 1359 	mov	(___memcpy_PARM_3 + 1),#0x00
      002F66 90 00 00         [24] 1360 	mov	dptr,#_Ep0Buffer
      002F69 75 F0 00         [24] 1361 	mov	b, #0x00
      002F6C C0 07            [24] 1362 	push	ar7
      002F6E 12 35 19         [24] 1363 	lcall	___memcpy
      002F71 D0 07            [24] 1364 	pop	ar7
                                   1365 ;	usb_hid.c:222: setup_tx_ptr += send_len;
      002F73 EF               [12] 1366 	mov	a,r7
      002F74 25 24            [12] 1367 	add	a, _setup_tx_ptr
      002F76 F5 24            [12] 1368 	mov	_setup_tx_ptr,a
      002F78 E4               [12] 1369 	clr	a
      002F79 35 25            [12] 1370 	addc	a, (_setup_tx_ptr + 1)
      002F7B F5 25            [12] 1371 	mov	(_setup_tx_ptr + 1),a
                                   1372 ;	usb_hid.c:223: setup_tx_len -= send_len;
      002F7D 8F 05            [24] 1373 	mov	ar5,r7
      002F7F 7E 00            [12] 1374 	mov	r6,#0x00
      002F81 AB 26            [24] 1375 	mov	r3,_setup_tx_len
      002F83 AC 27            [24] 1376 	mov	r4,(_setup_tx_len + 1)
      002F85 EB               [12] 1377 	mov	a,r3
      002F86 C3               [12] 1378 	clr	c
      002F87 9D               [12] 1379 	subb	a,r5
      002F88 FB               [12] 1380 	mov	r3,a
      002F89 EC               [12] 1381 	mov	a,r4
      002F8A 9E               [12] 1382 	subb	a,r6
      002F8B FC               [12] 1383 	mov	r4,a
      002F8C 8B 26            [24] 1384 	mov	_setup_tx_len,r3
      002F8E 8C 27            [24] 1385 	mov	(_setup_tx_len + 1),r4
      002F90                       1386 00127$:
                                   1387 ;	usb_hid.c:226: UEP0_T_LEN = send_len;
      002F90 8F DD            [24] 1388 	mov	_UEP0_T_LEN,r7
                                   1389 ;	usb_hid.c:227: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
      002F92 75 DC C0         [24] 1390 	mov	_UEP0_CTRL,#0xc0
                                   1391 ;	usb_hid.c:228: }
      002F95 22               [24] 1392 	ret
                                   1393 ;------------------------------------------------------------
                                   1394 ;Allocation info for local variables in function 'USB_Process'
                                   1395 ;------------------------------------------------------------
                                   1396 ;token         Allocated to registers r7 
                                   1397 ;endp          Allocated to registers r5 
                                   1398 ;send_len      Allocated to registers r6 
                                   1399 ;------------------------------------------------------------
                                   1400 ;	usb_hid.c:230: void USB_Process(void) {
                                   1401 ;	-----------------------------------------
                                   1402 ;	 function USB_Process
                                   1403 ;	-----------------------------------------
      002F96                       1404 _USB_Process:
                                   1405 ;	usb_hid.c:231: if (UIF_BUS_RST) {
      002F96 30 D8 0F         [24] 1406 	jnb	_UIF_BUS_RST,00102$
                                   1407 ;	usb_hid.c:232: USB_DEV_AD = 0x00;
      002F99 75 E3 00         [24] 1408 	mov	_USB_DEV_AD,#0x00
                                   1409 ;	usb_hid.c:233: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002F9C 75 DC 02         [24] 1410 	mov	_UEP0_CTRL,#0x02
                                   1411 ;	usb_hid.c:234: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002F9F 75 D2 12         [24] 1412 	mov	_UEP1_CTRL,#0x12
                                   1413 ;	usb_hid.c:235: UIF_BUS_RST = 0; // Clear reset flag
                                   1414 ;	assignBit
      002FA2 C2 D8            [12] 1415 	clr	_UIF_BUS_RST
                                   1416 ;	usb_hid.c:236: rx_ready = 0;
      002FA4 75 21 00         [24] 1417 	mov	_rx_ready,#0x00
                                   1418 ;	usb_hid.c:237: return;
      002FA7 22               [24] 1419 	ret
      002FA8                       1420 00102$:
                                   1421 ;	usb_hid.c:240: if (UIF_TRANSFER) {
      002FA8 20 D9 01         [24] 1422 	jb	_UIF_TRANSFER,00225$
      002FAB 22               [24] 1423 	ret
      002FAC                       1424 00225$:
                                   1425 ;	usb_hid.c:241: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
      002FAC E5 D9            [12] 1426 	mov	a,_USB_INT_ST
      002FAE 54 30            [12] 1427 	anl	a,#0x30
      002FB0 FF               [12] 1428 	mov	r7,a
                                   1429 ;	usb_hid.c:242: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
      002FB1 E5 D9            [12] 1430 	mov	a,_USB_INT_ST
      002FB3 54 0F            [12] 1431 	anl	a,#0x0f
                                   1432 ;	usb_hid.c:244: if (endp == 0) { // Endpoint 0
      002FB5 FD               [12] 1433 	mov	r5,a
      002FB6 60 03            [24] 1434 	jz	00226$
      002FB8 02 30 3E         [24] 1435 	ljmp	00125$
      002FBB                       1436 00226$:
                                   1437 ;	usb_hid.c:245: if (token == UIS_TOKEN_SETUP) {
      002FBB BF 30 06         [24] 1438 	cjne	r7,#0x30,00115$
                                   1439 ;	usb_hid.c:246: Handle_EP0_Setup();
      002FBE 12 2E 25         [24] 1440 	lcall	_Handle_EP0_Setup
      002FC1 02 30 5F         [24] 1441 	ljmp	00126$
      002FC4                       1442 00115$:
                                   1443 ;	usb_hid.c:247: } else if (token == UIS_TOKEN_IN) {
      002FC4 BF 20 6F         [24] 1444 	cjne	r7,#0x20,00112$
                                   1445 ;	usb_hid.c:248: if (usb_dev_addr != 0 && USB_DEV_AD == 0) {
      002FC7 E5 22            [12] 1446 	mov	a,_usb_dev_addr
      002FC9 60 07            [24] 1447 	jz	00104$
      002FCB E5 E3            [12] 1448 	mov	a,_USB_DEV_AD
      002FCD 70 03            [24] 1449 	jnz	00104$
                                   1450 ;	usb_hid.c:249: USB_DEV_AD = usb_dev_addr;
      002FCF 85 22 E3         [24] 1451 	mov	_USB_DEV_AD,_usb_dev_addr
      002FD2                       1452 00104$:
                                   1453 ;	usb_hid.c:251: if (setup_tx_len > 0) {
      002FD2 E5 26            [12] 1454 	mov	a,_setup_tx_len
      002FD4 45 27            [12] 1455 	orl	a,(_setup_tx_len + 1)
      002FD6 60 56            [24] 1456 	jz	00107$
                                   1457 ;	usb_hid.c:252: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002FD8 AC 26            [24] 1458 	mov	r4,_setup_tx_len
      002FDA AE 27            [24] 1459 	mov	r6,(_setup_tx_len + 1)
      002FDC C3               [12] 1460 	clr	c
      002FDD 74 40            [12] 1461 	mov	a,#0x40
      002FDF 9C               [12] 1462 	subb	a,r4
      002FE0 E4               [12] 1463 	clr	a
      002FE1 9E               [12] 1464 	subb	a,r6
      002FE2 50 04            [24] 1465 	jnc	00131$
                                   1466 ;	free result
      002FE4 7E 40            [12] 1467 	mov	r6,#0x40
      002FE6 80 04            [24] 1468 	sjmp	00132$
      002FE8                       1469 00131$:
      002FE8 AC 26            [24] 1470 	mov	r4,_setup_tx_len
      002FEA 8C 06            [24] 1471 	mov	ar6,r4
      002FEC                       1472 00132$:
                                   1473 ;	usb_hid.c:253: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002FEC 85 24 08         [24] 1474 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002FEF 85 25 09         [24] 1475 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002FF2 75 0A 80         [24] 1476 	mov	(___memcpy_PARM_2 + 2),#0x80
      002FF5 8E 0B            [24] 1477 	mov	___memcpy_PARM_3,r6
      002FF7 75 0C 00         [24] 1478 	mov	(___memcpy_PARM_3 + 1),#0x00
      002FFA 90 00 00         [24] 1479 	mov	dptr,#_Ep0Buffer
      002FFD 75 F0 00         [24] 1480 	mov	b, #0x00
      003000 C0 06            [24] 1481 	push	ar6
      003002 12 35 19         [24] 1482 	lcall	___memcpy
      003005 D0 06            [24] 1483 	pop	ar6
                                   1484 ;	usb_hid.c:254: setup_tx_ptr += send_len;
      003007 EE               [12] 1485 	mov	a,r6
      003008 25 24            [12] 1486 	add	a, _setup_tx_ptr
      00300A F5 24            [12] 1487 	mov	_setup_tx_ptr,a
      00300C E4               [12] 1488 	clr	a
      00300D 35 25            [12] 1489 	addc	a, (_setup_tx_ptr + 1)
      00300F F5 25            [12] 1490 	mov	(_setup_tx_ptr + 1),a
                                   1491 ;	usb_hid.c:255: setup_tx_len -= send_len;
      003011 8E 03            [24] 1492 	mov	ar3,r6
      003013 7C 00            [12] 1493 	mov	r4,#0x00
      003015 A9 26            [24] 1494 	mov	r1,_setup_tx_len
      003017 AA 27            [24] 1495 	mov	r2,(_setup_tx_len + 1)
      003019 E9               [12] 1496 	mov	a,r1
      00301A C3               [12] 1497 	clr	c
      00301B 9B               [12] 1498 	subb	a,r3
      00301C F9               [12] 1499 	mov	r1,a
      00301D EA               [12] 1500 	mov	a,r2
      00301E 9C               [12] 1501 	subb	a,r4
      00301F FA               [12] 1502 	mov	r2,a
      003020 89 26            [24] 1503 	mov	_setup_tx_len,r1
      003022 8A 27            [24] 1504 	mov	(_setup_tx_len + 1),r2
                                   1505 ;	usb_hid.c:256: UEP0_T_LEN = send_len;
      003024 8E DD            [24] 1506 	mov	_UEP0_T_LEN,r6
                                   1507 ;	usb_hid.c:257: UEP0_CTRL ^= bUEP_T_TOG;
      003026 63 DC 40         [24] 1508 	xrl	_UEP0_CTRL,#0x40
                                   1509 ;	usb_hid.c:258: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      003029 53 DC FC         [24] 1510 	anl	_UEP0_CTRL,#0xfc
      00302C 80 31            [24] 1511 	sjmp	00126$
      00302E                       1512 00107$:
                                   1513 ;	usb_hid.c:260: UEP0_T_LEN = 0;
      00302E 75 DD 00         [24] 1514 	mov	_UEP0_T_LEN,#0x00
                                   1515 ;	usb_hid.c:261: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      003031 75 DC 02         [24] 1516 	mov	_UEP0_CTRL,#0x02
      003034 80 29            [24] 1517 	sjmp	00126$
      003036                       1518 00112$:
                                   1519 ;	usb_hid.c:263: } else if (token == UIS_TOKEN_OUT) {
      003036 EF               [12] 1520 	mov	a,r7
      003037 70 26            [24] 1521 	jnz	00126$
                                   1522 ;	usb_hid.c:264: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      003039 75 DC 02         [24] 1523 	mov	_UEP0_CTRL,#0x02
      00303C 80 21            [24] 1524 	sjmp	00126$
      00303E                       1525 00125$:
                                   1526 ;	usb_hid.c:266: } else if (endp == 1) { // Endpoint 1 (HID Data)
      00303E BD 01 1E         [24] 1527 	cjne	r5,#0x01,00126$
                                   1528 ;	usb_hid.c:267: if (token == UIS_TOKEN_OUT) {
      003041 EF               [12] 1529 	mov	a,r7
      003042 70 0D            [24] 1530 	jnz	00120$
                                   1531 ;	usb_hid.c:268: rx_ready = 1;
      003044 75 21 01         [24] 1532 	mov	_rx_ready,#0x01
                                   1533 ;	usb_hid.c:269: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_NAK;
      003047 74 F3            [12] 1534 	mov	a,#0xf3
      003049 55 D2            [12] 1535 	anl	a,_UEP1_CTRL
      00304B 44 08            [12] 1536 	orl	a,#0x08
      00304D F5 D2            [12] 1537 	mov	_UEP1_CTRL,a
      00304F 80 0E            [24] 1538 	sjmp	00126$
      003051                       1539 00120$:
                                   1540 ;	usb_hid.c:270: } else if (token == UIS_TOKEN_IN) {
      003051 BF 20 0B         [24] 1541 	cjne	r7,#0x20,00126$
                                   1542 ;	usb_hid.c:271: UEP1_T_LEN = 0;
      003054 75 D3 00         [24] 1543 	mov	_UEP1_T_LEN,#0x00
                                   1544 ;	usb_hid.c:272: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
      003057 74 FC            [12] 1545 	mov	a,#0xfc
      003059 55 D2            [12] 1546 	anl	a,_UEP1_CTRL
      00305B 44 02            [12] 1547 	orl	a,#0x02
      00305D F5 D2            [12] 1548 	mov	_UEP1_CTRL,a
      00305F                       1549 00126$:
                                   1550 ;	usb_hid.c:276: UIF_TRANSFER = 0; // Clear transfer flag
                                   1551 ;	assignBit
      00305F C2 D9            [12] 1552 	clr	_UIF_TRANSFER
                                   1553 ;	usb_hid.c:278: }
      003061 22               [24] 1554 	ret
                                   1555 ;------------------------------------------------------------
                                   1556 ;Allocation info for local variables in function 'USB_Available'
                                   1557 ;------------------------------------------------------------
                                   1558 ;	usb_hid.c:280: uint8_t USB_Available(void) {
                                   1559 ;	-----------------------------------------
                                   1560 ;	 function USB_Available
                                   1561 ;	-----------------------------------------
      003062                       1562 _USB_Available:
                                   1563 ;	usb_hid.c:281: return rx_ready;
      003062 85 21 82         [24] 1564 	mov	dpl, _rx_ready
                                   1565 ;	usb_hid.c:282: }
      003065 22               [24] 1566 	ret
                                   1567 ;------------------------------------------------------------
                                   1568 ;Allocation info for local variables in function 'USB_GetRxBuffer'
                                   1569 ;------------------------------------------------------------
                                   1570 ;	usb_hid.c:284: uint8_t *USB_GetRxBuffer(void) {
                                   1571 ;	-----------------------------------------
                                   1572 ;	 function USB_GetRxBuffer
                                   1573 ;	-----------------------------------------
      003066                       1574 _USB_GetRxBuffer:
                                   1575 ;	usb_hid.c:285: return &Ep1Buffer[0];
      003066 90 00 40         [24] 1576 	mov	dptr,#_Ep1Buffer
      003069 75 F0 00         [24] 1577 	mov	b, #0x00
                                   1578 ;	usb_hid.c:286: }
      00306C 22               [24] 1579 	ret
                                   1580 ;------------------------------------------------------------
                                   1581 ;Allocation info for local variables in function 'USB_ReleaseRx'
                                   1582 ;------------------------------------------------------------
                                   1583 ;	usb_hid.c:288: void USB_ReleaseRx(void) {
                                   1584 ;	-----------------------------------------
                                   1585 ;	 function USB_ReleaseRx
                                   1586 ;	-----------------------------------------
      00306D                       1587 _USB_ReleaseRx:
                                   1588 ;	usb_hid.c:289: rx_ready = 0;
      00306D 75 21 00         [24] 1589 	mov	_rx_ready,#0x00
                                   1590 ;	usb_hid.c:290: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_ACK;
      003070 53 D2 F3         [24] 1591 	anl	_UEP1_CTRL,#0xf3
                                   1592 ;	usb_hid.c:291: }
      003073 22               [24] 1593 	ret
                                   1594 ;------------------------------------------------------------
                                   1595 ;Allocation info for local variables in function 'USB_SendReport'
                                   1596 ;------------------------------------------------------------
                                   1597 ;len           Allocated with name '_USB_SendReport_PARM_2'
                                   1598 ;buf           Allocated to registers r5 r6 r7 
                                   1599 ;------------------------------------------------------------
                                   1600 ;	usb_hid.c:293: void USB_SendReport(const uint8_t *buf, uint8_t len) {
                                   1601 ;	-----------------------------------------
                                   1602 ;	 function USB_SendReport
                                   1603 ;	-----------------------------------------
      003074                       1604 _USB_SendReport:
      003074 AD 82            [24] 1605 	mov	r5, dpl
      003076 AE 83            [24] 1606 	mov	r6, dph
      003078 AF F0            [24] 1607 	mov	r7, b
                                   1608 ;	usb_hid.c:294: memcpy(&Ep1Buffer[64], buf, len);
      00307A 8D 08            [24] 1609 	mov	___memcpy_PARM_2,r5
      00307C 8E 09            [24] 1610 	mov	(___memcpy_PARM_2 + 1),r6
      00307E 8F 0A            [24] 1611 	mov	(___memcpy_PARM_2 + 2),r7
      003080 85 28 0B         [24] 1612 	mov	___memcpy_PARM_3,_USB_SendReport_PARM_2
      003083 75 0C 00         [24] 1613 	mov	(___memcpy_PARM_3 + 1),#0x00
      003086 90 00 80         [24] 1614 	mov	dptr,#(_Ep1Buffer + 0x0040)
      003089 75 F0 00         [24] 1615 	mov	b, #0x00
      00308C 12 35 19         [24] 1616 	lcall	___memcpy
                                   1617 ;	usb_hid.c:295: UEP1_T_LEN = len;
      00308F 85 28 D3         [24] 1618 	mov	_UEP1_T_LEN,_USB_SendReport_PARM_2
                                   1619 ;	usb_hid.c:296: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      003092 53 D2 FC         [24] 1620 	anl	_UEP1_CTRL,#0xfc
                                   1621 ;	usb_hid.c:297: }
      003095 22               [24] 1622 	ret
                                   1623 ;------------------------------------------------------------
                                   1624 ;Allocation info for local variables in function 'USB_Shutdown'
                                   1625 ;------------------------------------------------------------
                                   1626 ;	usb_hid.c:299: void USB_Shutdown(void) {
                                   1627 ;	-----------------------------------------
                                   1628 ;	 function USB_Shutdown
                                   1629 ;	-----------------------------------------
      003096                       1630 _USB_Shutdown:
                                   1631 ;	usb_hid.c:300: USB_CTRL = 0x00;
      003096 75 E2 00         [24] 1632 	mov	_USB_CTRL,#0x00
                                   1633 ;	usb_hid.c:301: UDEV_CTRL = 0x00;
      003099 75 D1 00         [24] 1634 	mov	_UDEV_CTRL,#0x00
                                   1635 ;	usb_hid.c:302: }
      00309C 22               [24] 1636 	ret
                                   1637 ;------------------------------------------------------------
                                   1638 ;Allocation info for local variables in function 'DelayMs'
                                   1639 ;------------------------------------------------------------
                                   1640 ;ms            Allocated to registers 
                                   1641 ;i             Allocated to registers r4 r5 
                                   1642 ;------------------------------------------------------------
                                   1643 ;	bootloader.c:31: static void DelayMs(uint16_t ms) {
                                   1644 ;	-----------------------------------------
                                   1645 ;	 function DelayMs
                                   1646 ;	-----------------------------------------
      00309D                       1647 _DelayMs:
      00309D AE 82            [24] 1648 	mov	r6, dpl
      00309F AF 83            [24] 1649 	mov	r7, dph
                                   1650 ;	bootloader.c:32: while (ms--) {
      0030A1                       1651 00102$:
      0030A1 8E 04            [24] 1652 	mov	ar4,r6
      0030A3 8F 05            [24] 1653 	mov	ar5,r7
      0030A5 1E               [12] 1654 	dec	r6
      0030A6 BE FF 01         [24] 1655 	cjne	r6,#0xff,00139$
      0030A9 1F               [12] 1656 	dec	r7
      0030AA                       1657 00139$:
      0030AA EC               [12] 1658 	mov	a,r4
      0030AB 4D               [12] 1659 	orl	a,r5
      0030AC 60 19            [24] 1660 	jz	00108$
                                   1661 ;	bootloader.c:33: for (uint16_t i = 0; i < 2400; i++) {
      0030AE 7C 00            [12] 1662 	mov	r4,#0x00
      0030B0 7D 00            [12] 1663 	mov	r5,#0x00
      0030B2                       1664 00106$:
      0030B2 8C 02            [24] 1665 	mov	ar2,r4
      0030B4 8D 03            [24] 1666 	mov	ar3,r5
      0030B6 C3               [12] 1667 	clr	c
      0030B7 EA               [12] 1668 	mov	a,r2
      0030B8 94 60            [12] 1669 	subb	a,#0x60
      0030BA EB               [12] 1670 	mov	a,r3
      0030BB 94 09            [12] 1671 	subb	a,#0x09
      0030BD 50 E2            [24] 1672 	jnc	00102$
                                   1673 ;	bootloader.c:34: __asm nop __endasm;
      0030BF 00               [12] 1674 	nop	
                                   1675 ;	bootloader.c:33: for (uint16_t i = 0; i < 2400; i++) {
      0030C0 0C               [12] 1676 	inc	r4
      0030C1 BC 00 EE         [24] 1677 	cjne	r4,#0x00,00106$
      0030C4 0D               [12] 1678 	inc	r5
      0030C5 80 EB            [24] 1679 	sjmp	00106$
      0030C7                       1680 00108$:
                                   1681 ;	bootloader.c:37: }
      0030C7 22               [24] 1682 	ret
                                   1683 ;------------------------------------------------------------
                                   1684 ;Allocation info for local variables in function 'JumpToApp'
                                   1685 ;------------------------------------------------------------
                                   1686 ;	bootloader.c:39: static void JumpToApp(void) {
                                   1687 ;	-----------------------------------------
                                   1688 ;	 function JumpToApp
                                   1689 ;	-----------------------------------------
      0030C8                       1690 _JumpToApp:
                                   1691 ;	bootloader.c:40: USB_Shutdown();
      0030C8 12 30 96         [24] 1692 	lcall	_USB_Shutdown
                                   1693 ;	bootloader.c:41: DelayMs(10);
      0030CB 90 00 0A         [24] 1694 	mov	dptr,#0x000a
      0030CE 12 30 9D         [24] 1695 	lcall	_DelayMs
                                   1696 ;	bootloader.c:45: __endasm;
      0030D1 02 00 00         [24] 1697 	ljmp 0x0000
                                   1698 ;	bootloader.c:46: }
      0030D4 22               [24] 1699 	ret
                                   1700 ;------------------------------------------------------------
                                   1701 ;Allocation info for local variables in function 'ProcessPacket'
                                   1702 ;------------------------------------------------------------
                                   1703 ;rx            Allocated with name '_ProcessPacket_rx_10000_126'
                                   1704 ;cmd           Allocated with name '_ProcessPacket_cmd_10000_126'
                                   1705 ;seq           Allocated with name '_ProcessPacket_seq_10000_126'
                                   1706 ;addr          Allocated with name '_ProcessPacket_addr_10000_126'
                                   1707 ;len           Allocated with name '_ProcessPacket_len_10000_126'
                                   1708 ;erase_err     Allocated with name '_ProcessPacket_erase_err_40000_136'
                                   1709 ;page          Allocated to registers r0 r2 
                                   1710 ;end_page      Allocated with name '_ProcessPacket_end_page_40000_136'
                                   1711 ;err           Allocated with name '_ProcessPacket_err_40000_144'
                                   1712 ;i             Allocated with name '_ProcessPacket_i_50000_145'
                                   1713 ;word          Allocated to registers 
                                   1714 ;expected_crc  Allocated to registers r4 r7 
                                   1715 ;calc_crc      Allocated to registers r5 r6 
                                   1716 ;sloc0         Allocated with name '_ProcessPacket_sloc0_1_0'
                                   1717 ;sloc1         Allocated with name '_ProcessPacket_sloc1_1_0'
                                   1718 ;sloc2         Allocated with name '_ProcessPacket_sloc2_1_0'
                                   1719 ;------------------------------------------------------------
                                   1720 ;	bootloader.c:48: static void ProcessPacket(void) {
                                   1721 ;	-----------------------------------------
                                   1722 ;	 function ProcessPacket
                                   1723 ;	-----------------------------------------
      0030D5                       1724 _ProcessPacket:
                                   1725 ;	bootloader.c:49: uint8_t *rx = USB_GetRxBuffer();
      0030D5 12 30 66         [24] 1726 	lcall	_USB_GetRxBuffer
                                   1727 ;	bootloader.c:50: uint8_t cmd = rx[0];
      0030D8 85 82 2C         [24] 1728 	mov	_ProcessPacket_rx_10000_126,dpl
      0030DB 85 83 2D         [24] 1729 	mov	(_ProcessPacket_rx_10000_126 + 1),dph
      0030DE 85 F0 2E         [24] 1730 	mov	(_ProcessPacket_rx_10000_126 + 2),b
      0030E1 12 35 A8         [24] 1731 	lcall	__gptrget
      0030E4 F5 2F            [12] 1732 	mov	_ProcessPacket_cmd_10000_126,a
                                   1733 ;	bootloader.c:51: uint8_t seq = rx[1];
      0030E6 74 01            [12] 1734 	mov	a,#0x01
      0030E8 25 2C            [12] 1735 	add	a, _ProcessPacket_rx_10000_126
      0030EA F9               [12] 1736 	mov	r1,a
      0030EB E4               [12] 1737 	clr	a
      0030EC 35 2D            [12] 1738 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      0030EE FA               [12] 1739 	mov	r2,a
      0030EF AB 2E            [24] 1740 	mov	r3,(_ProcessPacket_rx_10000_126 + 2)
      0030F1 89 82            [24] 1741 	mov	dpl,r1
      0030F3 8A 83            [24] 1742 	mov	dph,r2
      0030F5 8B F0            [24] 1743 	mov	b,r3
      0030F7 12 35 A8         [24] 1744 	lcall	__gptrget
      0030FA F5 30            [12] 1745 	mov	_ProcessPacket_seq_10000_126,a
                                   1746 ;	bootloader.c:52: uint16_t addr = rx[2] | ((uint16_t)rx[3] << 8);
      0030FC 74 02            [12] 1747 	mov	a,#0x02
      0030FE 25 2C            [12] 1748 	add	a, _ProcessPacket_rx_10000_126
      003100 F8               [12] 1749 	mov	r0,a
      003101 E4               [12] 1750 	clr	a
      003102 35 2D            [12] 1751 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003104 FA               [12] 1752 	mov	r2,a
      003105 AB 2E            [24] 1753 	mov	r3,(_ProcessPacket_rx_10000_126 + 2)
      003107 88 82            [24] 1754 	mov	dpl,r0
      003109 8A 83            [24] 1755 	mov	dph,r2
      00310B 8B F0            [24] 1756 	mov	b,r3
      00310D 12 35 A8         [24] 1757 	lcall	__gptrget
      003110 F5 39            [12] 1758 	mov	_ProcessPacket_sloc0_1_0,a
      003112 74 03            [12] 1759 	mov	a,#0x03
      003114 25 2C            [12] 1760 	add	a, _ProcessPacket_rx_10000_126
      003116 F5 3C            [12] 1761 	mov	_ProcessPacket_sloc2_1_0,a
      003118 E4               [12] 1762 	clr	a
      003119 35 2D            [12] 1763 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      00311B F5 3D            [12] 1764 	mov	(_ProcessPacket_sloc2_1_0 + 1),a
      00311D 85 2E 3E         [24] 1765 	mov	(_ProcessPacket_sloc2_1_0 + 2),(_ProcessPacket_rx_10000_126 + 2)
      003120 85 3C 82         [24] 1766 	mov	dpl,_ProcessPacket_sloc2_1_0
      003123 85 3D 83         [24] 1767 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      003126 85 3E F0         [24] 1768 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      003129 12 35 A8         [24] 1769 	lcall	__gptrget
      00312C F9               [12] 1770 	mov	r1,a
      00312D 7D 00            [12] 1771 	mov	r5,#0x00
      00312F 89 3B            [24] 1772 	mov	(_ProcessPacket_sloc1_1_0 + 1),r1
      003131 8D 3A            [24] 1773 	mov	_ProcessPacket_sloc1_1_0,r5
      003133 A9 39            [24] 1774 	mov	r1,_ProcessPacket_sloc0_1_0
      003135 89 31            [24] 1775 	mov	_ProcessPacket_addr_10000_126,r1
      003137 E5 3B            [12] 1776 	mov	a,(_ProcessPacket_sloc1_1_0 + 1)
      003139 4D               [12] 1777 	orl	a,r5
      00313A F5 32            [12] 1778 	mov	(_ProcessPacket_addr_10000_126 + 1),a
                                   1779 ;	bootloader.c:53: uint8_t len = rx[4];
      00313C 74 04            [12] 1780 	mov	a,#0x04
      00313E 25 2C            [12] 1781 	add	a, _ProcessPacket_rx_10000_126
      003140 F9               [12] 1782 	mov	r1,a
      003141 E4               [12] 1783 	clr	a
      003142 35 2D            [12] 1784 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003144 FD               [12] 1785 	mov	r5,a
      003145 AF 2E            [24] 1786 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      003147 89 82            [24] 1787 	mov	dpl,r1
      003149 8D 83            [24] 1788 	mov	dph,r5
      00314B 8F F0            [24] 1789 	mov	b,r7
      00314D 12 35 A8         [24] 1790 	lcall	__gptrget
      003150 F5 33            [12] 1791 	mov	_ProcessPacket_len_10000_126,a
                                   1792 ;	bootloader.c:55: memset(reply_buf, 0, 64);
      003152 75 08 00         [24] 1793 	mov	_memset_PARM_2,#0x00
      003155 75 09 40         [24] 1794 	mov	_memset_PARM_3,#0x40
      003158 75 0A 00         [24] 1795 	mov	(_memset_PARM_3 + 1),#0x00
      00315B 90 00 00         [24] 1796 	mov	dptr,#_reply_buf
      00315E 75 F0 00         [24] 1797 	mov	b, #0x00
      003161 C0 03            [24] 1798 	push	ar3
      003163 C0 02            [24] 1799 	push	ar2
      003165 C0 00            [24] 1800 	push	ar0
      003167 12 35 6E         [24] 1801 	lcall	_memset
      00316A D0 00            [24] 1802 	pop	ar0
      00316C D0 02            [24] 1803 	pop	ar2
      00316E D0 03            [24] 1804 	pop	ar3
                                   1805 ;	bootloader.c:56: reply_buf[0] = cmd;
      003170 90 00 00         [24] 1806 	mov	dptr,#_reply_buf
      003173 E5 2F            [12] 1807 	mov	a,_ProcessPacket_cmd_10000_126
      003175 F0               [24] 1808 	movx	@dptr,a
                                   1809 ;	bootloader.c:57: reply_buf[1] = seq;
      003176 90 00 01         [24] 1810 	mov	dptr,#(_reply_buf + 0x0001)
      003179 E5 30            [12] 1811 	mov	a,_ProcessPacket_seq_10000_126
      00317B F0               [24] 1812 	movx	@dptr,a
                                   1813 ;	bootloader.c:58: reply_buf[2] = rx[2];
      00317C 88 82            [24] 1814 	mov	dpl,r0
      00317E 8A 83            [24] 1815 	mov	dph,r2
      003180 8B F0            [24] 1816 	mov	b,r3
      003182 12 35 A8         [24] 1817 	lcall	__gptrget
      003185 F8               [12] 1818 	mov	r0,a
      003186 90 00 02         [24] 1819 	mov	dptr,#(_reply_buf + 0x0002)
      003189 F0               [24] 1820 	movx	@dptr,a
                                   1821 ;	bootloader.c:59: reply_buf[3] = rx[3];
      00318A 85 3C 82         [24] 1822 	mov	dpl,_ProcessPacket_sloc2_1_0
      00318D 85 3D 83         [24] 1823 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      003190 85 3E F0         [24] 1824 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      003193 12 35 A8         [24] 1825 	lcall	__gptrget
      003196 FE               [12] 1826 	mov	r6,a
      003197 90 00 03         [24] 1827 	mov	dptr,#(_reply_buf + 0x0003)
      00319A F0               [24] 1828 	movx	@dptr,a
                                   1829 ;	bootloader.c:60: reply_buf[59] = STATUS_OK;
      00319B 90 00 3B         [24] 1830 	mov	dptr,#(_reply_buf + 0x003b)
      00319E E4               [12] 1831 	clr	a
      00319F F0               [24] 1832 	movx	@dptr,a
                                   1833 ;	bootloader.c:62: switch (cmd) {
      0031A0 E5 2F            [12] 1834 	mov	a,_ProcessPacket_cmd_10000_126
      0031A2 24 F9            [12] 1835 	add	a,#0xff - 0x06
      0031A4 50 03            [24] 1836 	jnc	00259$
      0031A6 02 34 15         [24] 1837 	ljmp	00129$
      0031A9                       1838 00259$:
                                   1839 ;	free result
      0031A9 E5 2F            [12] 1840 	mov	a,_ProcessPacket_cmd_10000_126
      0031AB 75 F0 03         [24] 1841 	mov	b,#0x03
      0031AE A4               [48] 1842 	mul	ab
      0031AF 90 31 B3         [24] 1843 	mov	dptr,#00260$
      0031B2 73               [24] 1844 	jmp	@a+dptr
      0031B3                       1845 00260$:
      0031B3 02 34 15         [24] 1846 	ljmp	00129$
      0031B6 02 31 C8         [24] 1847 	ljmp	00101$
      0031B9 02 31 E8         [24] 1848 	ljmp	00102$
      0031BC 02 34 15         [24] 1849 	ljmp	00129$
      0031BF 02 32 65         [24] 1850 	ljmp	00109$
      0031C2 02 33 8E         [24] 1851 	ljmp	00127$
      0031C5 02 33 FC         [24] 1852 	ljmp	00128$
                                   1853 ;	bootloader.c:63: case CMD_HELLO:
      0031C8                       1854 00101$:
                                   1855 ;	bootloader.c:64: reply_buf[4] = 0x52; // Chip ID: CH552
      0031C8 90 00 04         [24] 1856 	mov	dptr,#(_reply_buf + 0x0004)
      0031CB 74 52            [12] 1857 	mov	a,#0x52
      0031CD F0               [24] 1858 	movx	@dptr,a
                                   1859 ;	bootloader.c:65: reply_buf[5] = 0x01; // Bootloader v1.0
      0031CE 90 00 05         [24] 1860 	mov	dptr,#(_reply_buf + 0x0005)
      0031D1 74 01            [12] 1861 	mov	a,#0x01
      0031D3 F0               [24] 1862 	movx	@dptr,a
                                   1863 ;	bootloader.c:66: reply_buf[6] = (uint8_t)(USER_FLASH_END & 0xFF);
      0031D4 90 00 06         [24] 1864 	mov	dptr,#(_reply_buf + 0x0006)
      0031D7 74 FF            [12] 1865 	mov	a,#0xff
      0031D9 F0               [24] 1866 	movx	@dptr,a
                                   1867 ;	bootloader.c:67: reply_buf[7] = (uint8_t)((USER_FLASH_END >> 8) & 0xFF); // 11 KB usable
      0031DA 90 00 07         [24] 1868 	mov	dptr,#(_reply_buf + 0x0007)
      0031DD 74 2B            [12] 1869 	mov	a,#0x2b
      0031DF F0               [24] 1870 	movx	@dptr,a
                                   1871 ;	bootloader.c:68: reply_buf[59] = STATUS_OK;
      0031E0 90 00 3B         [24] 1872 	mov	dptr,#(_reply_buf + 0x003b)
      0031E3 E4               [12] 1873 	clr	a
      0031E4 F0               [24] 1874 	movx	@dptr,a
                                   1875 ;	bootloader.c:69: break;
      0031E5 02 34 1B         [24] 1876 	ljmp	00130$
                                   1877 ;	bootloader.c:71: case CMD_UNLOCK:
      0031E8                       1878 00102$:
                                   1879 ;	bootloader.c:72: if (rx[5] == 0x5A && rx[6] == 0xC3 && rx[7] == 0x3C && rx[8] == 0xA5) {
      0031E8 74 05            [12] 1880 	mov	a,#0x05
      0031EA 25 2C            [12] 1881 	add	a, _ProcessPacket_rx_10000_126
      0031EC FC               [12] 1882 	mov	r4,a
      0031ED E4               [12] 1883 	clr	a
      0031EE 35 2D            [12] 1884 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      0031F0 FD               [12] 1885 	mov	r5,a
      0031F1 AE 2E            [24] 1886 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      0031F3 8C 82            [24] 1887 	mov	dpl,r4
      0031F5 8D 83            [24] 1888 	mov	dph,r5
      0031F7 8E F0            [24] 1889 	mov	b,r6
      0031F9 12 35 A8         [24] 1890 	lcall	__gptrget
      0031FC FC               [12] 1891 	mov	r4,a
      0031FD BC 5A 59         [24] 1892 	cjne	r4,#0x5a,00104$
      003200 74 06            [12] 1893 	mov	a,#0x06
      003202 25 2C            [12] 1894 	add	a, _ProcessPacket_rx_10000_126
      003204 FC               [12] 1895 	mov	r4,a
      003205 E4               [12] 1896 	clr	a
      003206 35 2D            [12] 1897 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003208 FD               [12] 1898 	mov	r5,a
      003209 AE 2E            [24] 1899 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      00320B 8C 82            [24] 1900 	mov	dpl,r4
      00320D 8D 83            [24] 1901 	mov	dph,r5
      00320F 8E F0            [24] 1902 	mov	b,r6
      003211 12 35 A8         [24] 1903 	lcall	__gptrget
      003214 FC               [12] 1904 	mov	r4,a
      003215 BC C3 41         [24] 1905 	cjne	r4,#0xc3,00104$
      003218 74 07            [12] 1906 	mov	a,#0x07
      00321A 25 2C            [12] 1907 	add	a, _ProcessPacket_rx_10000_126
      00321C FC               [12] 1908 	mov	r4,a
      00321D E4               [12] 1909 	clr	a
      00321E 35 2D            [12] 1910 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003220 FD               [12] 1911 	mov	r5,a
      003221 AE 2E            [24] 1912 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      003223 8C 82            [24] 1913 	mov	dpl,r4
      003225 8D 83            [24] 1914 	mov	dph,r5
      003227 8E F0            [24] 1915 	mov	b,r6
      003229 12 35 A8         [24] 1916 	lcall	__gptrget
      00322C FC               [12] 1917 	mov	r4,a
      00322D BC 3C 29         [24] 1918 	cjne	r4,#0x3c,00104$
      003230 74 08            [12] 1919 	mov	a,#0x08
      003232 25 2C            [12] 1920 	add	a, _ProcessPacket_rx_10000_126
      003234 FC               [12] 1921 	mov	r4,a
      003235 E4               [12] 1922 	clr	a
      003236 35 2D            [12] 1923 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003238 FD               [12] 1924 	mov	r5,a
      003239 AE 2E            [24] 1925 	mov	r6,(_ProcessPacket_rx_10000_126 + 2)
      00323B 8C 82            [24] 1926 	mov	dpl,r4
      00323D 8D 83            [24] 1927 	mov	dph,r5
      00323F 8E F0            [24] 1928 	mov	b,r6
      003241 12 35 A8         [24] 1929 	lcall	__gptrget
      003244 FC               [12] 1930 	mov	r4,a
      003245 BC A5 11         [24] 1931 	cjne	r4,#0xa5,00104$
                                   1932 ;	bootloader.c:73: is_unlocked = 1;
      003248 75 29 01         [24] 1933 	mov	_is_unlocked,#0x01
                                   1934 ;	bootloader.c:74: last_erased_page = 0xFFFF; // Reset page erase tracking for new session
      00324B 75 2A FF         [24] 1935 	mov	_last_erased_page,#0xff
      00324E 75 2B FF         [24] 1936 	mov	(_last_erased_page + 1),#0xff
                                   1937 ;	bootloader.c:75: reply_buf[59] = STATUS_OK;
      003251 90 00 3B         [24] 1938 	mov	dptr,#(_reply_buf + 0x003b)
      003254 E4               [12] 1939 	clr	a
      003255 F0               [24] 1940 	movx	@dptr,a
      003256 02 34 1B         [24] 1941 	ljmp	00130$
      003259                       1942 00104$:
                                   1943 ;	bootloader.c:77: is_unlocked = 0;
      003259 75 29 00         [24] 1944 	mov	_is_unlocked,#0x00
                                   1945 ;	bootloader.c:78: reply_buf[59] = STATUS_LOCKED;
      00325C 90 00 3B         [24] 1946 	mov	dptr,#(_reply_buf + 0x003b)
      00325F 74 02            [12] 1947 	mov	a,#0x02
      003261 F0               [24] 1948 	movx	@dptr,a
                                   1949 ;	bootloader.c:80: break;
      003262 02 34 1B         [24] 1950 	ljmp	00130$
                                   1951 ;	bootloader.c:82: case CMD_WRITE_BLOCK:
      003265                       1952 00109$:
                                   1953 ;	bootloader.c:83: if (!is_unlocked) {
      003265 E5 29            [12] 1954 	mov	a,_is_unlocked
      003267 70 09            [24] 1955 	jnz	00111$
                                   1956 ;	bootloader.c:84: reply_buf[59] = STATUS_LOCKED;
      003269 90 00 3B         [24] 1957 	mov	dptr,#(_reply_buf + 0x003b)
      00326C 74 02            [12] 1958 	mov	a,#0x02
      00326E F0               [24] 1959 	movx	@dptr,a
                                   1960 ;	bootloader.c:85: break;
      00326F 02 34 1B         [24] 1961 	ljmp	00130$
      003272                       1962 00111$:
                                   1963 ;	bootloader.c:88: if (addr + len > BOOTLOADER_START) {
      003272 AD 33            [24] 1964 	mov	r5,_ProcessPacket_len_10000_126
      003274 7E 00            [12] 1965 	mov	r6,#0x00
      003276 A9 31            [24] 1966 	mov	r1,_ProcessPacket_addr_10000_126
      003278 AC 32            [24] 1967 	mov	r4,(_ProcessPacket_addr_10000_126 + 1)
      00327A ED               [12] 1968 	mov	a,r5
      00327B 29               [12] 1969 	add	a, r1
      00327C FA               [12] 1970 	mov	r2,a
      00327D EE               [12] 1971 	mov	a,r6
      00327E 3C               [12] 1972 	addc	a, r4
      00327F FB               [12] 1973 	mov	r3,a
      003280 C3               [12] 1974 	clr	c
      003281 E4               [12] 1975 	clr	a
      003282 9A               [12] 1976 	subb	a,r2
      003283 74 2C            [12] 1977 	mov	a,#0x2c
      003285 9B               [12] 1978 	subb	a,r3
      003286 50 09            [24] 1979 	jnc	00113$
                                   1980 ;	free result
                                   1981 ;	bootloader.c:89: reply_buf[59] = STATUS_OOB; // Protect bootloader
      003288 90 00 3B         [24] 1982 	mov	dptr,#(_reply_buf + 0x003b)
      00328B 74 03            [12] 1983 	mov	a,#0x03
      00328D F0               [24] 1984 	movx	@dptr,a
                                   1985 ;	bootloader.c:90: break;
      00328E 02 34 1B         [24] 1986 	ljmp	00130$
      003291                       1987 00113$:
                                   1988 ;	bootloader.c:95: uint8_t erase_err = 0;
                                   1989 ;	bootloader.c:96: uint16_t page = addr & ~0x03FF;
      003291 E4               [12] 1990 	clr	a
      003292 F5 34            [12] 1991 	mov	_ProcessPacket_erase_err_40000_136,a
      003294 F8               [12] 1992 	mov	r0,a
      003295 74 FC            [12] 1993 	mov	a,#0xfc
      003297 5C               [12] 1994 	anl	a,r4
      003298 FA               [12] 1995 	mov	r2,a
                                   1996 ;	bootloader.c:97: uint16_t end_page = (addr + len - 1) & ~0x03FF;
      003299 ED               [12] 1997 	mov	a,r5
      00329A 29               [12] 1998 	add	a, r1
      00329B FD               [12] 1999 	mov	r5,a
      00329C EE               [12] 2000 	mov	a,r6
      00329D 3C               [12] 2001 	addc	a, r4
      00329E FE               [12] 2002 	mov	r6,a
      00329F 1D               [12] 2003 	dec	r5
      0032A0 BD FF 01         [24] 2004 	cjne	r5,#0xff,00271$
      0032A3 1E               [12] 2005 	dec	r6
      0032A4                       2006 00271$:
      0032A4 7D 00            [12] 2007 	mov	r5,#0x00
      0032A6 53 06 FC         [24] 2008 	anl	ar6,#0xfc
      0032A9 8D 35            [24] 2009 	mov	_ProcessPacket_end_page_40000_136,r5
      0032AB 8E 36            [24] 2010 	mov	(_ProcessPacket_end_page_40000_136 + 1),r6
                                   2011 ;	bootloader.c:98: while (page <= end_page) {
      0032AD                       2012 00119$:
      0032AD C3               [12] 2013 	clr	c
      0032AE E5 35            [12] 2014 	mov	a,_ProcessPacket_end_page_40000_136
      0032B0 98               [12] 2015 	subb	a,r0
      0032B1 E5 36            [12] 2016 	mov	a,(_ProcessPacket_end_page_40000_136 + 1)
      0032B3 9A               [12] 2017 	subb	a,r2
      0032B4 40 47            [24] 2018 	jc	00121$
                                   2019 ;	free result
                                   2020 ;	bootloader.c:99: if (last_erased_page == 0xFFFF || page > last_erased_page) {
      0032B6 AB 2A            [24] 2021 	mov	r3,_last_erased_page
      0032B8 AE 2B            [24] 2022 	mov	r6,(_last_erased_page + 1)
      0032BA BB FF 05         [24] 2023 	cjne	r3,#0xff,00273$
      0032BD BE FF 02         [24] 2024 	cjne	r6,#0xff,00273$
      0032C0 80 09            [24] 2025 	sjmp	00116$
      0032C2                       2026 00273$:
      0032C2 C3               [12] 2027 	clr	c
      0032C3 E5 2A            [12] 2028 	mov	a,_last_erased_page
      0032C5 98               [12] 2029 	subb	a,r0
      0032C6 E5 2B            [12] 2030 	mov	a,(_last_erased_page + 1)
      0032C8 9A               [12] 2031 	subb	a,r2
      0032C9 50 24            [24] 2032 	jnc	00117$
                                   2033 ;	free result
      0032CB                       2034 00116$:
                                   2035 ;	bootloader.c:100: if (IAP_ErasePage(page) != 0) {
      0032CB 88 82            [24] 2036 	mov	dpl, r0
      0032CD 8A 83            [24] 2037 	mov	dph, r2
      0032CF C0 04            [24] 2038 	push	ar4
      0032D1 C0 02            [24] 2039 	push	ar2
      0032D3 C0 01            [24] 2040 	push	ar1
      0032D5 C0 00            [24] 2041 	push	ar0
      0032D7 12 2C C4         [24] 2042 	lcall	_IAP_ErasePage
      0032DA E5 82            [12] 2043 	mov	a, dpl
      0032DC D0 00            [24] 2044 	pop	ar0
      0032DE D0 01            [24] 2045 	pop	ar1
      0032E0 D0 02            [24] 2046 	pop	ar2
      0032E2 D0 04            [24] 2047 	pop	ar4
      0032E4 60 05            [24] 2048 	jz	00115$
                                   2049 ;	bootloader.c:101: erase_err = 1;
      0032E6 75 34 01         [24] 2050 	mov	_ProcessPacket_erase_err_40000_136,#0x01
                                   2051 ;	bootloader.c:102: break;
      0032E9 80 12            [24] 2052 	sjmp	00121$
      0032EB                       2053 00115$:
                                   2054 ;	bootloader.c:104: last_erased_page = page;
      0032EB 88 2A            [24] 2055 	mov	_last_erased_page,r0
      0032ED 8A 2B            [24] 2056 	mov	(_last_erased_page + 1),r2
      0032EF                       2057 00117$:
                                   2058 ;	bootloader.c:106: page += 0x0400;
      0032EF 88 05            [24] 2059 	mov	ar5,r0
      0032F1 8A 06            [24] 2060 	mov	ar6,r2
      0032F3 74 04            [12] 2061 	mov	a,#0x04
      0032F5 2E               [12] 2062 	add	a, r6
      0032F6 FE               [12] 2063 	mov	r6,a
      0032F7 8D 00            [24] 2064 	mov	ar0,r5
      0032F9 8E 02            [24] 2065 	mov	ar2,r6
      0032FB 80 B0            [24] 2066 	sjmp	00119$
      0032FD                       2067 00121$:
                                   2068 ;	bootloader.c:108: if (erase_err) {
      0032FD E5 34            [12] 2069 	mov	a,_ProcessPacket_erase_err_40000_136
      0032FF 60 09            [24] 2070 	jz	00123$
                                   2071 ;	bootloader.c:109: reply_buf[59] = STATUS_WRITE_ERR;
      003301 90 00 3B         [24] 2072 	mov	dptr,#(_reply_buf + 0x003b)
      003304 74 04            [12] 2073 	mov	a,#0x04
      003306 F0               [24] 2074 	movx	@dptr,a
                                   2075 ;	bootloader.c:110: break;
      003307 02 34 1B         [24] 2076 	ljmp	00130$
      00330A                       2077 00123$:
                                   2078 ;	bootloader.c:116: uint8_t err = 0;
      00330A 75 37 00         [24] 2079 	mov	_ProcessPacket_err_40000_144,#0x00
                                   2080 ;	bootloader.c:117: for (uint8_t i = 0; i < len; i += 2) {
      00330D 75 38 00         [24] 2081 	mov	_ProcessPacket_i_50000_145,#0x00
      003310                       2082 00132$:
      003310 C3               [12] 2083 	clr	c
      003311 E5 38            [12] 2084 	mov	a,_ProcessPacket_i_50000_145
      003313 95 33            [12] 2085 	subb	a,_ProcessPacket_len_10000_126
      003315 50 6A            [24] 2086 	jnc	00126$
                                   2087 ;	bootloader.c:118: uint16_t word = rx[5 + i] | ((uint16_t)rx[6 + i] << 8);
      003317 AA 38            [24] 2088 	mov	r2,_ProcessPacket_i_50000_145
      003319 7B 00            [12] 2089 	mov	r3,#0x00
      00331B 74 05            [12] 2090 	mov	a,#0x05
      00331D 2A               [12] 2091 	add	a, r2
      00331E F8               [12] 2092 	mov	r0,a
      00331F E4               [12] 2093 	clr	a
      003320 3B               [12] 2094 	addc	a, r3
      003321 FE               [12] 2095 	mov	r6,a
      003322 E8               [12] 2096 	mov	a,r0
      003323 25 2C            [12] 2097 	add	a, _ProcessPacket_rx_10000_126
      003325 F8               [12] 2098 	mov	r0,a
      003326 EE               [12] 2099 	mov	a,r6
      003327 35 2D            [12] 2100 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003329 FE               [12] 2101 	mov	r6,a
      00332A AF 2E            [24] 2102 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      00332C 88 82            [24] 2103 	mov	dpl,r0
      00332E 8E 83            [24] 2104 	mov	dph,r6
      003330 8F F0            [24] 2105 	mov	b,r7
      003332 12 35 A8         [24] 2106 	lcall	__gptrget
      003335 F8               [12] 2107 	mov	r0,a
      003336 74 06            [12] 2108 	mov	a,#0x06
      003338 2A               [12] 2109 	add	a, r2
      003339 FE               [12] 2110 	mov	r6,a
      00333A E4               [12] 2111 	clr	a
      00333B 3B               [12] 2112 	addc	a, r3
      00333C FF               [12] 2113 	mov	r7,a
      00333D EE               [12] 2114 	mov	a,r6
      00333E 25 2C            [12] 2115 	add	a, _ProcessPacket_rx_10000_126
      003340 FE               [12] 2116 	mov	r6,a
      003341 EF               [12] 2117 	mov	a,r7
      003342 35 2D            [12] 2118 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003344 FD               [12] 2119 	mov	r5,a
      003345 AF 2E            [24] 2120 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      003347 8E 82            [24] 2121 	mov	dpl,r6
      003349 8D 83            [24] 2122 	mov	dph,r5
      00334B 8F F0            [24] 2123 	mov	b,r7
      00334D 12 35 A8         [24] 2124 	lcall	__gptrget
      003350 FF               [12] 2125 	mov	r7,a
      003351 E4               [12] 2126 	clr	a
      003352 FD               [12] 2127 	mov	r5,a
      003353 48               [12] 2128 	orl	a,r0
      003354 F5 08            [12] 2129 	mov	_IAP_WriteWord_PARM_2,a
      003356 EF               [12] 2130 	mov	a,r7
      003357 4D               [12] 2131 	orl	a,r5
      003358 F5 09            [12] 2132 	mov	(_IAP_WriteWord_PARM_2 + 1),a
                                   2133 ;	bootloader.c:119: if (IAP_WriteWord(addr + i, word) != 0) {
      00335A EA               [12] 2134 	mov	a,r2
      00335B 29               [12] 2135 	add	a, r1
      00335C FA               [12] 2136 	mov	r2,a
      00335D EB               [12] 2137 	mov	a,r3
      00335E 3C               [12] 2138 	addc	a, r4
      00335F FB               [12] 2139 	mov	r3,a
      003360 8A 82            [24] 2140 	mov	dpl,r2
      003362 8B 83            [24] 2141 	mov	dph,r3
      003364 C0 04            [24] 2142 	push	ar4
      003366 C0 01            [24] 2143 	push	ar1
      003368 12 2D 11         [24] 2144 	lcall	_IAP_WriteWord
      00336B E5 82            [12] 2145 	mov	a, dpl
      00336D D0 01            [24] 2146 	pop	ar1
      00336F D0 04            [24] 2147 	pop	ar4
      003371 60 05            [24] 2148 	jz	00133$
                                   2149 ;	bootloader.c:120: err = 1;
      003373 75 37 01         [24] 2150 	mov	_ProcessPacket_err_40000_144,#0x01
                                   2151 ;	bootloader.c:121: break;
      003376 80 09            [24] 2152 	sjmp	00126$
      003378                       2153 00133$:
                                   2154 ;	bootloader.c:117: for (uint8_t i = 0; i < len; i += 2) {
      003378 AD 38            [24] 2155 	mov	r5,_ProcessPacket_i_50000_145
      00337A 74 02            [12] 2156 	mov	a,#0x02
      00337C 2D               [12] 2157 	add	a, r5
      00337D F5 38            [12] 2158 	mov	_ProcessPacket_i_50000_145,a
      00337F 80 8F            [24] 2159 	sjmp	00132$
      003381                       2160 00126$:
                                   2161 ;	bootloader.c:124: reply_buf[59] = err ? STATUS_WRITE_ERR : STATUS_OK;
      003381 E5 37            [12] 2162 	mov	a,_ProcessPacket_err_40000_144
      003383 60 02            [24] 2163 	jz	00136$
      003385 74 04            [12] 2164 	mov	a,#0x04
      003387                       2165 00136$:
      003387 90 00 3B         [24] 2166 	mov	dptr,#(_reply_buf + 0x003b)
      00338A F0               [24] 2167 	movx	@dptr,a
                                   2168 ;	bootloader.c:126: break;
      00338B 02 34 1B         [24] 2169 	ljmp	00130$
                                   2170 ;	bootloader.c:128: case CMD_VERIFY_CRC:
      00338E                       2171 00127$:
                                   2172 ;	bootloader.c:130: uint16_t expected_crc = rx[5] | ((uint16_t)rx[6] << 8);
      00338E 74 05            [12] 2173 	mov	a,#0x05
      003390 25 2C            [12] 2174 	add	a, _ProcessPacket_rx_10000_126
      003392 FD               [12] 2175 	mov	r5,a
      003393 E4               [12] 2176 	clr	a
      003394 35 2D            [12] 2177 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      003396 FE               [12] 2178 	mov	r6,a
      003397 AF 2E            [24] 2179 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      003399 8D 82            [24] 2180 	mov	dpl,r5
      00339B 8E 83            [24] 2181 	mov	dph,r6
      00339D 8F F0            [24] 2182 	mov	b,r7
      00339F 12 35 A8         [24] 2183 	lcall	__gptrget
      0033A2 FD               [12] 2184 	mov	r5,a
      0033A3 74 06            [12] 2185 	mov	a,#0x06
      0033A5 25 2C            [12] 2186 	add	a, _ProcessPacket_rx_10000_126
      0033A7 FC               [12] 2187 	mov	r4,a
      0033A8 E4               [12] 2188 	clr	a
      0033A9 35 2D            [12] 2189 	addc	a, (_ProcessPacket_rx_10000_126 + 1)
      0033AB FE               [12] 2190 	mov	r6,a
      0033AC AF 2E            [24] 2191 	mov	r7,(_ProcessPacket_rx_10000_126 + 2)
      0033AE 8C 82            [24] 2192 	mov	dpl,r4
      0033B0 8E 83            [24] 2193 	mov	dph,r6
      0033B2 8F F0            [24] 2194 	mov	b,r7
      0033B4 12 35 A8         [24] 2195 	lcall	__gptrget
      0033B7 FF               [12] 2196 	mov	r7,a
      0033B8 E4               [12] 2197 	clr	a
      0033B9 FC               [12] 2198 	mov	r4,a
      0033BA FE               [12] 2199 	mov	r6,a
      0033BB ED               [12] 2200 	mov	a,r5
      0033BC 42 04            [12] 2201 	orl	ar4,a
      0033BE EE               [12] 2202 	mov	a,r6
      0033BF 42 07            [12] 2203 	orl	ar7,a
                                   2204 ;	bootloader.c:131: uint16_t calc_crc = IAP_CalculateCRC16(0x0000, addr);
      0033C1 85 31 08         [24] 2205 	mov	_IAP_CalculateCRC16_PARM_2,_ProcessPacket_addr_10000_126
      0033C4 85 32 09         [24] 2206 	mov	(_IAP_CalculateCRC16_PARM_2 + 1),(_ProcessPacket_addr_10000_126 + 1)
      0033C7 90 00 00         [24] 2207 	mov	dptr,#0x0000
      0033CA C0 07            [24] 2208 	push	ar7
      0033CC C0 04            [24] 2209 	push	ar4
      0033CE 12 2D 7F         [24] 2210 	lcall	_IAP_CalculateCRC16
      0033D1 AD 82            [24] 2211 	mov	r5, dpl
      0033D3 AE 83            [24] 2212 	mov	r6, dph
      0033D5 D0 04            [24] 2213 	pop	ar4
      0033D7 D0 07            [24] 2214 	pop	ar7
                                   2215 ;	bootloader.c:132: reply_buf[4] = (uint8_t)(calc_crc & 0xFF);
      0033D9 8D 03            [24] 2216 	mov	ar3,r5
      0033DB 90 00 04         [24] 2217 	mov	dptr,#(_reply_buf + 0x0004)
      0033DE EB               [12] 2218 	mov	a,r3
      0033DF F0               [24] 2219 	movx	@dptr,a
                                   2220 ;	bootloader.c:133: reply_buf[5] = (uint8_t)((calc_crc >> 8) & 0xFF);
      0033E0 8E 03            [24] 2221 	mov	ar3,r6
      0033E2 90 00 05         [24] 2222 	mov	dptr,#(_reply_buf + 0x0005)
      0033E5 EB               [12] 2223 	mov	a,r3
      0033E6 F0               [24] 2224 	movx	@dptr,a
                                   2225 ;	bootloader.c:134: reply_buf[59] = (calc_crc == expected_crc) ? STATUS_OK : STATUS_BAD_CRC;
      0033E7 ED               [12] 2226 	mov	a,r5
      0033E8 B5 04 08         [24] 2227 	cjne	a,ar4,00138$
      0033EB EE               [12] 2228 	mov	a,r6
      0033EC B5 07 04         [24] 2229 	cjne	a,ar7,00138$
      0033EF 7F 00            [12] 2230 	mov	r7,#0x00
      0033F1 80 02            [24] 2231 	sjmp	00139$
      0033F3                       2232 00138$:
      0033F3 7F 01            [12] 2233 	mov	r7,#0x01
      0033F5                       2234 00139$:
      0033F5 90 00 3B         [24] 2235 	mov	dptr,#(_reply_buf + 0x003b)
      0033F8 EF               [12] 2236 	mov	a,r7
      0033F9 F0               [24] 2237 	movx	@dptr,a
                                   2238 ;	bootloader.c:136: break;
                                   2239 ;	bootloader.c:138: case CMD_REBOOT:
      0033FA 80 1F            [24] 2240 	sjmp	00130$
      0033FC                       2241 00128$:
                                   2242 ;	bootloader.c:139: reply_buf[59] = STATUS_OK;
      0033FC 90 00 3B         [24] 2243 	mov	dptr,#(_reply_buf + 0x003b)
      0033FF E4               [12] 2244 	clr	a
      003400 F0               [24] 2245 	movx	@dptr,a
                                   2246 ;	bootloader.c:140: USB_SendReport(reply_buf, 64);
      003401 75 28 40         [24] 2247 	mov	_USB_SendReport_PARM_2,#0x40
      003404 90 00 00         [24] 2248 	mov	dptr,#_reply_buf
      003407 F5 F0            [12] 2249 	mov	b,a
      003409 12 30 74         [24] 2250 	lcall	_USB_SendReport
                                   2251 ;	bootloader.c:141: DelayMs(50);
      00340C 90 00 32         [24] 2252 	mov	dptr,#0x0032
      00340F 12 30 9D         [24] 2253 	lcall	_DelayMs
                                   2254 ;	bootloader.c:142: JumpToApp();
                                   2255 ;	bootloader.c:143: return;
                                   2256 ;	bootloader.c:145: default:
      003412 02 30 C8         [24] 2257 	ljmp	_JumpToApp
      003415                       2258 00129$:
                                   2259 ;	bootloader.c:146: reply_buf[59] = STATUS_UNKNOWN;
      003415 90 00 3B         [24] 2260 	mov	dptr,#(_reply_buf + 0x003b)
      003418 74 FF            [12] 2261 	mov	a,#0xff
      00341A F0               [24] 2262 	movx	@dptr,a
                                   2263 ;	bootloader.c:148: }
      00341B                       2264 00130$:
                                   2265 ;	bootloader.c:150: USB_SendReport(reply_buf, 64);
      00341B 75 28 40         [24] 2266 	mov	_USB_SendReport_PARM_2,#0x40
      00341E 90 00 00         [24] 2267 	mov	dptr,#_reply_buf
      003421 75 F0 00         [24] 2268 	mov	b, #0x00
      003424 12 30 74         [24] 2269 	lcall	_USB_SendReport
                                   2270 ;	bootloader.c:151: USB_ReleaseRx();
                                   2271 ;	bootloader.c:152: }
      003427 02 30 6D         [24] 2272 	ljmp	_USB_ReleaseRx
                                   2273 ;------------------------------------------------------------
                                   2274 ;Allocation info for local variables in function 'main'
                                   2275 ;------------------------------------------------------------
                                   2276 ;button_pressed Allocated to registers r7 
                                   2277 ;first_word    Allocated to registers r5 r6 
                                   2278 ;vec_word      Allocated to registers r3 r4 
                                   2279 ;is_blank      Allocated to registers r6 
                                   2280 ;timeout       Allocated to registers 
                                   2281 ;stay_in_bootloader Allocated to registers r7 
                                   2282 ;------------------------------------------------------------
                                   2283 ;	bootloader.c:154: void main(void) {
                                   2284 ;	-----------------------------------------
                                   2285 ;	 function main
                                   2286 ;	-----------------------------------------
      00342A                       2287 _main:
                                   2288 ;	bootloader.c:156: P3_MOD_OC &= ~(1 << BOOT_PIN_BIT); // Quasi-bidirectional / pull-up mode
      00342A 53 96 FB         [24] 2289 	anl	_P3_MOD_OC,#0xfb
                                   2290 ;	bootloader.c:157: P3_DIR_PU |=  (1 << BOOT_PIN_BIT); // Enable pullup
      00342D 43 97 04         [24] 2291 	orl	_P3_DIR_PU,#0x04
                                   2292 ;	bootloader.c:158: P3_2 = 1; // High impedance input read
                                   2293 ;	assignBit
      003430 D2 B2            [12] 2294 	setb	_P3_2
                                   2295 ;	bootloader.c:161: P1_MOD_OC &= ~(1 << 5);
      003432 53 92 DF         [24] 2296 	anl	_P1_MOD_OC,#0xdf
                                   2297 ;	bootloader.c:162: P1_DIR_PU |=  (1 << 5);
      003435 43 93 20         [24] 2298 	orl	_P1_DIR_PU,#0x20
                                   2299 ;	bootloader.c:163: P1_5 = 1;
                                   2300 ;	assignBit
      003438 D2 95            [12] 2301 	setb	_P1_5
                                   2302 ;	bootloader.c:166: uint8_t button_pressed = (P3_2 == 0) || (P1_5 == 0);
      00343A 30 B2 07         [24] 2303 	jnb	_P3_2,00113$
      00343D 30 95 04         [24] 2304 	jnb	_P1_5,00113$
                                   2305 ;	assignBit
      003440 C2 00            [12] 2306 	clr	_main_sloc0_1_0
      003442 80 02            [24] 2307 	sjmp	00114$
      003444                       2308 00113$:
                                   2309 ;	assignBit
      003444 D2 00            [12] 2310 	setb	_main_sloc0_1_0
      003446                       2311 00114$:
      003446 A2 00            [12] 2312 	mov	c,_main_sloc0_1_0
      003448 E4               [12] 2313 	clr	a
      003449 33               [12] 2314 	rlc	a
      00344A FF               [12] 2315 	mov	r7,a
                                   2316 ;	bootloader.c:169: uint16_t first_word = IAP_ReadWord(0x0000);
      00344B 90 00 00         [24] 2317 	mov	dptr,#0x0000
      00344E C0 07            [24] 2318 	push	ar7
      003450 12 2D 64         [24] 2319 	lcall	_IAP_ReadWord
      003453 AD 82            [24] 2320 	mov	r5, dpl
      003455 AE 83            [24] 2321 	mov	r6, dph
                                   2322 ;	bootloader.c:170: uint16_t vec_word   = IAP_ReadWord(0x0008);
      003457 90 00 08         [24] 2323 	mov	dptr,#0x0008
      00345A C0 06            [24] 2324 	push	ar6
      00345C C0 05            [24] 2325 	push	ar5
      00345E 12 2D 64         [24] 2326 	lcall	_IAP_ReadWord
      003461 AB 82            [24] 2327 	mov	r3, dpl
      003463 AC 83            [24] 2328 	mov	r4, dph
      003465 D0 05            [24] 2329 	pop	ar5
      003467 D0 06            [24] 2330 	pop	ar6
      003469 D0 07            [24] 2331 	pop	ar7
                                   2332 ;	bootloader.c:171: uint8_t is_blank = (first_word == 0xFFFF) || (vec_word == 0xFFFF);
      00346B BD FF 05         [24] 2333 	cjne	r5,#0xff,00193$
      00346E BE FF 02         [24] 2334 	cjne	r6,#0xff,00193$
      003471 80 0C            [24] 2335 	sjmp	00116$
      003473                       2336 00193$:
      003473 BB FF 05         [24] 2337 	cjne	r3,#0xff,00194$
      003476 BC FF 02         [24] 2338 	cjne	r4,#0xff,00194$
      003479 80 04            [24] 2339 	sjmp	00116$
      00347B                       2340 00194$:
                                   2341 ;	assignBit
      00347B C2 00            [12] 2342 	clr	_main_sloc0_1_0
      00347D 80 02            [24] 2343 	sjmp	00117$
      00347F                       2344 00116$:
                                   2345 ;	assignBit
      00347F D2 00            [12] 2346 	setb	_main_sloc0_1_0
      003481                       2347 00117$:
      003481 A2 00            [12] 2348 	mov	c,_main_sloc0_1_0
      003483 E4               [12] 2349 	clr	a
      003484 33               [12] 2350 	rlc	a
      003485 FE               [12] 2351 	mov	r6,a
                                   2352 ;	bootloader.c:174: USB_Init();
      003486 C0 07            [24] 2353 	push	ar7
      003488 C0 06            [24] 2354 	push	ar6
      00348A 12 2D E2         [24] 2355 	lcall	_USB_Init
      00348D D0 06            [24] 2356 	pop	ar6
      00348F D0 07            [24] 2357 	pop	ar7
                                   2358 ;	bootloader.c:178: uint8_t stay_in_bootloader = button_pressed || is_blank;
      003491 EF               [12] 2359 	mov	a,r7
      003492 70 07            [24] 2360 	jnz	00119$
      003494 EE               [12] 2361 	mov	a,r6
      003495 70 04            [24] 2362 	jnz	00119$
                                   2363 ;	assignBit
      003497 C2 00            [12] 2364 	clr	_main_sloc0_1_0
      003499 80 02            [24] 2365 	sjmp	00120$
      00349B                       2366 00119$:
                                   2367 ;	assignBit
      00349B D2 00            [12] 2368 	setb	_main_sloc0_1_0
      00349D                       2369 00120$:
      00349D A2 00            [12] 2370 	mov	c,_main_sloc0_1_0
      00349F E4               [12] 2371 	clr	a
      0034A0 33               [12] 2372 	rlc	a
      0034A1 FF               [12] 2373 	mov	r7,a
                                   2374 ;	bootloader.c:180: while (1) {
      0034A2 7B 00            [12] 2375 	mov	r3,#0x00
      0034A4 7C 00            [12] 2376 	mov	r4,#0x00
      0034A6 7D 00            [12] 2377 	mov	r5,#0x00
      0034A8 7E 00            [12] 2378 	mov	r6,#0x00
      0034AA                       2379 00108$:
                                   2380 ;	bootloader.c:181: USB_Process();
      0034AA C0 07            [24] 2381 	push	ar7
      0034AC C0 06            [24] 2382 	push	ar6
      0034AE C0 05            [24] 2383 	push	ar5
      0034B0 C0 04            [24] 2384 	push	ar4
      0034B2 C0 03            [24] 2385 	push	ar3
      0034B4 12 2F 96         [24] 2386 	lcall	_USB_Process
                                   2387 ;	bootloader.c:183: if (USB_Available()) {
      0034B7 12 30 62         [24] 2388 	lcall	_USB_Available
      0034BA E5 82            [12] 2389 	mov	a, dpl
      0034BC D0 03            [24] 2390 	pop	ar3
      0034BE D0 04            [24] 2391 	pop	ar4
      0034C0 D0 05            [24] 2392 	pop	ar5
      0034C2 D0 06            [24] 2393 	pop	ar6
      0034C4 D0 07            [24] 2394 	pop	ar7
      0034C6 60 19            [24] 2395 	jz	00102$
                                   2396 ;	bootloader.c:184: stay_in_bootloader = 1; // Handshake received, cancel timeout
      0034C8 7F 01            [12] 2397 	mov	r7,#0x01
                                   2398 ;	bootloader.c:185: ProcessPacket();
      0034CA C0 07            [24] 2399 	push	ar7
      0034CC C0 06            [24] 2400 	push	ar6
      0034CE C0 05            [24] 2401 	push	ar5
      0034D0 C0 04            [24] 2402 	push	ar4
      0034D2 C0 03            [24] 2403 	push	ar3
      0034D4 12 30 D5         [24] 2404 	lcall	_ProcessPacket
      0034D7 D0 03            [24] 2405 	pop	ar3
      0034D9 D0 04            [24] 2406 	pop	ar4
      0034DB D0 05            [24] 2407 	pop	ar5
      0034DD D0 06            [24] 2408 	pop	ar6
      0034DF D0 07            [24] 2409 	pop	ar7
      0034E1                       2410 00102$:
                                   2411 ;	bootloader.c:188: if (!stay_in_bootloader) {
      0034E1 EF               [12] 2412 	mov	a,r7
      0034E2 70 C6            [24] 2413 	jnz	00108$
                                   2414 ;	bootloader.c:189: timeout++;
      0034E4 0B               [12] 2415 	inc	r3
      0034E5 BB 00 09         [24] 2416 	cjne	r3,#0x00,00199$
      0034E8 0C               [12] 2417 	inc	r4
      0034E9 BC 00 05         [24] 2418 	cjne	r4,#0x00,00199$
      0034EC 0D               [12] 2419 	inc	r5
      0034ED BD 00 01         [24] 2420 	cjne	r5,#0x00,00199$
      0034F0 0E               [12] 2421 	inc	r6
      0034F1                       2422 00199$:
                                   2423 ;	bootloader.c:190: if (timeout > 2000000UL) { // ~4.0s timeout at 24MHz
      0034F1 C3               [12] 2424 	clr	c
      0034F2 74 80            [12] 2425 	mov	a,#0x80
      0034F4 9B               [12] 2426 	subb	a,r3
      0034F5 74 84            [12] 2427 	mov	a,#0x84
      0034F7 9C               [12] 2428 	subb	a,r4
      0034F8 74 1E            [12] 2429 	mov	a,#0x1e
      0034FA 9D               [12] 2430 	subb	a,r5
      0034FB E4               [12] 2431 	clr	a
      0034FC 9E               [12] 2432 	subb	a,r6
      0034FD 50 AB            [24] 2433 	jnc	00108$
                                   2434 ;	free result
                                   2435 ;	bootloader.c:191: JumpToApp();
      0034FF C0 07            [24] 2436 	push	ar7
      003501 C0 06            [24] 2437 	push	ar6
      003503 C0 05            [24] 2438 	push	ar5
      003505 C0 04            [24] 2439 	push	ar4
      003507 C0 03            [24] 2440 	push	ar3
      003509 12 30 C8         [24] 2441 	lcall	_JumpToApp
      00350C D0 03            [24] 2442 	pop	ar3
      00350E D0 04            [24] 2443 	pop	ar4
      003510 D0 05            [24] 2444 	pop	ar5
      003512 D0 06            [24] 2445 	pop	ar6
      003514 D0 07            [24] 2446 	pop	ar7
                                   2447 ;	bootloader.c:195: }
      003516 02 34 AA         [24] 2448 	ljmp	00108$
                                   2449 	.area CSEG    (CODE)
                                   2450 	.area CONST   (CODE)
                                   2451 	.area CONST   (CODE)
      0035C8                       2452 _DevDesc:
      0035C8 12                    2453 	.db #0x12	; 18
      0035C9 01                    2454 	.db #0x01	; 1
      0035CA 10                    2455 	.db #0x10	; 16
      0035CB 01                    2456 	.db #0x01	; 1
      0035CC 00                    2457 	.db #0x00	; 0
      0035CD 00                    2458 	.db #0x00	; 0
      0035CE 00                    2459 	.db #0x00	; 0
      0035CF 40                    2460 	.db #0x40	; 64
      0035D0 09                    2461 	.db #0x09	; 9
      0035D1 12                    2462 	.db #0x12	; 18
      0035D2 5D                    2463 	.db #0x5d	; 93
      0035D3 C5                    2464 	.db #0xc5	; 197
      0035D4 00                    2465 	.db #0x00	; 0
      0035D5 01                    2466 	.db #0x01	; 1
      0035D6 01                    2467 	.db #0x01	; 1
      0035D7 02                    2468 	.db #0x02	; 2
      0035D8 03                    2469 	.db #0x03	; 3
      0035D9 01                    2470 	.db #0x01	; 1
                                   2471 	.area CSEG    (CODE)
                                   2472 	.area CONST   (CODE)
      0035DA                       2473 _ReportDesc:
      0035DA 06                    2474 	.db #0x06	; 6
      0035DB 00                    2475 	.db #0x00	; 0
      0035DC FF                    2476 	.db #0xff	; 255
      0035DD 09                    2477 	.db #0x09	; 9
      0035DE 01                    2478 	.db #0x01	; 1
      0035DF A1                    2479 	.db #0xa1	; 161
      0035E0 01                    2480 	.db #0x01	; 1
      0035E1 09                    2481 	.db #0x09	; 9
      0035E2 02                    2482 	.db #0x02	; 2
      0035E3 15                    2483 	.db #0x15	; 21
      0035E4 00                    2484 	.db #0x00	; 0
      0035E5 26                    2485 	.db #0x26	; 38
      0035E6 FF                    2486 	.db #0xff	; 255
      0035E7 00                    2487 	.db #0x00	; 0
      0035E8 75                    2488 	.db #0x75	; 117	'u'
      0035E9 08                    2489 	.db #0x08	; 8
      0035EA 95                    2490 	.db #0x95	; 149
      0035EB 40                    2491 	.db #0x40	; 64
      0035EC 91                    2492 	.db #0x91	; 145
      0035ED 02                    2493 	.db #0x02	; 2
      0035EE 09                    2494 	.db #0x09	; 9
      0035EF 03                    2495 	.db #0x03	; 3
      0035F0 15                    2496 	.db #0x15	; 21
      0035F1 00                    2497 	.db #0x00	; 0
      0035F2 26                    2498 	.db #0x26	; 38
      0035F3 FF                    2499 	.db #0xff	; 255
      0035F4 00                    2500 	.db #0x00	; 0
      0035F5 75                    2501 	.db #0x75	; 117	'u'
      0035F6 08                    2502 	.db #0x08	; 8
      0035F7 95                    2503 	.db #0x95	; 149
      0035F8 40                    2504 	.db #0x40	; 64
      0035F9 81                    2505 	.db #0x81	; 129
      0035FA 02                    2506 	.db #0x02	; 2
      0035FB C0                    2507 	.db #0xc0	; 192
                                   2508 	.area CSEG    (CODE)
                                   2509 	.area CONST   (CODE)
      0035FC                       2510 _CfgDesc:
      0035FC 09                    2511 	.db #0x09	; 9
      0035FD 02                    2512 	.db #0x02	; 2
      0035FE 29                    2513 	.db #0x29	; 41
      0035FF 00                    2514 	.db #0x00	; 0
      003600 01                    2515 	.db #0x01	; 1
      003601 01                    2516 	.db #0x01	; 1
      003602 00                    2517 	.db #0x00	; 0
      003603 80                    2518 	.db #0x80	; 128
      003604 32                    2519 	.db #0x32	; 50	'2'
      003605 09                    2520 	.db #0x09	; 9
      003606 04                    2521 	.db #0x04	; 4
      003607 00                    2522 	.db #0x00	; 0
      003608 00                    2523 	.db #0x00	; 0
      003609 02                    2524 	.db #0x02	; 2
      00360A 03                    2525 	.db #0x03	; 3
      00360B 00                    2526 	.db #0x00	; 0
      00360C 00                    2527 	.db #0x00	; 0
      00360D 00                    2528 	.db #0x00	; 0
      00360E 09                    2529 	.db #0x09	; 9
      00360F 21                    2530 	.db #0x21	; 33
      003610 11                    2531 	.db #0x11	; 17
      003611 01                    2532 	.db #0x01	; 1
      003612 00                    2533 	.db #0x00	; 0
      003613 01                    2534 	.db #0x01	; 1
      003614 22                    2535 	.db #0x22	; 34
      003615 22                    2536 	.db #0x22	; 34
      003616 00                    2537 	.db #0x00	; 0
      003617 07                    2538 	.db #0x07	; 7
      003618 05                    2539 	.db #0x05	; 5
      003619 01                    2540 	.db #0x01	; 1
      00361A 03                    2541 	.db #0x03	; 3
      00361B 40                    2542 	.db #0x40	; 64
      00361C 00                    2543 	.db #0x00	; 0
      00361D 01                    2544 	.db #0x01	; 1
      00361E 07                    2545 	.db #0x07	; 7
      00361F 05                    2546 	.db #0x05	; 5
      003620 81                    2547 	.db #0x81	; 129
      003621 03                    2548 	.db #0x03	; 3
      003622 40                    2549 	.db #0x40	; 64
      003623 00                    2550 	.db #0x00	; 0
      003624 01                    2551 	.db #0x01	; 1
                                   2552 	.area CSEG    (CODE)
                                   2553 	.area CONST   (CODE)
      003625                       2554 _Str0Desc:
      003625 04                    2555 	.db #0x04	; 4
      003626 03                    2556 	.db #0x03	; 3
      003627 09                    2557 	.db #0x09	; 9
      003628 04                    2558 	.db #0x04	; 4
                                   2559 	.area CSEG    (CODE)
                                   2560 	.area CONST   (CODE)
      003629                       2561 _Str1Desc:
      003629 0E                    2562 	.db #0x0e	; 14
      00362A 03                    2563 	.db #0x03	; 3
      00362B 44                    2564 	.db #0x44	; 68	'D'
      00362C 00                    2565 	.db #0x00	; 0
      00362D 65                    2566 	.db #0x65	; 101	'e'
      00362E 00                    2567 	.db #0x00	; 0
      00362F 76                    2568 	.db #0x76	; 118	'v'
      003630 00                    2569 	.db #0x00	; 0
      003631 42                    2570 	.db #0x42	; 66	'B'
      003632 00                    2571 	.db #0x00	; 0
      003633 6F                    2572 	.db #0x6f	; 111	'o'
      003634 00                    2573 	.db #0x00	; 0
      003635 78                    2574 	.db #0x78	; 120	'x'
      003636 00                    2575 	.db #0x00	; 0
                                   2576 	.area CSEG    (CODE)
                                   2577 	.area CONST   (CODE)
      003637                       2578 _Str2Desc:
      003637 20                    2579 	.db #0x20	; 32
      003638 03                    2580 	.db #0x03	; 3
      003639 49                    2581 	.db #0x49	; 73	'I'
      00363A 00                    2582 	.db #0x00	; 0
      00363B 64                    2583 	.db #0x64	; 100	'd'
      00363C 00                    2584 	.db #0x00	; 0
      00363D 61                    2585 	.db #0x61	; 97	'a'
      00363E 00                    2586 	.db #0x00	; 0
      00363F 6E                    2587 	.db #0x6e	; 110	'n'
      003640 00                    2588 	.db #0x00	; 0
      003641 27                    2589 	.db #0x27	; 39
      003642 00                    2590 	.db #0x00	; 0
      003643 73                    2591 	.db #0x73	; 115	's'
      003644 00                    2592 	.db #0x00	; 0
      003645 20                    2593 	.db #0x20	; 32
      003646 00                    2594 	.db #0x00	; 0
      003647 44                    2595 	.db #0x44	; 68	'D'
      003648 00                    2596 	.db #0x00	; 0
      003649 65                    2597 	.db #0x65	; 101	'e'
      00364A 00                    2598 	.db #0x00	; 0
      00364B 76                    2599 	.db #0x76	; 118	'v'
      00364C 00                    2600 	.db #0x00	; 0
      00364D 42                    2601 	.db #0x42	; 66	'B'
      00364E 00                    2602 	.db #0x00	; 0
      00364F 6F                    2603 	.db #0x6f	; 111	'o'
      003650 00                    2604 	.db #0x00	; 0
      003651 61                    2605 	.db #0x61	; 97	'a'
      003652 00                    2606 	.db #0x00	; 0
      003653 72                    2607 	.db #0x72	; 114	'r'
      003654 00                    2608 	.db #0x00	; 0
      003655 64                    2609 	.db #0x64	; 100	'd'
      003656 00                    2610 	.db #0x00	; 0
                                   2611 	.area CSEG    (CODE)
                                   2612 	.area CONST   (CODE)
      003657                       2613 _Str3Desc:
      003657 0A                    2614 	.db #0x0a	; 10
      003658 03                    2615 	.db #0x03	; 3
      003659 76                    2616 	.db #0x76	; 118	'v'
      00365A 00                    2617 	.db #0x00	; 0
      00365B 31                    2618 	.db #0x31	; 49	'1'
      00365C 00                    2619 	.db #0x00	; 0
      00365D 2E                    2620 	.db #0x2e	; 46
      00365E 00                    2621 	.db #0x00	; 0
      00365F 30                    2622 	.db #0x30	; 48	'0'
      003660 00                    2623 	.db #0x00	; 0
                                   2624 	.area CSEG    (CODE)
                                   2625 	.area XINIT   (CODE)
                                   2626 	.area CABS    (ABS,CODE)
