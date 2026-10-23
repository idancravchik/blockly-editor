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
                                    272 	.globl _IAP_ErasePage
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
      00002A                        563 _ProcessPacket_rx_10000_125:
      00002A                        564 	.ds 3
      00002D                        565 _ProcessPacket_cmd_10000_125:
      00002D                        566 	.ds 1
      00002E                        567 _ProcessPacket_seq_10000_125:
      00002E                        568 	.ds 1
      00002F                        569 _ProcessPacket_addr_10000_125:
      00002F                        570 	.ds 2
      000031                        571 _ProcessPacket_len_10000_125:
      000031                        572 	.ds 1
      000032                        573 _ProcessPacket_err_40000_139:
      000032                        574 	.ds 1
      000033                        575 _ProcessPacket_i_50000_140:
      000033                        576 	.ds 1
      000034                        577 _ProcessPacket_sloc0_1_0:
      000034                        578 	.ds 1
      000035                        579 _ProcessPacket_sloc1_1_0:
      000035                        580 	.ds 2
      000037                        581 _ProcessPacket_sloc2_1_0:
      000037                        582 	.ds 3
                                    583 ;--------------------------------------------------------
                                    584 ; overlayable items in internal ram
                                    585 ;--------------------------------------------------------
                                    586 	.area	OSEG    (OVR,DATA)
      000008                        587 _IAP_WriteWord_PARM_2:
      000008                        588 	.ds 2
                                    589 	.area	OSEG    (OVR,DATA)
                                    590 	.area	OSEG    (OVR,DATA)
      000008                        591 _IAP_CalculateCRC16_PARM_2:
      000008                        592 	.ds 2
      00000A                        593 _IAP_CalculateCRC16_i_20000_22:
      00000A                        594 	.ds 2
                                    595 	.area	OSEG    (OVR,DATA)
                                    596 	.area	OSEG    (OVR,DATA)
                                    597 ;--------------------------------------------------------
                                    598 ; Stack segment in internal ram
                                    599 ;--------------------------------------------------------
                                    600 	.area SSEG
      00003A                        601 __start__stack:
      00003A                        602 	.ds	1
                                    603 
                                    604 ;--------------------------------------------------------
                                    605 ; indirectly addressable internal ram data
                                    606 ;--------------------------------------------------------
                                    607 	.area ISEG    (DATA)
                                    608 ;--------------------------------------------------------
                                    609 ; absolute internal ram data
                                    610 ;--------------------------------------------------------
                                    611 	.area IABS    (ABS,DATA)
                                    612 	.area IABS    (ABS,DATA)
                                    613 ;--------------------------------------------------------
                                    614 ; bit data
                                    615 ;--------------------------------------------------------
                                    616 	.area BSEG    (BIT)
      000000                        617 _main_sloc0_1_0:
      000000                        618 	.ds 1
                                    619 ;--------------------------------------------------------
                                    620 ; paged external ram data
                                    621 ;--------------------------------------------------------
                                    622 	.area PSEG    (PAG,XDATA)
                                    623 ;--------------------------------------------------------
                                    624 ; uninitialized external ram data
                                    625 ;--------------------------------------------------------
                                    626 	.area XSEG    (XDATA)
                           000000   627 _Ep0Buffer	=	0x0000
                           000040   628 _Ep1Buffer	=	0x0040
      000000                        629 _reply_buf:
      000000                        630 	.ds 64
                                    631 ;--------------------------------------------------------
                                    632 ; absolute external ram data
                                    633 ;--------------------------------------------------------
                                    634 	.area XABS    (ABS,XDATA)
                                    635 ;--------------------------------------------------------
                                    636 ; initialized external ram data
                                    637 ;--------------------------------------------------------
                                    638 	.area XISEG   (XDATA)
                                    639 	.area HOME    (CODE)
                                    640 	.area GSINIT0 (CODE)
                                    641 	.area GSINIT1 (CODE)
                                    642 	.area GSINIT2 (CODE)
                                    643 	.area GSINIT3 (CODE)
                                    644 	.area GSINIT4 (CODE)
                                    645 	.area GSINIT5 (CODE)
                                    646 	.area GSINIT  (CODE)
                                    647 	.area GSFINAL (CODE)
                                    648 	.area CSEG    (CODE)
                                    649 ;--------------------------------------------------------
                                    650 ; interrupt vector
                                    651 ;--------------------------------------------------------
                                    652 	.area HOME    (CODE)
      002C00                        653 __interrupt_vect:
      002C00 02 2C 4E         [24]  654 	ljmp	__sdcc_gsinit_startup
                                    655 ; restartable atomic support routines
      002C03                        656 	.ds	5
      002C08                        657 sdcc_atomic_exchange_rollback_start::
      002C08 00               [12]  658 	nop
      002C09 00               [12]  659 	nop
      002C0A                        660 sdcc_atomic_exchange_pdata_impl:
      002C0A E2               [24]  661 	movx	a, @r0
      002C0B FB               [12]  662 	mov	r3, a
      002C0C EA               [12]  663 	mov	a, r2
      002C0D F2               [24]  664 	movx	@r0, a
      002C0E 80 2C            [24]  665 	sjmp	sdcc_atomic_exchange_exit
      002C10 00               [12]  666 	nop
      002C11 00               [12]  667 	nop
      002C12                        668 sdcc_atomic_exchange_xdata_impl:
      002C12 E0               [24]  669 	movx	a, @dptr
      002C13 FB               [12]  670 	mov	r3, a
      002C14 EA               [12]  671 	mov	a, r2
      002C15 F0               [24]  672 	movx	@dptr, a
      002C16 80 24            [24]  673 	sjmp	sdcc_atomic_exchange_exit
      002C18                        674 sdcc_atomic_compare_exchange_idata_impl:
      002C18 E6               [12]  675 	mov	a, @r0
      002C19 B5 02 02         [24]  676 	cjne	a, ar2, .+#5
      002C1C EB               [12]  677 	mov	a, r3
      002C1D F6               [12]  678 	mov	@r0, a
      002C1E 22               [24]  679 	ret
      002C1F 00               [12]  680 	nop
      002C20                        681 sdcc_atomic_compare_exchange_pdata_impl:
      002C20 E2               [24]  682 	movx	a, @r0
      002C21 B5 02 02         [24]  683 	cjne	a, ar2, .+#5
      002C24 EB               [12]  684 	mov	a, r3
      002C25 F2               [24]  685 	movx	@r0, a
      002C26 22               [24]  686 	ret
      002C27 00               [12]  687 	nop
      002C28                        688 sdcc_atomic_compare_exchange_xdata_impl:
      002C28 E0               [24]  689 	movx	a, @dptr
      002C29 B5 02 02         [24]  690 	cjne	a, ar2, .+#5
      002C2C EB               [12]  691 	mov	a, r3
      002C2D F0               [24]  692 	movx	@dptr, a
      002C2E 22               [24]  693 	ret
      002C2F                        694 sdcc_atomic_exchange_rollback_end::
                                    695 
      002C2F                        696 sdcc_atomic_exchange_gptr_impl::
      002C2F 30 F6 E0         [24]  697 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      002C32 A8 82            [24]  698 	mov	r0, dpl
      002C34 20 F5 D3         [24]  699 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      002C37                        700 sdcc_atomic_exchange_idata_impl:
      002C37 EA               [12]  701 	mov	a, r2
      002C38 C6               [12]  702 	xch	a, @r0
      002C39 F5 82            [12]  703 	mov	dpl, a
      002C3B 22               [24]  704 	ret
      002C3C                        705 sdcc_atomic_exchange_exit:
      002C3C 8B 82            [24]  706 	mov	dpl, r3
      002C3E 22               [24]  707 	ret
      002C3F                        708 sdcc_atomic_compare_exchange_gptr_impl::
      002C3F 30 F6 E6         [24]  709 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      002C42 A8 82            [24]  710 	mov	r0, dpl
      002C44 20 F5 D9         [24]  711 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      002C47 80 CF            [24]  712 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    713 ;--------------------------------------------------------
                                    714 ; global & static initialisations
                                    715 ;--------------------------------------------------------
                                    716 	.area HOME    (CODE)
                                    717 	.area GSINIT  (CODE)
                                    718 	.area GSFINAL (CODE)
                                    719 	.area GSINIT  (CODE)
                                    720 	.globl __sdcc_gsinit_startup
                                    721 	.globl __sdcc_program_startup
                                    722 	.globl __start__stack
                                    723 	.globl __mcs51_genXINIT
                                    724 	.globl __mcs51_genXRAMCLEAR
                                    725 	.globl __mcs51_genRAMCLEAR
                                    726 ;	usb_hid.c:10: static volatile uint8_t rx_ready = 0;
      002CA7 75 21 00         [24]  727 	mov	_rx_ready,#0x00
                                    728 ;	usb_hid.c:11: static uint8_t usb_dev_addr = 0;
      002CAA 75 22 00         [24]  729 	mov	_usb_dev_addr,#0x00
                                    730 ;	usb_hid.c:12: static uint8_t usb_config = 0;
      002CAD 75 23 00         [24]  731 	mov	_usb_config,#0x00
                                    732 ;	usb_hid.c:117: static __code const uint8_t *setup_tx_ptr = 0;
      002CB0 E4               [12]  733 	clr	a
      002CB1 F5 24            [12]  734 	mov	_setup_tx_ptr,a
      002CB3 F5 25            [12]  735 	mov	(_setup_tx_ptr + 1),a
                                    736 ;	usb_hid.c:118: static uint16_t setup_tx_len = 0;
      002CB5 F5 26            [12]  737 	mov	_setup_tx_len,a
      002CB7 F5 27            [12]  738 	mov	(_setup_tx_len + 1),a
                                    739 ;	bootloader.c:27: static uint8_t is_unlocked = 0;
      002CB9 F5 29            [12]  740 	mov	_is_unlocked,a
                                    741 	.area GSFINAL (CODE)
      002CBB 02 2C 49         [24]  742 	ljmp	__sdcc_program_startup
                                    743 ;--------------------------------------------------------
                                    744 ; Home
                                    745 ;--------------------------------------------------------
                                    746 	.area HOME    (CODE)
                                    747 	.area HOME    (CODE)
      002C49                        748 __sdcc_program_startup:
      002C49 12 33 C0         [24]  749 	lcall	_main
      002C4C                        750 __sdcc_program_exit:
      002C4C 80 FE            [24]  751 	sjmp	.
                                    752 ;	return from main will return to caller
                                    753 ;--------------------------------------------------------
                                    754 ; code
                                    755 ;--------------------------------------------------------
                                    756 	.area CSEG    (CODE)
                                    757 ;------------------------------------------------------------
                                    758 ;Allocation info for local variables in function 'IAP_WriteWord'
                                    759 ;------------------------------------------------------------
                                    760 ;data_word     Allocated with name '_IAP_WriteWord_PARM_2'
                                    761 ;addr          Allocated to registers r6 r7 
                                    762 ;status        Allocated to registers r7 
                                    763 ;------------------------------------------------------------
                                    764 ;	iap_flash.c:3: uint8_t IAP_WriteWord(uint16_t addr, uint16_t data_word) {
                                    765 ;	-----------------------------------------
                                    766 ;	 function IAP_WriteWord
                                    767 ;	-----------------------------------------
      002CBE                        768 _IAP_WriteWord:
                           000007   769 	ar7 = 0x07
                           000006   770 	ar6 = 0x06
                           000005   771 	ar5 = 0x05
                           000004   772 	ar4 = 0x04
                           000003   773 	ar3 = 0x03
                           000002   774 	ar2 = 0x02
                           000001   775 	ar1 = 0x01
                           000000   776 	ar0 = 0x00
      002CBE AE 82            [24]  777 	mov	r6, dpl
      002CC0 AF 83            [24]  778 	mov	r7, dph
                                    779 ;	iap_flash.c:7: if (addr >= BOOTLOADER_START) {
      002CC2 74 D4            [12]  780 	mov	a,#0x100 - 0x2c
      002CC4 2F               [12]  781 	add	a,r7
      002CC5 50 04            [24]  782 	jnc	00102$
                                    783 ;	iap_flash.c:8: return 0x03; // Out of bounds error
      002CC7 75 82 03         [24]  784 	mov	dpl, #0x03
      002CCA 22               [24]  785 	ret
      002CCB                        786 00102$:
                                    787 ;	iap_flash.c:12: addr &= ~0x0001;
      002CCB 53 06 FE         [24]  788 	anl	ar6,#0xfe
                                    789 ;	iap_flash.c:15: EA = 0;
                                    790 ;	assignBit
      002CCE C2 AF            [12]  791 	clr	_EA
                                    792 ;	iap_flash.c:18: SAFE_MOD = 0x55;
      002CD0 75 A1 55         [24]  793 	mov	_SAFE_MOD,#0x55
                                    794 ;	iap_flash.c:19: SAFE_MOD = 0xAA;
      002CD3 75 A1 AA         [24]  795 	mov	_SAFE_MOD,#0xaa
                                    796 ;	iap_flash.c:20: GLOBAL_CFG |= bCODE_WE;
      002CD6 43 B1 08         [24]  797 	orl	_GLOBAL_CFG,#0x08
                                    798 ;	iap_flash.c:21: SAFE_MOD = 0x00;
      002CD9 75 A1 00         [24]  799 	mov	_SAFE_MOD,#0x00
                                    800 ;	iap_flash.c:24: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
      002CDC 8E 84            [24]  801 	mov	_ROM_ADDR_L,r6
                                    802 ;	iap_flash.c:25: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
      002CDE 8F 85            [24]  803 	mov	_ROM_ADDR_H,r7
                                    804 ;	iap_flash.c:26: ROM_DATA_L = (uint8_t)(data_word & 0xFF);
      002CE0 85 08 8E         [24]  805 	mov	_ROM_DATA_L,_IAP_WriteWord_PARM_2
                                    806 ;	iap_flash.c:27: ROM_DATA_H = (uint8_t)((data_word >> 8) & 0xFF);
      002CE3 85 09 8F         [24]  807 	mov	_ROM_DATA_H,(_IAP_WriteWord_PARM_2 + 1)
                                    808 ;	iap_flash.c:30: ROM_CTRL = ROM_CMD_WRITE;
      002CE6 75 86 9A         [24]  809 	mov	_ROM_CTRL,#0x9a
                                    810 ;	iap_flash.c:33: status = ROM_STATUS;
      002CE9 AF 86            [24]  811 	mov	r7,_ROM_CTRL
                                    812 ;	iap_flash.c:36: SAFE_MOD = 0x55;
      002CEB 75 A1 55         [24]  813 	mov	_SAFE_MOD,#0x55
                                    814 ;	iap_flash.c:37: SAFE_MOD = 0xAA;
      002CEE 75 A1 AA         [24]  815 	mov	_SAFE_MOD,#0xaa
                                    816 ;	iap_flash.c:38: GLOBAL_CFG &= ~bCODE_WE;
      002CF1 53 B1 F7         [24]  817 	anl	_GLOBAL_CFG,#0xf7
                                    818 ;	iap_flash.c:39: SAFE_MOD = 0x00;
      002CF4 75 A1 00         [24]  819 	mov	_SAFE_MOD,#0x00
                                    820 ;	iap_flash.c:42: EA = 1;
                                    821 ;	assignBit
      002CF7 D2 AF            [12]  822 	setb	_EA
                                    823 ;	iap_flash.c:45: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
      002CF9 EF               [12]  824 	mov	a,r7
      002CFA 20 E1 04         [24]  825 	jb	acc.1,00103$
      002CFD EF               [12]  826 	mov	a,r7
      002CFE 20 E6 04         [24]  827 	jb	acc.6,00104$
      002D01                        828 00103$:
                                    829 ;	iap_flash.c:46: return 0x04; // Write error
      002D01 75 82 04         [24]  830 	mov	dpl, #0x04
      002D04 22               [24]  831 	ret
      002D05                        832 00104$:
                                    833 ;	iap_flash.c:48: return 0x00;
      002D05 75 82 00         [24]  834 	mov	dpl, #0x00
                                    835 ;	iap_flash.c:49: }
      002D08 22               [24]  836 	ret
                                    837 ;------------------------------------------------------------
                                    838 ;Allocation info for local variables in function 'IAP_ReadWord'
                                    839 ;------------------------------------------------------------
                                    840 ;addr          Allocated to registers r6 r7 
                                    841 ;low           Allocated to registers r5 
                                    842 ;high          Allocated to registers 
                                    843 ;ptr           Allocated to registers r6 r7 
                                    844 ;------------------------------------------------------------
                                    845 ;	iap_flash.c:51: uint16_t IAP_ReadWord(uint16_t addr) {
                                    846 ;	-----------------------------------------
                                    847 ;	 function IAP_ReadWord
                                    848 ;	-----------------------------------------
      002D09                        849 _IAP_ReadWord:
                                    850 ;	iap_flash.c:53: __code const uint8_t *ptr = (__code const uint8_t *)addr;
                                    851 ;	iap_flash.c:54: low = *ptr;
      002D09 AE 82            [24]  852 	mov	r6,dpl
      002D0B AF 83            [24]  853 	mov  r7,dph
      002D0D E4               [12]  854 	clr	a
      002D0E 93               [24]  855 	movc	a,@a+dptr
      002D0F FD               [12]  856 	mov	r5,a
                                    857 ;	iap_flash.c:55: high = *(ptr + 1);
      002D10 8E 82            [24]  858 	mov	dpl,r6
      002D12 8F 83            [24]  859 	mov	dph,r7
      002D14 A3               [24]  860 	inc	dptr
      002D15 E4               [12]  861 	clr	a
      002D16 93               [24]  862 	movc	a,@a+dptr
                                    863 ;	iap_flash.c:56: return ((uint16_t)high << 8) | low;
      002D17 FE               [12]  864 	mov	r6,a
      002D18 E4               [12]  865 	clr	a
      002D19 FF               [12]  866 	mov	r7,a
      002D1A FC               [12]  867 	mov	r4,a
      002D1B ED               [12]  868 	mov	a,r5
      002D1C 4F               [12]  869 	orl	a,r7
      002D1D F5 82            [12]  870 	mov	dpl,a
      002D1F EC               [12]  871 	mov	a,r4
      002D20 4E               [12]  872 	orl	a,r6
      002D21 F5 83            [12]  873 	mov	dph,a
                                    874 ;	iap_flash.c:57: }
      002D23 22               [24]  875 	ret
                                    876 ;------------------------------------------------------------
                                    877 ;Allocation info for local variables in function 'IAP_CalculateCRC16'
                                    878 ;------------------------------------------------------------
                                    879 ;length        Allocated with name '_IAP_CalculateCRC16_PARM_2'
                                    880 ;start_addr    Allocated to registers r6 r7 
                                    881 ;crc           Allocated to registers r4 r5 
                                    882 ;ptr           Allocated to registers 
                                    883 ;i             Allocated with name '_IAP_CalculateCRC16_i_20000_22'
                                    884 ;byte          Allocated to registers 
                                    885 ;b             Allocated to registers r1 
                                    886 ;------------------------------------------------------------
                                    887 ;	iap_flash.c:59: uint16_t IAP_CalculateCRC16(uint16_t start_addr, uint16_t length) {
                                    888 ;	-----------------------------------------
                                    889 ;	 function IAP_CalculateCRC16
                                    890 ;	-----------------------------------------
      002D24                        891 _IAP_CalculateCRC16:
      002D24 AE 82            [24]  892 	mov	r6, dpl
      002D26 AF 83            [24]  893 	mov	r7, dph
                                    894 ;	iap_flash.c:60: uint16_t crc = 0xFFFF;
      002D28 7C FF            [12]  895 	mov	r4,#0xff
      002D2A 7D FF            [12]  896 	mov	r5,#0xff
                                    897 ;	iap_flash.c:61: __code const uint8_t *ptr = (__code const uint8_t *)start_addr;
                                    898 ;	iap_flash.c:63: for (uint16_t i = 0; i < length; i++) {
      002D2C E4               [12]  899 	clr	a
      002D2D F5 0A            [12]  900 	mov	_IAP_CalculateCRC16_i_20000_22,a
      002D2F F5 0B            [12]  901 	mov	(_IAP_CalculateCRC16_i_20000_22 + 1),a
      002D31                        902 00110$:
      002D31 C3               [12]  903 	clr	c
      002D32 E5 0A            [12]  904 	mov	a,_IAP_CalculateCRC16_i_20000_22
      002D34 95 08            [12]  905 	subb	a,_IAP_CalculateCRC16_PARM_2
      002D36 E5 0B            [12]  906 	mov	a,(_IAP_CalculateCRC16_i_20000_22 + 1)
      002D38 95 09            [12]  907 	subb	a,(_IAP_CalculateCRC16_PARM_2 + 1)
      002D3A 50 46            [24]  908 	jnc	00105$
                                    909 ;	iap_flash.c:64: uint8_t byte = *ptr++;
      002D3C 8E 82            [24]  910 	mov	dpl,r6
      002D3E 8F 83            [24]  911 	mov	dph,r7
      002D40 E4               [12]  912 	clr	a
      002D41 93               [24]  913 	movc	a,@a+dptr
      002D42 F9               [12]  914 	mov	r1,a
      002D43 A3               [24]  915 	inc	dptr
      002D44 AE 82            [24]  916 	mov	r6,dpl
      002D46 AF 83            [24]  917 	mov	r7,dph
                                    918 ;	iap_flash.c:65: crc ^= ((uint16_t)byte << 8);
      002D48 89 00            [24]  919 	mov	ar0,r1
      002D4A 88 01            [24]  920 	mov	ar1,r0
      002D4C E4               [12]  921 	clr	a
      002D4D 62 04            [12]  922 	xrl	ar4,a
      002D4F E9               [12]  923 	mov	a,r1
      002D50 62 05            [12]  924 	xrl	ar5,a
                                    925 ;	iap_flash.c:66: for (uint8_t b = 0; b < 8; b++) {
      002D52 79 00            [12]  926 	mov	r1,#0x00
      002D54                        927 00107$:
      002D54 B9 08 00         [24]  928 	cjne	r1,#0x08,00152$
      002D57                        929 00152$:
      002D57 50 1F            [24]  930 	jnc	00111$
                                    931 ;	iap_flash.c:67: if (crc & 0x8000) {
      002D59 ED               [12]  932 	mov	a,r5
      002D5A 30 E7 12         [24]  933 	jnb	acc.7,00102$
                                    934 ;	iap_flash.c:68: crc = (crc << 1) ^ 0x1021;
      002D5D EC               [12]  935 	mov	a,r4
      002D5E 2C               [12]  936 	add	a,r4
      002D5F F8               [12]  937 	mov	r0,a
      002D60 ED               [12]  938 	mov	a,r5
      002D61 33               [12]  939 	rlc	a
      002D62 FB               [12]  940 	mov	r3,a
      002D63 63 00 21         [24]  941 	xrl	ar0,#0x21
      002D66 63 03 10         [24]  942 	xrl	ar3,#0x10
      002D69 88 04            [24]  943 	mov	ar4,r0
      002D6B 8B 05            [24]  944 	mov	ar5,r3
      002D6D 80 06            [24]  945 	sjmp	00108$
      002D6F                        946 00102$:
                                    947 ;	iap_flash.c:70: crc <<= 1;
      002D6F EC               [12]  948 	mov	a,r4
      002D70 2C               [12]  949 	add	a,r4
      002D71 FC               [12]  950 	mov	r4,a
      002D72 ED               [12]  951 	mov	a,r5
      002D73 33               [12]  952 	rlc	a
      002D74 FD               [12]  953 	mov	r5,a
      002D75                        954 00108$:
                                    955 ;	iap_flash.c:66: for (uint8_t b = 0; b < 8; b++) {
      002D75 09               [12]  956 	inc	r1
      002D76 80 DC            [24]  957 	sjmp	00107$
      002D78                        958 00111$:
                                    959 ;	iap_flash.c:63: for (uint16_t i = 0; i < length; i++) {
      002D78 05 0A            [12]  960 	inc	_IAP_CalculateCRC16_i_20000_22
      002D7A E4               [12]  961 	clr	a
      002D7B B5 0A B3         [24]  962 	cjne	a,_IAP_CalculateCRC16_i_20000_22,00110$
      002D7E 05 0B            [12]  963 	inc	(_IAP_CalculateCRC16_i_20000_22 + 1)
      002D80 80 AF            [24]  964 	sjmp	00110$
      002D82                        965 00105$:
                                    966 ;	iap_flash.c:74: return crc;
      002D82 8C 82            [24]  967 	mov	dpl, r4
      002D84 8D 83            [24]  968 	mov	dph, r5
                                    969 ;	iap_flash.c:75: }
      002D86 22               [24]  970 	ret
                                    971 ;------------------------------------------------------------
                                    972 ;Allocation info for local variables in function 'IAP_ErasePage'
                                    973 ;------------------------------------------------------------
                                    974 ;addr          Allocated to registers r6 r7 
                                    975 ;status        Allocated to registers r7 
                                    976 ;ea_saved      Allocated to registers r5 
                                    977 ;------------------------------------------------------------
                                    978 ;	iap_flash.c:81: uint8_t IAP_ErasePage(uint16_t addr) {
                                    979 ;	-----------------------------------------
                                    980 ;	 function IAP_ErasePage
                                    981 ;	-----------------------------------------
      002D87                        982 _IAP_ErasePage:
      002D87 AF 83            [24]  983 	mov	r7, dph
                                    984 ;	iap_flash.c:85: if (addr >= BOOTLOADER_START) return 0x03;
      002D89 74 D4            [12]  985 	mov	a,#0x100 - 0x2c
      002D8B 2F               [12]  986 	add	a,r7
      002D8C 50 04            [24]  987 	jnc	00102$
      002D8E 75 82 03         [24]  988 	mov	dpl, #0x03
      002D91 22               [24]  989 	ret
      002D92                        990 00102$:
                                    991 ;	iap_flash.c:87: addr &= ~0x03FF; // יישור לבלוק 1KB
      002D92 7E 00            [12]  992 	mov	r6,#0x00
      002D94 53 07 FC         [24]  993 	anl	ar7,#0xfc
                                    994 ;	iap_flash.c:89: ea_saved = EA;
      002D97 A2 AF            [12]  995 	mov	c,_EA
      002D99 E4               [12]  996 	clr	a
      002D9A 33               [12]  997 	rlc	a
      002D9B FD               [12]  998 	mov	r5,a
                                    999 ;	iap_flash.c:90: EA = 0;
                                   1000 ;	assignBit
      002D9C C2 AF            [12] 1001 	clr	_EA
                                   1002 ;	iap_flash.c:93: SAFE_MOD = 0x55;
      002D9E 75 A1 55         [24] 1003 	mov	_SAFE_MOD,#0x55
                                   1004 ;	iap_flash.c:94: SAFE_MOD = 0xAA;
      002DA1 75 A1 AA         [24] 1005 	mov	_SAFE_MOD,#0xaa
                                   1006 ;	iap_flash.c:95: GLOBAL_CFG |= bCODE_WE;
      002DA4 43 B1 08         [24] 1007 	orl	_GLOBAL_CFG,#0x08
                                   1008 ;	iap_flash.c:97: ROM_ADDR_L = (uint8_t)(addr & 0xFF);
      002DA7 8E 84            [24] 1009 	mov	_ROM_ADDR_L,r6
                                   1010 ;	iap_flash.c:98: ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
      002DA9 8F 85            [24] 1011 	mov	_ROM_ADDR_H,r7
                                   1012 ;	iap_flash.c:100: ROM_CTRL = ROM_CMD_ERASE; // ביצוע המחיקה כשה-Safe Mode עדיין פתוח!
      002DAB 75 86 A6         [24] 1013 	mov	_ROM_CTRL,#0xa6
                                   1014 ;	iap_flash.c:102: status = ROM_STATUS;
      002DAE AF 86            [24] 1015 	mov	r7,_ROM_CTRL
                                   1016 ;	iap_flash.c:105: SAFE_MOD = 0x55;
      002DB0 75 A1 55         [24] 1017 	mov	_SAFE_MOD,#0x55
                                   1018 ;	iap_flash.c:106: SAFE_MOD = 0xAA;
      002DB3 75 A1 AA         [24] 1019 	mov	_SAFE_MOD,#0xaa
                                   1020 ;	iap_flash.c:107: GLOBAL_CFG &= ~bCODE_WE;
      002DB6 53 B1 F7         [24] 1021 	anl	_GLOBAL_CFG,#0xf7
                                   1022 ;	iap_flash.c:108: SAFE_MOD = 0x00;
      002DB9 75 A1 00         [24] 1023 	mov	_SAFE_MOD,#0x00
                                   1024 ;	iap_flash.c:110: EA = ea_saved;
                                   1025 ;	assignBit
      002DBC ED               [12] 1026 	mov	a,r5
      002DBD 24 FF            [12] 1027 	add	a,#0xff
      002DBF 92 AF            [24] 1028 	mov	_EA,c
                                   1029 ;	iap_flash.c:112: if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
      002DC1 EF               [12] 1030 	mov	a,r7
      002DC2 20 E1 04         [24] 1031 	jb	acc.1,00103$
      002DC5 EF               [12] 1032 	mov	a,r7
      002DC6 20 E6 04         [24] 1033 	jb	acc.6,00104$
      002DC9                       1034 00103$:
                                   1035 ;	iap_flash.c:113: return 0x04;
      002DC9 75 82 04         [24] 1036 	mov	dpl, #0x04
      002DCC 22               [24] 1037 	ret
      002DCD                       1038 00104$:
                                   1039 ;	iap_flash.c:115: return 0x00;
      002DCD 75 82 00         [24] 1040 	mov	dpl, #0x00
                                   1041 ;	iap_flash.c:116: }
      002DD0 22               [24] 1042 	ret
                                   1043 ;------------------------------------------------------------
                                   1044 ;Allocation info for local variables in function 'USB_Init'
                                   1045 ;------------------------------------------------------------
                                   1046 ;	usb_hid.c:120: void USB_Init(void) {
                                   1047 ;	-----------------------------------------
                                   1048 ;	 function USB_Init
                                   1049 ;	-----------------------------------------
      002DD1                       1050 _USB_Init:
                                   1051 ;	usb_hid.c:122: SAFE_MOD = 0x55;
      002DD1 75 A1 55         [24] 1052 	mov	_SAFE_MOD,#0x55
                                   1053 ;	usb_hid.c:123: SAFE_MOD = 0xAA;
      002DD4 75 A1 AA         [24] 1054 	mov	_SAFE_MOD,#0xaa
                                   1055 ;	usb_hid.c:124: CLOCK_CFG = 0x86; // 24MHz internal clock
      002DD7 75 B9 86         [24] 1056 	mov	_CLOCK_CFG,#0x86
                                   1057 ;	usb_hid.c:125: SAFE_MOD = 0x00;
      002DDA 75 A1 00         [24] 1058 	mov	_SAFE_MOD,#0x00
                                   1059 ;	usb_hid.c:128: USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL;
      002DDD 75 E2 06         [24] 1060 	mov	_USB_CTRL,#0x06
                                   1061 ;	usb_hid.c:129: USB_CTRL = 0x00;
      002DE0 75 E2 00         [24] 1062 	mov	_USB_CTRL,#0x00
                                   1063 ;	usb_hid.c:132: UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
      002DE3 75 EC 00         [24] 1064 	mov	_UEP0_DMA_L,#_Ep0Buffer
                                   1065 ;	usb_hid.c:133: UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
      002DE6 7E 00            [12] 1066 	mov	r6,#_Ep0Buffer
      002DE8 7F 00            [12] 1067 	mov	r7,#(_Ep0Buffer >> 8)
      002DEA 8F ED            [24] 1068 	mov	_UEP0_DMA_H,r7
                                   1069 ;	usb_hid.c:135: UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
      002DEC 75 EE 40         [24] 1070 	mov	_UEP1_DMA_L,#_Ep1Buffer
                                   1071 ;	usb_hid.c:136: UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
      002DEF 7E 40            [12] 1072 	mov	r6,#_Ep1Buffer
      002DF1 7F 00            [12] 1073 	mov	r7,#(_Ep1Buffer >> 8)
      002DF3 8F EF            [24] 1074 	mov	_UEP1_DMA_H,r7
                                   1075 ;	usb_hid.c:139: UEP4_1_MOD = 0xC0;
      002DF5 75 EA C0         [24] 1076 	mov	_UEP4_1_MOD,#0xc0
                                   1077 ;	usb_hid.c:140: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002DF8 75 D2 12         [24] 1078 	mov	_UEP1_CTRL,#0x12
                                   1079 ;	usb_hid.c:141: UEP1_T_LEN = 0;
      002DFB 75 D3 00         [24] 1080 	mov	_UEP1_T_LEN,#0x00
                                   1081 ;	usb_hid.c:144: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002DFE 75 DC 02         [24] 1082 	mov	_UEP0_CTRL,#0x02
                                   1083 ;	usb_hid.c:147: USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
      002E01 75 E2 29         [24] 1084 	mov	_USB_CTRL,#0x29
                                   1085 ;	usb_hid.c:148: UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN; // Full speed 12Mbps
      002E04 75 D1 81         [24] 1086 	mov	_UDEV_CTRL,#0x81
                                   1087 ;	usb_hid.c:149: USB_DEV_AD = 0x00;
      002E07 75 E3 00         [24] 1088 	mov	_USB_DEV_AD,#0x00
                                   1089 ;	usb_hid.c:151: rx_ready = 0;
      002E0A 75 21 00         [24] 1090 	mov	_rx_ready,#0x00
                                   1091 ;	usb_hid.c:152: usb_dev_addr = 0;
      002E0D 75 22 00         [24] 1092 	mov	_usb_dev_addr,#0x00
                                   1093 ;	usb_hid.c:153: usb_config = 0;
      002E10 75 23 00         [24] 1094 	mov	_usb_config,#0x00
                                   1095 ;	usb_hid.c:154: }
      002E13 22               [24] 1096 	ret
                                   1097 ;------------------------------------------------------------
                                   1098 ;Allocation info for local variables in function 'Handle_EP0_Setup'
                                   1099 ;------------------------------------------------------------
                                   1100 ;req_type      Allocated to registers r7 
                                   1101 ;req           Allocated to registers r6 
                                   1102 ;value         Allocated to registers r4 r5 
                                   1103 ;length        Allocated to registers r3 r2 
                                   1104 ;send_len      Allocated to registers r7 
                                   1105 ;------------------------------------------------------------
                                   1106 ;	usb_hid.c:156: static void Handle_EP0_Setup(void) {
                                   1107 ;	-----------------------------------------
                                   1108 ;	 function Handle_EP0_Setup
                                   1109 ;	-----------------------------------------
      002E14                       1110 _Handle_EP0_Setup:
                                   1111 ;	usb_hid.c:157: uint8_t req_type = Ep0Buffer[0];
      002E14 90 00 00         [24] 1112 	mov	dptr,#_Ep0Buffer
      002E17 E0               [24] 1113 	movx	a,@dptr
      002E18 FF               [12] 1114 	mov	r7,a
                                   1115 ;	usb_hid.c:158: uint8_t req = Ep0Buffer[1];
      002E19 90 00 01         [24] 1116 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002E1C E0               [24] 1117 	movx	a,@dptr
      002E1D FE               [12] 1118 	mov	r6,a
                                   1119 ;	usb_hid.c:159: uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
      002E1E 90 00 02         [24] 1120 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002E21 E0               [24] 1121 	movx	a,@dptr
      002E22 FD               [12] 1122 	mov	r5,a
      002E23 90 00 03         [24] 1123 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002E26 E0               [24] 1124 	movx	a,@dptr
      002E27 FB               [12] 1125 	mov	r3,a
      002E28 7C 00            [12] 1126 	mov	r4,#0x00
      002E2A 8D 02            [24] 1127 	mov	ar2,r5
      002E2C 7D 00            [12] 1128 	mov	r5,#0x00
      002E2E EC               [12] 1129 	mov	a,r4
      002E2F 4A               [12] 1130 	orl	a,r2
      002E30 FC               [12] 1131 	mov	r4,a
      002E31 EB               [12] 1132 	mov	a,r3
      002E32 4D               [12] 1133 	orl	a,r5
      002E33 FD               [12] 1134 	mov	r5,a
                                   1135 ;	usb_hid.c:160: uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
      002E34 90 00 06         [24] 1136 	mov	dptr,#(_Ep0Buffer + 0x0006)
      002E37 E0               [24] 1137 	movx	a,@dptr
      002E38 FB               [12] 1138 	mov	r3,a
      002E39 90 00 07         [24] 1139 	mov	dptr,#(_Ep0Buffer + 0x0007)
      002E3C E0               [24] 1140 	movx	a,@dptr
      002E3D FA               [12] 1141 	mov	r2,a
      002E3E E4               [12] 1142 	clr	a
      002E3F F9               [12] 1143 	mov	r1,a
      002E40 F8               [12] 1144 	mov	r0,a
      002E41 4B               [12] 1145 	orl	a,r3
      002E42 FB               [12] 1146 	mov	r3,a
      002E43 EA               [12] 1147 	mov	a,r2
      002E44 48               [12] 1148 	orl	a,r0
      002E45 FA               [12] 1149 	mov	r2,a
                                   1150 ;	usb_hid.c:162: setup_tx_ptr = 0;
      002E46 E4               [12] 1151 	clr	a
      002E47 F5 24            [12] 1152 	mov	_setup_tx_ptr,a
      002E49 F5 25            [12] 1153 	mov	(_setup_tx_ptr + 1),a
                                   1154 ;	usb_hid.c:163: setup_tx_len = 0;
      002E4B F5 26            [12] 1155 	mov	_setup_tx_len,a
      002E4D F5 27            [12] 1156 	mov	(_setup_tx_len + 1),a
                                   1157 ;	usb_hid.c:165: if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
      002E4F EF               [12] 1158 	mov	a,r7
      002E50 54 60            [12] 1159 	anl	a,#0x60
      002E52 60 03            [24] 1160 	jz	00234$
      002E54 02 2F 1D         [24] 1161 	ljmp	00123$
      002E57                       1162 00234$:
                                   1163 ;	usb_hid.c:166: switch (req) {
      002E57 EE               [12] 1164 	mov	a,r6
      002E58 70 03            [24] 1165 	jnz	00235$
      002E5A 02 2F 0F         [24] 1166 	ljmp	00114$
      002E5D                       1167 00235$:
      002E5D BE 05 03         [24] 1168 	cjne	r6,#0x05,00236$
      002E60 02 2F 07         [24] 1169 	ljmp	00112$
      002E63                       1170 00236$:
      002E63 BE 06 02         [24] 1171 	cjne	r6,#0x06,00237$
      002E66 80 09            [24] 1172 	sjmp	00101$
      002E68                       1173 00237$:
      002E68 BE 09 03         [24] 1174 	cjne	r6,#0x09,00238$
      002E6B 02 2F 0B         [24] 1175 	ljmp	00113$
      002E6E                       1176 00238$:
      002E6E 02 2F 1D         [24] 1177 	ljmp	00123$
                                   1178 ;	usb_hid.c:167: case USB_GET_DESCRIPTOR:
      002E71                       1179 00101$:
                                   1180 ;	usb_hid.c:168: switch (Ep0Buffer[3]) {
      002E71 90 00 03         [24] 1181 	mov	dptr,#(_Ep0Buffer + 0x0003)
      002E74 E0               [24] 1182 	movx	a,@dptr
      002E75 FF               [12] 1183 	mov	r7,a
      002E76 BF 01 02         [24] 1184 	cjne	r7,#0x01,00239$
      002E79 80 12            [24] 1185 	sjmp	00102$
      002E7B                       1186 00239$:
      002E7B BF 02 02         [24] 1187 	cjne	r7,#0x02,00240$
      002E7E 80 1C            [24] 1188 	sjmp	00103$
      002E80                       1189 00240$:
      002E80 BF 03 02         [24] 1190 	cjne	r7,#0x03,00241$
      002E83 80 25            [24] 1191 	sjmp	00104$
      002E85                       1192 00241$:
      002E85 BF 22 02         [24] 1193 	cjne	r7,#0x22,00242$
      002E88 80 6F            [24] 1194 	sjmp	00110$
      002E8A                       1195 00242$:
      002E8A 02 2F 1D         [24] 1196 	ljmp	00123$
                                   1197 ;	usb_hid.c:169: case 0x01: // Device Descriptor
      002E8D                       1198 00102$:
                                   1199 ;	usb_hid.c:170: setup_tx_ptr = DevDesc;
      002E8D 75 24 5E         [24] 1200 	mov	_setup_tx_ptr,#_DevDesc
      002E90 75 25 35         [24] 1201 	mov	(_setup_tx_ptr + 1),#(_DevDesc >> 8)
                                   1202 ;	usb_hid.c:171: setup_tx_len = sizeof(DevDesc);
      002E93 75 26 12         [24] 1203 	mov	_setup_tx_len,#0x12
      002E96 75 27 00         [24] 1204 	mov	(_setup_tx_len + 1),#0x00
                                   1205 ;	usb_hid.c:172: break;
      002E99 02 2F 1D         [24] 1206 	ljmp	00123$
                                   1207 ;	usb_hid.c:173: case 0x02: // Configuration Descriptor
      002E9C                       1208 00103$:
                                   1209 ;	usb_hid.c:174: setup_tx_ptr = CfgDesc;
      002E9C 75 24 92         [24] 1210 	mov	_setup_tx_ptr,#_CfgDesc
      002E9F 75 25 35         [24] 1211 	mov	(_setup_tx_ptr + 1),#(_CfgDesc >> 8)
                                   1212 ;	usb_hid.c:175: setup_tx_len = sizeof(CfgDesc);
      002EA2 75 26 29         [24] 1213 	mov	_setup_tx_len,#0x29
      002EA5 75 27 00         [24] 1214 	mov	(_setup_tx_len + 1),#0x00
                                   1215 ;	usb_hid.c:176: break;
                                   1216 ;	usb_hid.c:177: case 0x03: // String Descriptor
      002EA8 80 73            [24] 1217 	sjmp	00123$
      002EAA                       1218 00104$:
                                   1219 ;	usb_hid.c:178: switch (Ep0Buffer[2]) {
      002EAA 90 00 02         [24] 1220 	mov	dptr,#(_Ep0Buffer + 0x0002)
      002EAD E0               [24] 1221 	movx	a,@dptr
      002EAE FF               [12] 1222 	mov  r7,a
      002EAF 24 FC            [12] 1223 	add	a,#0xff - 0x03
      002EB1 40 6A            [24] 1224 	jc	00123$
                                   1225 ;	free result
      002EB3 EF               [12] 1226 	mov	a,r7
      002EB4 2F               [12] 1227 	add	a,r7
                                   1228 ;	usb_hid.c:179: case 0: setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); break;
      002EB5 90 2E B9         [24] 1229 	mov	dptr,#00244$
      002EB8 73               [24] 1230 	jmp	@a+dptr
      002EB9                       1231 00244$:
      002EB9 80 06            [24] 1232 	sjmp	00105$
      002EBB 80 12            [24] 1233 	sjmp	00106$
      002EBD 80 1E            [24] 1234 	sjmp	00107$
      002EBF 80 2A            [24] 1235 	sjmp	00108$
      002EC1                       1236 00105$:
      002EC1 75 24 BB         [24] 1237 	mov	_setup_tx_ptr,#_Str0Desc
      002EC4 75 25 35         [24] 1238 	mov	(_setup_tx_ptr + 1),#(_Str0Desc >> 8)
      002EC7 75 26 04         [24] 1239 	mov	_setup_tx_len,#0x04
      002ECA 75 27 00         [24] 1240 	mov	(_setup_tx_len + 1),#0x00
                                   1241 ;	usb_hid.c:180: case 1: setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); break;
      002ECD 80 4E            [24] 1242 	sjmp	00123$
      002ECF                       1243 00106$:
      002ECF 75 24 BF         [24] 1244 	mov	_setup_tx_ptr,#_Str1Desc
      002ED2 75 25 35         [24] 1245 	mov	(_setup_tx_ptr + 1),#(_Str1Desc >> 8)
      002ED5 75 26 0E         [24] 1246 	mov	_setup_tx_len,#0x0e
      002ED8 75 27 00         [24] 1247 	mov	(_setup_tx_len + 1),#0x00
                                   1248 ;	usb_hid.c:181: case 2: setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); break;
      002EDB 80 40            [24] 1249 	sjmp	00123$
      002EDD                       1250 00107$:
      002EDD 75 24 CD         [24] 1251 	mov	_setup_tx_ptr,#_Str2Desc
      002EE0 75 25 35         [24] 1252 	mov	(_setup_tx_ptr + 1),#(_Str2Desc >> 8)
      002EE3 75 26 20         [24] 1253 	mov	_setup_tx_len,#0x20
      002EE6 75 27 00         [24] 1254 	mov	(_setup_tx_len + 1),#0x00
                                   1255 ;	usb_hid.c:182: case 3: setup_tx_ptr = Str3Desc; setup_tx_len = sizeof(Str3Desc); break;
      002EE9 80 32            [24] 1256 	sjmp	00123$
      002EEB                       1257 00108$:
      002EEB 75 24 ED         [24] 1258 	mov	_setup_tx_ptr,#_Str3Desc
      002EEE 75 25 35         [24] 1259 	mov	(_setup_tx_ptr + 1),#(_Str3Desc >> 8)
      002EF1 75 26 0A         [24] 1260 	mov	_setup_tx_len,#0x0a
      002EF4 75 27 00         [24] 1261 	mov	(_setup_tx_len + 1),#0x00
                                   1262 ;	usb_hid.c:184: break;
                                   1263 ;	usb_hid.c:185: case 0x22: // HID Report Descriptor
      002EF7 80 24            [24] 1264 	sjmp	00123$
      002EF9                       1265 00110$:
                                   1266 ;	usb_hid.c:186: setup_tx_ptr = ReportDesc;
      002EF9 75 24 70         [24] 1267 	mov	_setup_tx_ptr,#_ReportDesc
      002EFC 75 25 35         [24] 1268 	mov	(_setup_tx_ptr + 1),#(_ReportDesc >> 8)
                                   1269 ;	usb_hid.c:187: setup_tx_len = sizeof(ReportDesc);
      002EFF 75 26 22         [24] 1270 	mov	_setup_tx_len,#0x22
      002F02 75 27 00         [24] 1271 	mov	(_setup_tx_len + 1),#0x00
                                   1272 ;	usb_hid.c:190: break;
                                   1273 ;	usb_hid.c:192: case USB_SET_ADDRESS:
      002F05 80 16            [24] 1274 	sjmp	00123$
      002F07                       1275 00112$:
                                   1276 ;	usb_hid.c:193: usb_dev_addr = (uint8_t)value;
      002F07 8C 22            [24] 1277 	mov	_usb_dev_addr,r4
                                   1278 ;	usb_hid.c:194: break;
                                   1279 ;	usb_hid.c:196: case USB_SET_CONFIGURATION:
      002F09 80 12            [24] 1280 	sjmp	00123$
      002F0B                       1281 00113$:
                                   1282 ;	usb_hid.c:197: usb_config = (uint8_t)value;
      002F0B 8C 23            [24] 1283 	mov	_usb_config,r4
                                   1284 ;	usb_hid.c:198: break;
                                   1285 ;	usb_hid.c:200: case USB_GET_STATUS:
      002F0D 80 0E            [24] 1286 	sjmp	00123$
      002F0F                       1287 00114$:
                                   1288 ;	usb_hid.c:201: Ep0Buffer[0] = 0x00;
      002F0F 90 00 00         [24] 1289 	mov	dptr,#_Ep0Buffer
      002F12 E4               [12] 1290 	clr	a
      002F13 F0               [24] 1291 	movx	@dptr,a
                                   1292 ;	usb_hid.c:202: Ep0Buffer[1] = 0x00;
      002F14 90 00 01         [24] 1293 	mov	dptr,#(_Ep0Buffer + 0x0001)
      002F17 F0               [24] 1294 	movx	@dptr,a
                                   1295 ;	usb_hid.c:203: setup_tx_len = 2;
      002F18 75 26 02         [24] 1296 	mov	_setup_tx_len,#0x02
      002F1B F5 27            [12] 1297 	mov	(_setup_tx_len + 1),a
                                   1298 ;	usb_hid.c:212: }
      002F1D                       1299 00123$:
                                   1300 ;	usb_hid.c:215: if (setup_tx_len > length) {
      002F1D C3               [12] 1301 	clr	c
      002F1E EB               [12] 1302 	mov	a,r3
      002F1F 95 26            [12] 1303 	subb	a,_setup_tx_len
      002F21 EA               [12] 1304 	mov	a,r2
      002F22 95 27            [12] 1305 	subb	a,(_setup_tx_len + 1)
      002F24 50 04            [24] 1306 	jnc	00125$
                                   1307 ;	free result
                                   1308 ;	usb_hid.c:216: setup_tx_len = length;
      002F26 8B 26            [24] 1309 	mov	_setup_tx_len,r3
      002F28 8A 27            [24] 1310 	mov	(_setup_tx_len + 1),r2
      002F2A                       1311 00125$:
                                   1312 ;	usb_hid.c:219: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002F2A AE 26            [24] 1313 	mov	r6,_setup_tx_len
      002F2C AF 27            [24] 1314 	mov	r7,(_setup_tx_len + 1)
      002F2E C3               [12] 1315 	clr	c
      002F2F 74 40            [12] 1316 	mov	a,#0x40
      002F31 9E               [12] 1317 	subb	a,r6
      002F32 E4               [12] 1318 	clr	a
      002F33 9F               [12] 1319 	subb	a,r7
      002F34 50 04            [24] 1320 	jnc	00131$
                                   1321 ;	free result
      002F36 7F 40            [12] 1322 	mov	r7,#0x40
      002F38 80 04            [24] 1323 	sjmp	00132$
      002F3A                       1324 00131$:
      002F3A AE 26            [24] 1325 	mov	r6,_setup_tx_len
      002F3C 8E 07            [24] 1326 	mov	ar7,r6
      002F3E                       1327 00132$:
                                   1328 ;	usb_hid.c:220: if (setup_tx_ptr && send_len > 0) {
      002F3E E5 24            [12] 1329 	mov	a,_setup_tx_ptr
      002F40 45 25            [12] 1330 	orl	a,(_setup_tx_ptr + 1)
      002F42 60 3B            [24] 1331 	jz	00127$
      002F44 EF               [12] 1332 	mov	a,r7
      002F45 60 38            [24] 1333 	jz	00127$
                                   1334 ;	usb_hid.c:221: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002F47 85 24 08         [24] 1335 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002F4A 85 25 09         [24] 1336 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002F4D 75 0A 80         [24] 1337 	mov	(___memcpy_PARM_2 + 2),#0x80
      002F50 8F 0B            [24] 1338 	mov	___memcpy_PARM_3,r7
      002F52 75 0C 00         [24] 1339 	mov	(___memcpy_PARM_3 + 1),#0x00
      002F55 90 00 00         [24] 1340 	mov	dptr,#_Ep0Buffer
      002F58 75 F0 00         [24] 1341 	mov	b, #0x00
      002F5B C0 07            [24] 1342 	push	ar7
      002F5D 12 34 AF         [24] 1343 	lcall	___memcpy
      002F60 D0 07            [24] 1344 	pop	ar7
                                   1345 ;	usb_hid.c:222: setup_tx_ptr += send_len;
      002F62 EF               [12] 1346 	mov	a,r7
      002F63 25 24            [12] 1347 	add	a, _setup_tx_ptr
      002F65 F5 24            [12] 1348 	mov	_setup_tx_ptr,a
      002F67 E4               [12] 1349 	clr	a
      002F68 35 25            [12] 1350 	addc	a, (_setup_tx_ptr + 1)
      002F6A F5 25            [12] 1351 	mov	(_setup_tx_ptr + 1),a
                                   1352 ;	usb_hid.c:223: setup_tx_len -= send_len;
      002F6C 8F 05            [24] 1353 	mov	ar5,r7
      002F6E 7E 00            [12] 1354 	mov	r6,#0x00
      002F70 AB 26            [24] 1355 	mov	r3,_setup_tx_len
      002F72 AC 27            [24] 1356 	mov	r4,(_setup_tx_len + 1)
      002F74 EB               [12] 1357 	mov	a,r3
      002F75 C3               [12] 1358 	clr	c
      002F76 9D               [12] 1359 	subb	a,r5
      002F77 FB               [12] 1360 	mov	r3,a
      002F78 EC               [12] 1361 	mov	a,r4
      002F79 9E               [12] 1362 	subb	a,r6
      002F7A FC               [12] 1363 	mov	r4,a
      002F7B 8B 26            [24] 1364 	mov	_setup_tx_len,r3
      002F7D 8C 27            [24] 1365 	mov	(_setup_tx_len + 1),r4
      002F7F                       1366 00127$:
                                   1367 ;	usb_hid.c:226: UEP0_T_LEN = send_len;
      002F7F 8F DD            [24] 1368 	mov	_UEP0_T_LEN,r7
                                   1369 ;	usb_hid.c:227: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
      002F81 75 DC C0         [24] 1370 	mov	_UEP0_CTRL,#0xc0
                                   1371 ;	usb_hid.c:228: }
      002F84 22               [24] 1372 	ret
                                   1373 ;------------------------------------------------------------
                                   1374 ;Allocation info for local variables in function 'USB_Process'
                                   1375 ;------------------------------------------------------------
                                   1376 ;token         Allocated to registers r7 
                                   1377 ;endp          Allocated to registers r5 
                                   1378 ;send_len      Allocated to registers r6 
                                   1379 ;------------------------------------------------------------
                                   1380 ;	usb_hid.c:230: void USB_Process(void) {
                                   1381 ;	-----------------------------------------
                                   1382 ;	 function USB_Process
                                   1383 ;	-----------------------------------------
      002F85                       1384 _USB_Process:
                                   1385 ;	usb_hid.c:231: if (UIF_BUS_RST) {
      002F85 30 D8 0F         [24] 1386 	jnb	_UIF_BUS_RST,00102$
                                   1387 ;	usb_hid.c:232: USB_DEV_AD = 0x00;
      002F88 75 E3 00         [24] 1388 	mov	_USB_DEV_AD,#0x00
                                   1389 ;	usb_hid.c:233: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      002F8B 75 DC 02         [24] 1390 	mov	_UEP0_CTRL,#0x02
                                   1391 ;	usb_hid.c:234: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
      002F8E 75 D2 12         [24] 1392 	mov	_UEP1_CTRL,#0x12
                                   1393 ;	usb_hid.c:235: UIF_BUS_RST = 0; // Clear reset flag
                                   1394 ;	assignBit
      002F91 C2 D8            [12] 1395 	clr	_UIF_BUS_RST
                                   1396 ;	usb_hid.c:236: rx_ready = 0;
      002F93 75 21 00         [24] 1397 	mov	_rx_ready,#0x00
                                   1398 ;	usb_hid.c:237: return;
      002F96 22               [24] 1399 	ret
      002F97                       1400 00102$:
                                   1401 ;	usb_hid.c:240: if (UIF_TRANSFER) {
      002F97 20 D9 01         [24] 1402 	jb	_UIF_TRANSFER,00225$
      002F9A 22               [24] 1403 	ret
      002F9B                       1404 00225$:
                                   1405 ;	usb_hid.c:241: uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
      002F9B E5 D9            [12] 1406 	mov	a,_USB_INT_ST
      002F9D 54 30            [12] 1407 	anl	a,#0x30
      002F9F FF               [12] 1408 	mov	r7,a
                                   1409 ;	usb_hid.c:242: uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
      002FA0 E5 D9            [12] 1410 	mov	a,_USB_INT_ST
      002FA2 54 0F            [12] 1411 	anl	a,#0x0f
                                   1412 ;	usb_hid.c:244: if (endp == 0) { // Endpoint 0
      002FA4 FD               [12] 1413 	mov	r5,a
      002FA5 60 03            [24] 1414 	jz	00226$
      002FA7 02 30 2D         [24] 1415 	ljmp	00125$
      002FAA                       1416 00226$:
                                   1417 ;	usb_hid.c:245: if (token == UIS_TOKEN_SETUP) {
      002FAA BF 30 06         [24] 1418 	cjne	r7,#0x30,00115$
                                   1419 ;	usb_hid.c:246: Handle_EP0_Setup();
      002FAD 12 2E 14         [24] 1420 	lcall	_Handle_EP0_Setup
      002FB0 02 30 4E         [24] 1421 	ljmp	00126$
      002FB3                       1422 00115$:
                                   1423 ;	usb_hid.c:247: } else if (token == UIS_TOKEN_IN) {
      002FB3 BF 20 6F         [24] 1424 	cjne	r7,#0x20,00112$
                                   1425 ;	usb_hid.c:248: if (usb_dev_addr != 0 && USB_DEV_AD == 0) {
      002FB6 E5 22            [12] 1426 	mov	a,_usb_dev_addr
      002FB8 60 07            [24] 1427 	jz	00104$
      002FBA E5 E3            [12] 1428 	mov	a,_USB_DEV_AD
      002FBC 70 03            [24] 1429 	jnz	00104$
                                   1430 ;	usb_hid.c:249: USB_DEV_AD = usb_dev_addr;
      002FBE 85 22 E3         [24] 1431 	mov	_USB_DEV_AD,_usb_dev_addr
      002FC1                       1432 00104$:
                                   1433 ;	usb_hid.c:251: if (setup_tx_len > 0) {
      002FC1 E5 26            [12] 1434 	mov	a,_setup_tx_len
      002FC3 45 27            [12] 1435 	orl	a,(_setup_tx_len + 1)
      002FC5 60 56            [24] 1436 	jz	00107$
                                   1437 ;	usb_hid.c:252: uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
      002FC7 AC 26            [24] 1438 	mov	r4,_setup_tx_len
      002FC9 AE 27            [24] 1439 	mov	r6,(_setup_tx_len + 1)
      002FCB C3               [12] 1440 	clr	c
      002FCC 74 40            [12] 1441 	mov	a,#0x40
      002FCE 9C               [12] 1442 	subb	a,r4
      002FCF E4               [12] 1443 	clr	a
      002FD0 9E               [12] 1444 	subb	a,r6
      002FD1 50 04            [24] 1445 	jnc	00131$
                                   1446 ;	free result
      002FD3 7E 40            [12] 1447 	mov	r6,#0x40
      002FD5 80 04            [24] 1448 	sjmp	00132$
      002FD7                       1449 00131$:
      002FD7 AC 26            [24] 1450 	mov	r4,_setup_tx_len
      002FD9 8C 06            [24] 1451 	mov	ar6,r4
      002FDB                       1452 00132$:
                                   1453 ;	usb_hid.c:253: memcpy(Ep0Buffer, setup_tx_ptr, send_len);
      002FDB 85 24 08         [24] 1454 	mov	___memcpy_PARM_2,_setup_tx_ptr
      002FDE 85 25 09         [24] 1455 	mov	(___memcpy_PARM_2 + 1),(_setup_tx_ptr + 1)
      002FE1 75 0A 80         [24] 1456 	mov	(___memcpy_PARM_2 + 2),#0x80
      002FE4 8E 0B            [24] 1457 	mov	___memcpy_PARM_3,r6
      002FE6 75 0C 00         [24] 1458 	mov	(___memcpy_PARM_3 + 1),#0x00
      002FE9 90 00 00         [24] 1459 	mov	dptr,#_Ep0Buffer
      002FEC 75 F0 00         [24] 1460 	mov	b, #0x00
      002FEF C0 06            [24] 1461 	push	ar6
      002FF1 12 34 AF         [24] 1462 	lcall	___memcpy
      002FF4 D0 06            [24] 1463 	pop	ar6
                                   1464 ;	usb_hid.c:254: setup_tx_ptr += send_len;
      002FF6 EE               [12] 1465 	mov	a,r6
      002FF7 25 24            [12] 1466 	add	a, _setup_tx_ptr
      002FF9 F5 24            [12] 1467 	mov	_setup_tx_ptr,a
      002FFB E4               [12] 1468 	clr	a
      002FFC 35 25            [12] 1469 	addc	a, (_setup_tx_ptr + 1)
      002FFE F5 25            [12] 1470 	mov	(_setup_tx_ptr + 1),a
                                   1471 ;	usb_hid.c:255: setup_tx_len -= send_len;
      003000 8E 03            [24] 1472 	mov	ar3,r6
      003002 7C 00            [12] 1473 	mov	r4,#0x00
      003004 A9 26            [24] 1474 	mov	r1,_setup_tx_len
      003006 AA 27            [24] 1475 	mov	r2,(_setup_tx_len + 1)
      003008 E9               [12] 1476 	mov	a,r1
      003009 C3               [12] 1477 	clr	c
      00300A 9B               [12] 1478 	subb	a,r3
      00300B F9               [12] 1479 	mov	r1,a
      00300C EA               [12] 1480 	mov	a,r2
      00300D 9C               [12] 1481 	subb	a,r4
      00300E FA               [12] 1482 	mov	r2,a
      00300F 89 26            [24] 1483 	mov	_setup_tx_len,r1
      003011 8A 27            [24] 1484 	mov	(_setup_tx_len + 1),r2
                                   1485 ;	usb_hid.c:256: UEP0_T_LEN = send_len;
      003013 8E DD            [24] 1486 	mov	_UEP0_T_LEN,r6
                                   1487 ;	usb_hid.c:257: UEP0_CTRL ^= bUEP_T_TOG;
      003015 63 DC 40         [24] 1488 	xrl	_UEP0_CTRL,#0x40
                                   1489 ;	usb_hid.c:258: UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      003018 53 DC FC         [24] 1490 	anl	_UEP0_CTRL,#0xfc
      00301B 80 31            [24] 1491 	sjmp	00126$
      00301D                       1492 00107$:
                                   1493 ;	usb_hid.c:260: UEP0_T_LEN = 0;
      00301D 75 DD 00         [24] 1494 	mov	_UEP0_T_LEN,#0x00
                                   1495 ;	usb_hid.c:261: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      003020 75 DC 02         [24] 1496 	mov	_UEP0_CTRL,#0x02
      003023 80 29            [24] 1497 	sjmp	00126$
      003025                       1498 00112$:
                                   1499 ;	usb_hid.c:263: } else if (token == UIS_TOKEN_OUT) {
      003025 EF               [12] 1500 	mov	a,r7
      003026 70 26            [24] 1501 	jnz	00126$
                                   1502 ;	usb_hid.c:264: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      003028 75 DC 02         [24] 1503 	mov	_UEP0_CTRL,#0x02
      00302B 80 21            [24] 1504 	sjmp	00126$
      00302D                       1505 00125$:
                                   1506 ;	usb_hid.c:266: } else if (endp == 1) { // Endpoint 1 (HID Data)
      00302D BD 01 1E         [24] 1507 	cjne	r5,#0x01,00126$
                                   1508 ;	usb_hid.c:267: if (token == UIS_TOKEN_OUT) {
      003030 EF               [12] 1509 	mov	a,r7
      003031 70 0D            [24] 1510 	jnz	00120$
                                   1511 ;	usb_hid.c:268: rx_ready = 1;
      003033 75 21 01         [24] 1512 	mov	_rx_ready,#0x01
                                   1513 ;	usb_hid.c:269: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_NAK;
      003036 74 F3            [12] 1514 	mov	a,#0xf3
      003038 55 D2            [12] 1515 	anl	a,_UEP1_CTRL
      00303A 44 08            [12] 1516 	orl	a,#0x08
      00303C F5 D2            [12] 1517 	mov	_UEP1_CTRL,a
      00303E 80 0E            [24] 1518 	sjmp	00126$
      003040                       1519 00120$:
                                   1520 ;	usb_hid.c:270: } else if (token == UIS_TOKEN_IN) {
      003040 BF 20 0B         [24] 1521 	cjne	r7,#0x20,00126$
                                   1522 ;	usb_hid.c:271: UEP1_T_LEN = 0;
      003043 75 D3 00         [24] 1523 	mov	_UEP1_T_LEN,#0x00
                                   1524 ;	usb_hid.c:272: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
      003046 74 FC            [12] 1525 	mov	a,#0xfc
      003048 55 D2            [12] 1526 	anl	a,_UEP1_CTRL
      00304A 44 02            [12] 1527 	orl	a,#0x02
      00304C F5 D2            [12] 1528 	mov	_UEP1_CTRL,a
      00304E                       1529 00126$:
                                   1530 ;	usb_hid.c:276: UIF_TRANSFER = 0; // Clear transfer flag
                                   1531 ;	assignBit
      00304E C2 D9            [12] 1532 	clr	_UIF_TRANSFER
                                   1533 ;	usb_hid.c:278: }
      003050 22               [24] 1534 	ret
                                   1535 ;------------------------------------------------------------
                                   1536 ;Allocation info for local variables in function 'USB_Available'
                                   1537 ;------------------------------------------------------------
                                   1538 ;	usb_hid.c:280: uint8_t USB_Available(void) {
                                   1539 ;	-----------------------------------------
                                   1540 ;	 function USB_Available
                                   1541 ;	-----------------------------------------
      003051                       1542 _USB_Available:
                                   1543 ;	usb_hid.c:281: return rx_ready;
      003051 85 21 82         [24] 1544 	mov	dpl, _rx_ready
                                   1545 ;	usb_hid.c:282: }
      003054 22               [24] 1546 	ret
                                   1547 ;------------------------------------------------------------
                                   1548 ;Allocation info for local variables in function 'USB_GetRxBuffer'
                                   1549 ;------------------------------------------------------------
                                   1550 ;	usb_hid.c:284: uint8_t *USB_GetRxBuffer(void) {
                                   1551 ;	-----------------------------------------
                                   1552 ;	 function USB_GetRxBuffer
                                   1553 ;	-----------------------------------------
      003055                       1554 _USB_GetRxBuffer:
                                   1555 ;	usb_hid.c:285: return &Ep1Buffer[0];
      003055 90 00 40         [24] 1556 	mov	dptr,#_Ep1Buffer
      003058 75 F0 00         [24] 1557 	mov	b, #0x00
                                   1558 ;	usb_hid.c:286: }
      00305B 22               [24] 1559 	ret
                                   1560 ;------------------------------------------------------------
                                   1561 ;Allocation info for local variables in function 'USB_ReleaseRx'
                                   1562 ;------------------------------------------------------------
                                   1563 ;	usb_hid.c:288: void USB_ReleaseRx(void) {
                                   1564 ;	-----------------------------------------
                                   1565 ;	 function USB_ReleaseRx
                                   1566 ;	-----------------------------------------
      00305C                       1567 _USB_ReleaseRx:
                                   1568 ;	usb_hid.c:289: rx_ready = 0;
      00305C 75 21 00         [24] 1569 	mov	_rx_ready,#0x00
                                   1570 ;	usb_hid.c:290: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_R_RES) | UEP_R_RES_ACK;
      00305F 53 D2 F3         [24] 1571 	anl	_UEP1_CTRL,#0xf3
                                   1572 ;	usb_hid.c:291: }
      003062 22               [24] 1573 	ret
                                   1574 ;------------------------------------------------------------
                                   1575 ;Allocation info for local variables in function 'USB_SendReport'
                                   1576 ;------------------------------------------------------------
                                   1577 ;len           Allocated with name '_USB_SendReport_PARM_2'
                                   1578 ;buf           Allocated to registers r5 r6 r7 
                                   1579 ;------------------------------------------------------------
                                   1580 ;	usb_hid.c:293: void USB_SendReport(const uint8_t *buf, uint8_t len) {
                                   1581 ;	-----------------------------------------
                                   1582 ;	 function USB_SendReport
                                   1583 ;	-----------------------------------------
      003063                       1584 _USB_SendReport:
      003063 AD 82            [24] 1585 	mov	r5, dpl
      003065 AE 83            [24] 1586 	mov	r6, dph
      003067 AF F0            [24] 1587 	mov	r7, b
                                   1588 ;	usb_hid.c:294: memcpy(&Ep1Buffer[64], buf, len);
      003069 8D 08            [24] 1589 	mov	___memcpy_PARM_2,r5
      00306B 8E 09            [24] 1590 	mov	(___memcpy_PARM_2 + 1),r6
      00306D 8F 0A            [24] 1591 	mov	(___memcpy_PARM_2 + 2),r7
      00306F 85 28 0B         [24] 1592 	mov	___memcpy_PARM_3,_USB_SendReport_PARM_2
      003072 75 0C 00         [24] 1593 	mov	(___memcpy_PARM_3 + 1),#0x00
      003075 90 00 80         [24] 1594 	mov	dptr,#(_Ep1Buffer + 0x0040)
      003078 75 F0 00         [24] 1595 	mov	b, #0x00
      00307B 12 34 AF         [24] 1596 	lcall	___memcpy
                                   1597 ;	usb_hid.c:295: UEP1_T_LEN = len;
      00307E 85 28 D3         [24] 1598 	mov	_UEP1_T_LEN,_USB_SendReport_PARM_2
                                   1599 ;	usb_hid.c:296: UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
      003081 53 D2 FC         [24] 1600 	anl	_UEP1_CTRL,#0xfc
                                   1601 ;	usb_hid.c:297: }
      003084 22               [24] 1602 	ret
                                   1603 ;------------------------------------------------------------
                                   1604 ;Allocation info for local variables in function 'USB_Shutdown'
                                   1605 ;------------------------------------------------------------
                                   1606 ;	usb_hid.c:299: void USB_Shutdown(void) {
                                   1607 ;	-----------------------------------------
                                   1608 ;	 function USB_Shutdown
                                   1609 ;	-----------------------------------------
      003085                       1610 _USB_Shutdown:
                                   1611 ;	usb_hid.c:300: USB_CTRL = 0x00;
      003085 75 E2 00         [24] 1612 	mov	_USB_CTRL,#0x00
                                   1613 ;	usb_hid.c:301: UDEV_CTRL = 0x00;
      003088 75 D1 00         [24] 1614 	mov	_UDEV_CTRL,#0x00
                                   1615 ;	usb_hid.c:302: }
      00308B 22               [24] 1616 	ret
                                   1617 ;------------------------------------------------------------
                                   1618 ;Allocation info for local variables in function 'DelayMs'
                                   1619 ;------------------------------------------------------------
                                   1620 ;ms            Allocated to registers 
                                   1621 ;i             Allocated to registers r4 r5 
                                   1622 ;------------------------------------------------------------
                                   1623 ;	bootloader.c:30: static void DelayMs(uint16_t ms) {
                                   1624 ;	-----------------------------------------
                                   1625 ;	 function DelayMs
                                   1626 ;	-----------------------------------------
      00308C                       1627 _DelayMs:
      00308C AE 82            [24] 1628 	mov	r6, dpl
      00308E AF 83            [24] 1629 	mov	r7, dph
                                   1630 ;	bootloader.c:31: while (ms--) {
      003090                       1631 00102$:
      003090 8E 04            [24] 1632 	mov	ar4,r6
      003092 8F 05            [24] 1633 	mov	ar5,r7
      003094 1E               [12] 1634 	dec	r6
      003095 BE FF 01         [24] 1635 	cjne	r6,#0xff,00139$
      003098 1F               [12] 1636 	dec	r7
      003099                       1637 00139$:
      003099 EC               [12] 1638 	mov	a,r4
      00309A 4D               [12] 1639 	orl	a,r5
      00309B 60 19            [24] 1640 	jz	00108$
                                   1641 ;	bootloader.c:32: for (uint16_t i = 0; i < 2400; i++) {
      00309D 7C 00            [12] 1642 	mov	r4,#0x00
      00309F 7D 00            [12] 1643 	mov	r5,#0x00
      0030A1                       1644 00106$:
      0030A1 8C 02            [24] 1645 	mov	ar2,r4
      0030A3 8D 03            [24] 1646 	mov	ar3,r5
      0030A5 C3               [12] 1647 	clr	c
      0030A6 EA               [12] 1648 	mov	a,r2
      0030A7 94 60            [12] 1649 	subb	a,#0x60
      0030A9 EB               [12] 1650 	mov	a,r3
      0030AA 94 09            [12] 1651 	subb	a,#0x09
      0030AC 50 E2            [24] 1652 	jnc	00102$
                                   1653 ;	bootloader.c:33: __asm nop __endasm;
      0030AE 00               [12] 1654 	nop	
                                   1655 ;	bootloader.c:32: for (uint16_t i = 0; i < 2400; i++) {
      0030AF 0C               [12] 1656 	inc	r4
      0030B0 BC 00 EE         [24] 1657 	cjne	r4,#0x00,00106$
      0030B3 0D               [12] 1658 	inc	r5
      0030B4 80 EB            [24] 1659 	sjmp	00106$
      0030B6                       1660 00108$:
                                   1661 ;	bootloader.c:36: }
      0030B6 22               [24] 1662 	ret
                                   1663 ;------------------------------------------------------------
                                   1664 ;Allocation info for local variables in function 'JumpToApp'
                                   1665 ;------------------------------------------------------------
                                   1666 ;	bootloader.c:38: static void JumpToApp(void) {
                                   1667 ;	-----------------------------------------
                                   1668 ;	 function JumpToApp
                                   1669 ;	-----------------------------------------
      0030B7                       1670 _JumpToApp:
                                   1671 ;	bootloader.c:39: USB_Shutdown();
      0030B7 12 30 85         [24] 1672 	lcall	_USB_Shutdown
                                   1673 ;	bootloader.c:40: DelayMs(10);
      0030BA 90 00 0A         [24] 1674 	mov	dptr,#0x000a
      0030BD 12 30 8C         [24] 1675 	lcall	_DelayMs
                                   1676 ;	bootloader.c:44: __endasm;
      0030C0 02 00 00         [24] 1677 	ljmp 0x0000
                                   1678 ;	bootloader.c:45: }
      0030C3 22               [24] 1679 	ret
                                   1680 ;------------------------------------------------------------
                                   1681 ;Allocation info for local variables in function 'ProcessPacket'
                                   1682 ;------------------------------------------------------------
                                   1683 ;rx            Allocated with name '_ProcessPacket_rx_10000_125'
                                   1684 ;cmd           Allocated with name '_ProcessPacket_cmd_10000_125'
                                   1685 ;seq           Allocated with name '_ProcessPacket_seq_10000_125'
                                   1686 ;addr          Allocated with name '_ProcessPacket_addr_10000_125'
                                   1687 ;len           Allocated with name '_ProcessPacket_len_10000_125'
                                   1688 ;err           Allocated with name '_ProcessPacket_err_40000_139'
                                   1689 ;i             Allocated with name '_ProcessPacket_i_50000_140'
                                   1690 ;word          Allocated to registers 
                                   1691 ;expected_crc  Allocated to registers r4 r7 
                                   1692 ;calc_crc      Allocated to registers r5 r6 
                                   1693 ;sloc0         Allocated with name '_ProcessPacket_sloc0_1_0'
                                   1694 ;sloc1         Allocated with name '_ProcessPacket_sloc1_1_0'
                                   1695 ;sloc2         Allocated with name '_ProcessPacket_sloc2_1_0'
                                   1696 ;------------------------------------------------------------
                                   1697 ;	bootloader.c:47: static void ProcessPacket(void) {
                                   1698 ;	-----------------------------------------
                                   1699 ;	 function ProcessPacket
                                   1700 ;	-----------------------------------------
      0030C4                       1701 _ProcessPacket:
                                   1702 ;	bootloader.c:48: uint8_t *rx = USB_GetRxBuffer();
      0030C4 12 30 55         [24] 1703 	lcall	_USB_GetRxBuffer
                                   1704 ;	bootloader.c:49: uint8_t cmd = rx[0];
      0030C7 85 82 2A         [24] 1705 	mov	_ProcessPacket_rx_10000_125,dpl
      0030CA 85 83 2B         [24] 1706 	mov	(_ProcessPacket_rx_10000_125 + 1),dph
      0030CD 85 F0 2C         [24] 1707 	mov	(_ProcessPacket_rx_10000_125 + 2),b
      0030D0 12 35 3E         [24] 1708 	lcall	__gptrget
      0030D3 F5 2D            [12] 1709 	mov	_ProcessPacket_cmd_10000_125,a
                                   1710 ;	bootloader.c:50: uint8_t seq = rx[1];
      0030D5 74 01            [12] 1711 	mov	a,#0x01
      0030D7 25 2A            [12] 1712 	add	a, _ProcessPacket_rx_10000_125
      0030D9 F9               [12] 1713 	mov	r1,a
      0030DA E4               [12] 1714 	clr	a
      0030DB 35 2B            [12] 1715 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      0030DD FA               [12] 1716 	mov	r2,a
      0030DE AB 2C            [24] 1717 	mov	r3,(_ProcessPacket_rx_10000_125 + 2)
      0030E0 89 82            [24] 1718 	mov	dpl,r1
      0030E2 8A 83            [24] 1719 	mov	dph,r2
      0030E4 8B F0            [24] 1720 	mov	b,r3
      0030E6 12 35 3E         [24] 1721 	lcall	__gptrget
      0030E9 F5 2E            [12] 1722 	mov	_ProcessPacket_seq_10000_125,a
                                   1723 ;	bootloader.c:51: uint16_t addr = rx[2] | ((uint16_t)rx[3] << 8);
      0030EB 74 02            [12] 1724 	mov	a,#0x02
      0030ED 25 2A            [12] 1725 	add	a, _ProcessPacket_rx_10000_125
      0030EF F8               [12] 1726 	mov	r0,a
      0030F0 E4               [12] 1727 	clr	a
      0030F1 35 2B            [12] 1728 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      0030F3 FA               [12] 1729 	mov	r2,a
      0030F4 AB 2C            [24] 1730 	mov	r3,(_ProcessPacket_rx_10000_125 + 2)
      0030F6 88 82            [24] 1731 	mov	dpl,r0
      0030F8 8A 83            [24] 1732 	mov	dph,r2
      0030FA 8B F0            [24] 1733 	mov	b,r3
      0030FC 12 35 3E         [24] 1734 	lcall	__gptrget
      0030FF F5 34            [12] 1735 	mov	_ProcessPacket_sloc0_1_0,a
      003101 74 03            [12] 1736 	mov	a,#0x03
      003103 25 2A            [12] 1737 	add	a, _ProcessPacket_rx_10000_125
      003105 F5 37            [12] 1738 	mov	_ProcessPacket_sloc2_1_0,a
      003107 E4               [12] 1739 	clr	a
      003108 35 2B            [12] 1740 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      00310A F5 38            [12] 1741 	mov	(_ProcessPacket_sloc2_1_0 + 1),a
      00310C 85 2C 39         [24] 1742 	mov	(_ProcessPacket_sloc2_1_0 + 2),(_ProcessPacket_rx_10000_125 + 2)
      00310F 85 37 82         [24] 1743 	mov	dpl,_ProcessPacket_sloc2_1_0
      003112 85 38 83         [24] 1744 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      003115 85 39 F0         [24] 1745 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      003118 12 35 3E         [24] 1746 	lcall	__gptrget
      00311B F9               [12] 1747 	mov	r1,a
      00311C 7D 00            [12] 1748 	mov	r5,#0x00
      00311E 89 36            [24] 1749 	mov	(_ProcessPacket_sloc1_1_0 + 1),r1
      003120 8D 35            [24] 1750 	mov	_ProcessPacket_sloc1_1_0,r5
      003122 A9 34            [24] 1751 	mov	r1,_ProcessPacket_sloc0_1_0
      003124 89 2F            [24] 1752 	mov	_ProcessPacket_addr_10000_125,r1
      003126 E5 36            [12] 1753 	mov	a,(_ProcessPacket_sloc1_1_0 + 1)
      003128 4D               [12] 1754 	orl	a,r5
      003129 F5 30            [12] 1755 	mov	(_ProcessPacket_addr_10000_125 + 1),a
                                   1756 ;	bootloader.c:52: uint8_t len = rx[4];
      00312B 74 04            [12] 1757 	mov	a,#0x04
      00312D 25 2A            [12] 1758 	add	a, _ProcessPacket_rx_10000_125
      00312F F9               [12] 1759 	mov	r1,a
      003130 E4               [12] 1760 	clr	a
      003131 35 2B            [12] 1761 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      003133 FD               [12] 1762 	mov	r5,a
      003134 AF 2C            [24] 1763 	mov	r7,(_ProcessPacket_rx_10000_125 + 2)
      003136 89 82            [24] 1764 	mov	dpl,r1
      003138 8D 83            [24] 1765 	mov	dph,r5
      00313A 8F F0            [24] 1766 	mov	b,r7
      00313C 12 35 3E         [24] 1767 	lcall	__gptrget
      00313F F5 31            [12] 1768 	mov	_ProcessPacket_len_10000_125,a
                                   1769 ;	bootloader.c:54: memset(reply_buf, 0, 64);
      003141 75 08 00         [24] 1770 	mov	_memset_PARM_2,#0x00
      003144 75 09 40         [24] 1771 	mov	_memset_PARM_3,#0x40
      003147 75 0A 00         [24] 1772 	mov	(_memset_PARM_3 + 1),#0x00
      00314A 90 00 00         [24] 1773 	mov	dptr,#_reply_buf
      00314D 75 F0 00         [24] 1774 	mov	b, #0x00
      003150 C0 03            [24] 1775 	push	ar3
      003152 C0 02            [24] 1776 	push	ar2
      003154 C0 00            [24] 1777 	push	ar0
      003156 12 35 04         [24] 1778 	lcall	_memset
      003159 D0 00            [24] 1779 	pop	ar0
      00315B D0 02            [24] 1780 	pop	ar2
      00315D D0 03            [24] 1781 	pop	ar3
                                   1782 ;	bootloader.c:55: reply_buf[0] = cmd;
      00315F 90 00 00         [24] 1783 	mov	dptr,#_reply_buf
      003162 E5 2D            [12] 1784 	mov	a,_ProcessPacket_cmd_10000_125
      003164 F0               [24] 1785 	movx	@dptr,a
                                   1786 ;	bootloader.c:56: reply_buf[1] = seq;
      003165 90 00 01         [24] 1787 	mov	dptr,#(_reply_buf + 0x0001)
      003168 E5 2E            [12] 1788 	mov	a,_ProcessPacket_seq_10000_125
      00316A F0               [24] 1789 	movx	@dptr,a
                                   1790 ;	bootloader.c:57: reply_buf[2] = rx[2];
      00316B 88 82            [24] 1791 	mov	dpl,r0
      00316D 8A 83            [24] 1792 	mov	dph,r2
      00316F 8B F0            [24] 1793 	mov	b,r3
      003171 12 35 3E         [24] 1794 	lcall	__gptrget
      003174 F8               [12] 1795 	mov	r0,a
      003175 90 00 02         [24] 1796 	mov	dptr,#(_reply_buf + 0x0002)
      003178 F0               [24] 1797 	movx	@dptr,a
                                   1798 ;	bootloader.c:58: reply_buf[3] = rx[3];
      003179 85 37 82         [24] 1799 	mov	dpl,_ProcessPacket_sloc2_1_0
      00317C 85 38 83         [24] 1800 	mov	dph,(_ProcessPacket_sloc2_1_0 + 1)
      00317F 85 39 F0         [24] 1801 	mov	b,(_ProcessPacket_sloc2_1_0 + 2)
      003182 12 35 3E         [24] 1802 	lcall	__gptrget
      003185 FE               [12] 1803 	mov	r6,a
      003186 90 00 03         [24] 1804 	mov	dptr,#(_reply_buf + 0x0003)
      003189 F0               [24] 1805 	movx	@dptr,a
                                   1806 ;	bootloader.c:59: reply_buf[59] = STATUS_OK;
      00318A 90 00 3B         [24] 1807 	mov	dptr,#(_reply_buf + 0x003b)
      00318D E4               [12] 1808 	clr	a
      00318E F0               [24] 1809 	movx	@dptr,a
                                   1810 ;	bootloader.c:61: switch (cmd) {
      00318F E5 2D            [12] 1811 	mov	a,_ProcessPacket_cmd_10000_125
      003191 24 F9            [12] 1812 	add	a,#0xff - 0x06
      003193 50 03            [24] 1813 	jnc	00232$
      003195 02 33 AB         [24] 1814 	ljmp	00123$
      003198                       1815 00232$:
                                   1816 ;	free result
      003198 E5 2D            [12] 1817 	mov	a,_ProcessPacket_cmd_10000_125
      00319A 75 F0 03         [24] 1818 	mov	b,#0x03
      00319D A4               [48] 1819 	mul	ab
      00319E 90 31 A2         [24] 1820 	mov	dptr,#00233$
      0031A1 73               [24] 1821 	jmp	@a+dptr
      0031A2                       1822 00233$:
      0031A2 02 33 AB         [24] 1823 	ljmp	00123$
      0031A5 02 31 B7         [24] 1824 	ljmp	00101$
      0031A8 02 31 D7         [24] 1825 	ljmp	00102$
      0031AB 02 33 AB         [24] 1826 	ljmp	00123$
      0031AE 02 32 4E         [24] 1827 	ljmp	00109$
      0031B1 02 33 24         [24] 1828 	ljmp	00121$
      0031B4 02 33 92         [24] 1829 	ljmp	00122$
                                   1830 ;	bootloader.c:62: case CMD_HELLO:
      0031B7                       1831 00101$:
                                   1832 ;	bootloader.c:63: reply_buf[4] = 0x52; // Chip ID: CH552
      0031B7 90 00 04         [24] 1833 	mov	dptr,#(_reply_buf + 0x0004)
      0031BA 74 52            [12] 1834 	mov	a,#0x52
      0031BC F0               [24] 1835 	movx	@dptr,a
                                   1836 ;	bootloader.c:64: reply_buf[5] = 0x01; // Bootloader v1.0
      0031BD 90 00 05         [24] 1837 	mov	dptr,#(_reply_buf + 0x0005)
      0031C0 74 01            [12] 1838 	mov	a,#0x01
      0031C2 F0               [24] 1839 	movx	@dptr,a
                                   1840 ;	bootloader.c:65: reply_buf[6] = (uint8_t)(USER_FLASH_END & 0xFF);
      0031C3 90 00 06         [24] 1841 	mov	dptr,#(_reply_buf + 0x0006)
      0031C6 74 FF            [12] 1842 	mov	a,#0xff
      0031C8 F0               [24] 1843 	movx	@dptr,a
                                   1844 ;	bootloader.c:66: reply_buf[7] = (uint8_t)((USER_FLASH_END >> 8) & 0xFF); // 11 KB usable
      0031C9 90 00 07         [24] 1845 	mov	dptr,#(_reply_buf + 0x0007)
      0031CC 74 2B            [12] 1846 	mov	a,#0x2b
      0031CE F0               [24] 1847 	movx	@dptr,a
                                   1848 ;	bootloader.c:67: reply_buf[59] = STATUS_OK;
      0031CF 90 00 3B         [24] 1849 	mov	dptr,#(_reply_buf + 0x003b)
      0031D2 E4               [12] 1850 	clr	a
      0031D3 F0               [24] 1851 	movx	@dptr,a
                                   1852 ;	bootloader.c:68: break;
      0031D4 02 33 B1         [24] 1853 	ljmp	00124$
                                   1854 ;	bootloader.c:70: case CMD_UNLOCK:
      0031D7                       1855 00102$:
                                   1856 ;	bootloader.c:71: if (rx[5] == 0x5A && rx[6] == 0xC3 && rx[7] == 0x3C && rx[8] == 0xA5) {
      0031D7 74 05            [12] 1857 	mov	a,#0x05
      0031D9 25 2A            [12] 1858 	add	a, _ProcessPacket_rx_10000_125
      0031DB FC               [12] 1859 	mov	r4,a
      0031DC E4               [12] 1860 	clr	a
      0031DD 35 2B            [12] 1861 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      0031DF FD               [12] 1862 	mov	r5,a
      0031E0 AE 2C            [24] 1863 	mov	r6,(_ProcessPacket_rx_10000_125 + 2)
      0031E2 8C 82            [24] 1864 	mov	dpl,r4
      0031E4 8D 83            [24] 1865 	mov	dph,r5
      0031E6 8E F0            [24] 1866 	mov	b,r6
      0031E8 12 35 3E         [24] 1867 	lcall	__gptrget
      0031EB FC               [12] 1868 	mov	r4,a
      0031EC BC 5A 53         [24] 1869 	cjne	r4,#0x5a,00104$
      0031EF 74 06            [12] 1870 	mov	a,#0x06
      0031F1 25 2A            [12] 1871 	add	a, _ProcessPacket_rx_10000_125
      0031F3 FC               [12] 1872 	mov	r4,a
      0031F4 E4               [12] 1873 	clr	a
      0031F5 35 2B            [12] 1874 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      0031F7 FD               [12] 1875 	mov	r5,a
      0031F8 AE 2C            [24] 1876 	mov	r6,(_ProcessPacket_rx_10000_125 + 2)
      0031FA 8C 82            [24] 1877 	mov	dpl,r4
      0031FC 8D 83            [24] 1878 	mov	dph,r5
      0031FE 8E F0            [24] 1879 	mov	b,r6
      003200 12 35 3E         [24] 1880 	lcall	__gptrget
      003203 FC               [12] 1881 	mov	r4,a
      003204 BC C3 3B         [24] 1882 	cjne	r4,#0xc3,00104$
      003207 74 07            [12] 1883 	mov	a,#0x07
      003209 25 2A            [12] 1884 	add	a, _ProcessPacket_rx_10000_125
      00320B FC               [12] 1885 	mov	r4,a
      00320C E4               [12] 1886 	clr	a
      00320D 35 2B            [12] 1887 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      00320F FD               [12] 1888 	mov	r5,a
      003210 AE 2C            [24] 1889 	mov	r6,(_ProcessPacket_rx_10000_125 + 2)
      003212 8C 82            [24] 1890 	mov	dpl,r4
      003214 8D 83            [24] 1891 	mov	dph,r5
      003216 8E F0            [24] 1892 	mov	b,r6
      003218 12 35 3E         [24] 1893 	lcall	__gptrget
      00321B FC               [12] 1894 	mov	r4,a
      00321C BC 3C 23         [24] 1895 	cjne	r4,#0x3c,00104$
      00321F 74 08            [12] 1896 	mov	a,#0x08
      003221 25 2A            [12] 1897 	add	a, _ProcessPacket_rx_10000_125
      003223 FC               [12] 1898 	mov	r4,a
      003224 E4               [12] 1899 	clr	a
      003225 35 2B            [12] 1900 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      003227 FD               [12] 1901 	mov	r5,a
      003228 AE 2C            [24] 1902 	mov	r6,(_ProcessPacket_rx_10000_125 + 2)
      00322A 8C 82            [24] 1903 	mov	dpl,r4
      00322C 8D 83            [24] 1904 	mov	dph,r5
      00322E 8E F0            [24] 1905 	mov	b,r6
      003230 12 35 3E         [24] 1906 	lcall	__gptrget
      003233 FC               [12] 1907 	mov	r4,a
      003234 BC A5 0B         [24] 1908 	cjne	r4,#0xa5,00104$
                                   1909 ;	bootloader.c:72: is_unlocked = 1;
      003237 75 29 01         [24] 1910 	mov	_is_unlocked,#0x01
                                   1911 ;	bootloader.c:73: reply_buf[59] = STATUS_OK;
      00323A 90 00 3B         [24] 1912 	mov	dptr,#(_reply_buf + 0x003b)
      00323D E4               [12] 1913 	clr	a
      00323E F0               [24] 1914 	movx	@dptr,a
      00323F 02 33 B1         [24] 1915 	ljmp	00124$
      003242                       1916 00104$:
                                   1917 ;	bootloader.c:75: is_unlocked = 0;
      003242 75 29 00         [24] 1918 	mov	_is_unlocked,#0x00
                                   1919 ;	bootloader.c:76: reply_buf[59] = STATUS_LOCKED;
      003245 90 00 3B         [24] 1920 	mov	dptr,#(_reply_buf + 0x003b)
      003248 74 02            [12] 1921 	mov	a,#0x02
      00324A F0               [24] 1922 	movx	@dptr,a
                                   1923 ;	bootloader.c:78: break;
      00324B 02 33 B1         [24] 1924 	ljmp	00124$
                                   1925 ;	bootloader.c:80: case CMD_WRITE_BLOCK:
      00324E                       1926 00109$:
                                   1927 ;	bootloader.c:81: if (!is_unlocked) {
      00324E E5 29            [12] 1928 	mov	a,_is_unlocked
      003250 70 09            [24] 1929 	jnz	00111$
                                   1930 ;	bootloader.c:82: reply_buf[59] = STATUS_LOCKED;
      003252 90 00 3B         [24] 1931 	mov	dptr,#(_reply_buf + 0x003b)
      003255 74 02            [12] 1932 	mov	a,#0x02
      003257 F0               [24] 1933 	movx	@dptr,a
                                   1934 ;	bootloader.c:83: break;
      003258 02 33 B1         [24] 1935 	ljmp	00124$
      00325B                       1936 00111$:
                                   1937 ;	bootloader.c:86: if (addr + len > BOOTLOADER_START) {
      00325B AD 31            [24] 1938 	mov	r5,_ProcessPacket_len_10000_125
      00325D 7E 00            [12] 1939 	mov	r6,#0x00
      00325F A9 2F            [24] 1940 	mov	r1,_ProcessPacket_addr_10000_125
      003261 AC 30            [24] 1941 	mov	r4,(_ProcessPacket_addr_10000_125 + 1)
      003263 ED               [12] 1942 	mov	a,r5
      003264 29               [12] 1943 	add	a, r1
      003265 FD               [12] 1944 	mov	r5,a
      003266 EE               [12] 1945 	mov	a,r6
      003267 3C               [12] 1946 	addc	a, r4
      003268 FE               [12] 1947 	mov	r6,a
      003269 C3               [12] 1948 	clr	c
      00326A E4               [12] 1949 	clr	a
      00326B 9D               [12] 1950 	subb	a,r5
      00326C 74 2C            [12] 1951 	mov	a,#0x2c
      00326E 9E               [12] 1952 	subb	a,r6
      00326F 50 09            [24] 1953 	jnc	00113$
                                   1954 ;	free result
                                   1955 ;	bootloader.c:87: reply_buf[59] = STATUS_OOB;
      003271 90 00 3B         [24] 1956 	mov	dptr,#(_reply_buf + 0x003b)
      003274 74 03            [12] 1957 	mov	a,#0x03
      003276 F0               [24] 1958 	movx	@dptr,a
                                   1959 ;	bootloader.c:88: break;
      003277 02 33 B1         [24] 1960 	ljmp	00124$
      00327A                       1961 00113$:
                                   1962 ;	bootloader.c:92: if ((addr % 1024) == 0) {
      00327A E9               [12] 1963 	mov	a,r1
      00327B 70 23            [24] 1964 	jnz	00117$
      00327D EC               [12] 1965 	mov	a,r4
      00327E 54 03            [12] 1966 	anl	a,#0x03
      003280 70 1E            [24] 1967 	jnz	00117$
                                   1968 ;	bootloader.c:93: if (IAP_ErasePage(addr) != 0) {
      003282 85 2F 82         [24] 1969 	mov	dpl, _ProcessPacket_addr_10000_125
      003285 85 30 83         [24] 1970 	mov	dph, (_ProcessPacket_addr_10000_125 + 1)
      003288 C0 04            [24] 1971 	push	ar4
      00328A C0 01            [24] 1972 	push	ar1
      00328C 12 2D 87         [24] 1973 	lcall	_IAP_ErasePage
      00328F E5 82            [12] 1974 	mov	a, dpl
      003291 D0 01            [24] 1975 	pop	ar1
      003293 D0 04            [24] 1976 	pop	ar4
      003295 60 09            [24] 1977 	jz	00117$
                                   1978 ;	bootloader.c:94: reply_buf[59] = STATUS_WRITE_ERR;
      003297 90 00 3B         [24] 1979 	mov	dptr,#(_reply_buf + 0x003b)
      00329A 74 04            [12] 1980 	mov	a,#0x04
      00329C F0               [24] 1981 	movx	@dptr,a
                                   1982 ;	bootloader.c:95: break;
      00329D 02 33 B1         [24] 1983 	ljmp	00124$
      0032A0                       1984 00117$:
                                   1985 ;	bootloader.c:101: uint8_t err = 0;
      0032A0 75 32 00         [24] 1986 	mov	_ProcessPacket_err_40000_139,#0x00
                                   1987 ;	bootloader.c:102: for (uint8_t i = 0; i < len; i += 2) {
      0032A3 75 33 00         [24] 1988 	mov	_ProcessPacket_i_50000_140,#0x00
      0032A6                       1989 00126$:
      0032A6 C3               [12] 1990 	clr	c
      0032A7 E5 33            [12] 1991 	mov	a,_ProcessPacket_i_50000_140
      0032A9 95 31            [12] 1992 	subb	a,_ProcessPacket_len_10000_125
      0032AB 50 6A            [24] 1993 	jnc	00120$
                                   1994 ;	bootloader.c:103: uint16_t word = rx[5 + i] | ((uint16_t)rx[6 + i] << 8);
      0032AD AA 33            [24] 1995 	mov	r2,_ProcessPacket_i_50000_140
      0032AF 7B 00            [12] 1996 	mov	r3,#0x00
      0032B1 74 05            [12] 1997 	mov	a,#0x05
      0032B3 2A               [12] 1998 	add	a, r2
      0032B4 F8               [12] 1999 	mov	r0,a
      0032B5 E4               [12] 2000 	clr	a
      0032B6 3B               [12] 2001 	addc	a, r3
      0032B7 FE               [12] 2002 	mov	r6,a
      0032B8 E8               [12] 2003 	mov	a,r0
      0032B9 25 2A            [12] 2004 	add	a, _ProcessPacket_rx_10000_125
      0032BB F8               [12] 2005 	mov	r0,a
      0032BC EE               [12] 2006 	mov	a,r6
      0032BD 35 2B            [12] 2007 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      0032BF FE               [12] 2008 	mov	r6,a
      0032C0 AF 2C            [24] 2009 	mov	r7,(_ProcessPacket_rx_10000_125 + 2)
      0032C2 88 82            [24] 2010 	mov	dpl,r0
      0032C4 8E 83            [24] 2011 	mov	dph,r6
      0032C6 8F F0            [24] 2012 	mov	b,r7
      0032C8 12 35 3E         [24] 2013 	lcall	__gptrget
      0032CB F8               [12] 2014 	mov	r0,a
      0032CC 74 06            [12] 2015 	mov	a,#0x06
      0032CE 2A               [12] 2016 	add	a, r2
      0032CF FE               [12] 2017 	mov	r6,a
      0032D0 E4               [12] 2018 	clr	a
      0032D1 3B               [12] 2019 	addc	a, r3
      0032D2 FF               [12] 2020 	mov	r7,a
      0032D3 EE               [12] 2021 	mov	a,r6
      0032D4 25 2A            [12] 2022 	add	a, _ProcessPacket_rx_10000_125
      0032D6 FE               [12] 2023 	mov	r6,a
      0032D7 EF               [12] 2024 	mov	a,r7
      0032D8 35 2B            [12] 2025 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      0032DA FD               [12] 2026 	mov	r5,a
      0032DB AF 2C            [24] 2027 	mov	r7,(_ProcessPacket_rx_10000_125 + 2)
      0032DD 8E 82            [24] 2028 	mov	dpl,r6
      0032DF 8D 83            [24] 2029 	mov	dph,r5
      0032E1 8F F0            [24] 2030 	mov	b,r7
      0032E3 12 35 3E         [24] 2031 	lcall	__gptrget
      0032E6 FF               [12] 2032 	mov	r7,a
      0032E7 E4               [12] 2033 	clr	a
      0032E8 FD               [12] 2034 	mov	r5,a
      0032E9 48               [12] 2035 	orl	a,r0
      0032EA F5 08            [12] 2036 	mov	_IAP_WriteWord_PARM_2,a
      0032EC EF               [12] 2037 	mov	a,r7
      0032ED 4D               [12] 2038 	orl	a,r5
      0032EE F5 09            [12] 2039 	mov	(_IAP_WriteWord_PARM_2 + 1),a
                                   2040 ;	bootloader.c:104: if (IAP_WriteWord(addr + i, word) != 0) {
      0032F0 EA               [12] 2041 	mov	a,r2
      0032F1 29               [12] 2042 	add	a, r1
      0032F2 FA               [12] 2043 	mov	r2,a
      0032F3 EB               [12] 2044 	mov	a,r3
      0032F4 3C               [12] 2045 	addc	a, r4
      0032F5 FB               [12] 2046 	mov	r3,a
      0032F6 8A 82            [24] 2047 	mov	dpl,r2
      0032F8 8B 83            [24] 2048 	mov	dph,r3
      0032FA C0 04            [24] 2049 	push	ar4
      0032FC C0 01            [24] 2050 	push	ar1
      0032FE 12 2C BE         [24] 2051 	lcall	_IAP_WriteWord
      003301 E5 82            [12] 2052 	mov	a, dpl
      003303 D0 01            [24] 2053 	pop	ar1
      003305 D0 04            [24] 2054 	pop	ar4
      003307 60 05            [24] 2055 	jz	00127$
                                   2056 ;	bootloader.c:105: err = 1;
      003309 75 32 01         [24] 2057 	mov	_ProcessPacket_err_40000_139,#0x01
                                   2058 ;	bootloader.c:106: break;
      00330C 80 09            [24] 2059 	sjmp	00120$
      00330E                       2060 00127$:
                                   2061 ;	bootloader.c:102: for (uint8_t i = 0; i < len; i += 2) {
      00330E AD 33            [24] 2062 	mov	r5,_ProcessPacket_i_50000_140
      003310 74 02            [12] 2063 	mov	a,#0x02
      003312 2D               [12] 2064 	add	a, r5
      003313 F5 33            [12] 2065 	mov	_ProcessPacket_i_50000_140,a
      003315 80 8F            [24] 2066 	sjmp	00126$
      003317                       2067 00120$:
                                   2068 ;	bootloader.c:109: reply_buf[59] = err ? STATUS_WRITE_ERR : STATUS_OK;
      003317 E5 32            [12] 2069 	mov	a,_ProcessPacket_err_40000_139
      003319 60 02            [24] 2070 	jz	00130$
      00331B 74 04            [12] 2071 	mov	a,#0x04
      00331D                       2072 00130$:
      00331D 90 00 3B         [24] 2073 	mov	dptr,#(_reply_buf + 0x003b)
      003320 F0               [24] 2074 	movx	@dptr,a
                                   2075 ;	bootloader.c:111: break;
      003321 02 33 B1         [24] 2076 	ljmp	00124$
                                   2077 ;	bootloader.c:115: case CMD_VERIFY_CRC:
      003324                       2078 00121$:
                                   2079 ;	bootloader.c:117: uint16_t expected_crc = rx[5] | ((uint16_t)rx[6] << 8);
      003324 74 05            [12] 2080 	mov	a,#0x05
      003326 25 2A            [12] 2081 	add	a, _ProcessPacket_rx_10000_125
      003328 FD               [12] 2082 	mov	r5,a
      003329 E4               [12] 2083 	clr	a
      00332A 35 2B            [12] 2084 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      00332C FE               [12] 2085 	mov	r6,a
      00332D AF 2C            [24] 2086 	mov	r7,(_ProcessPacket_rx_10000_125 + 2)
      00332F 8D 82            [24] 2087 	mov	dpl,r5
      003331 8E 83            [24] 2088 	mov	dph,r6
      003333 8F F0            [24] 2089 	mov	b,r7
      003335 12 35 3E         [24] 2090 	lcall	__gptrget
      003338 FD               [12] 2091 	mov	r5,a
      003339 74 06            [12] 2092 	mov	a,#0x06
      00333B 25 2A            [12] 2093 	add	a, _ProcessPacket_rx_10000_125
      00333D FC               [12] 2094 	mov	r4,a
      00333E E4               [12] 2095 	clr	a
      00333F 35 2B            [12] 2096 	addc	a, (_ProcessPacket_rx_10000_125 + 1)
      003341 FE               [12] 2097 	mov	r6,a
      003342 AF 2C            [24] 2098 	mov	r7,(_ProcessPacket_rx_10000_125 + 2)
      003344 8C 82            [24] 2099 	mov	dpl,r4
      003346 8E 83            [24] 2100 	mov	dph,r6
      003348 8F F0            [24] 2101 	mov	b,r7
      00334A 12 35 3E         [24] 2102 	lcall	__gptrget
      00334D FF               [12] 2103 	mov	r7,a
      00334E E4               [12] 2104 	clr	a
      00334F FC               [12] 2105 	mov	r4,a
      003350 FE               [12] 2106 	mov	r6,a
      003351 ED               [12] 2107 	mov	a,r5
      003352 42 04            [12] 2108 	orl	ar4,a
      003354 EE               [12] 2109 	mov	a,r6
      003355 42 07            [12] 2110 	orl	ar7,a
                                   2111 ;	bootloader.c:118: uint16_t calc_crc = IAP_CalculateCRC16(0x0000, addr);
      003357 85 2F 08         [24] 2112 	mov	_IAP_CalculateCRC16_PARM_2,_ProcessPacket_addr_10000_125
      00335A 85 30 09         [24] 2113 	mov	(_IAP_CalculateCRC16_PARM_2 + 1),(_ProcessPacket_addr_10000_125 + 1)
      00335D 90 00 00         [24] 2114 	mov	dptr,#0x0000
      003360 C0 07            [24] 2115 	push	ar7
      003362 C0 04            [24] 2116 	push	ar4
      003364 12 2D 24         [24] 2117 	lcall	_IAP_CalculateCRC16
      003367 AD 82            [24] 2118 	mov	r5, dpl
      003369 AE 83            [24] 2119 	mov	r6, dph
      00336B D0 04            [24] 2120 	pop	ar4
      00336D D0 07            [24] 2121 	pop	ar7
                                   2122 ;	bootloader.c:119: reply_buf[4] = (uint8_t)(calc_crc & 0xFF);
      00336F 8D 03            [24] 2123 	mov	ar3,r5
      003371 90 00 04         [24] 2124 	mov	dptr,#(_reply_buf + 0x0004)
      003374 EB               [12] 2125 	mov	a,r3
      003375 F0               [24] 2126 	movx	@dptr,a
                                   2127 ;	bootloader.c:120: reply_buf[5] = (uint8_t)((calc_crc >> 8) & 0xFF);
      003376 8E 03            [24] 2128 	mov	ar3,r6
      003378 90 00 05         [24] 2129 	mov	dptr,#(_reply_buf + 0x0005)
      00337B EB               [12] 2130 	mov	a,r3
      00337C F0               [24] 2131 	movx	@dptr,a
                                   2132 ;	bootloader.c:121: reply_buf[59] = (calc_crc == expected_crc) ? STATUS_OK : STATUS_BAD_CRC;
      00337D ED               [12] 2133 	mov	a,r5
      00337E B5 04 08         [24] 2134 	cjne	a,ar4,00132$
      003381 EE               [12] 2135 	mov	a,r6
      003382 B5 07 04         [24] 2136 	cjne	a,ar7,00132$
      003385 7F 00            [12] 2137 	mov	r7,#0x00
      003387 80 02            [24] 2138 	sjmp	00133$
      003389                       2139 00132$:
      003389 7F 01            [12] 2140 	mov	r7,#0x01
      00338B                       2141 00133$:
      00338B 90 00 3B         [24] 2142 	mov	dptr,#(_reply_buf + 0x003b)
      00338E EF               [12] 2143 	mov	a,r7
      00338F F0               [24] 2144 	movx	@dptr,a
                                   2145 ;	bootloader.c:123: break;
                                   2146 ;	bootloader.c:125: case CMD_REBOOT:
      003390 80 1F            [24] 2147 	sjmp	00124$
      003392                       2148 00122$:
                                   2149 ;	bootloader.c:126: reply_buf[59] = STATUS_OK;
      003392 90 00 3B         [24] 2150 	mov	dptr,#(_reply_buf + 0x003b)
      003395 E4               [12] 2151 	clr	a
      003396 F0               [24] 2152 	movx	@dptr,a
                                   2153 ;	bootloader.c:127: USB_SendReport(reply_buf, 64);
      003397 75 28 40         [24] 2154 	mov	_USB_SendReport_PARM_2,#0x40
      00339A 90 00 00         [24] 2155 	mov	dptr,#_reply_buf
      00339D F5 F0            [12] 2156 	mov	b,a
      00339F 12 30 63         [24] 2157 	lcall	_USB_SendReport
                                   2158 ;	bootloader.c:128: DelayMs(50);
      0033A2 90 00 32         [24] 2159 	mov	dptr,#0x0032
      0033A5 12 30 8C         [24] 2160 	lcall	_DelayMs
                                   2161 ;	bootloader.c:129: JumpToApp();
                                   2162 ;	bootloader.c:130: return;
                                   2163 ;	bootloader.c:132: default:
      0033A8 02 30 B7         [24] 2164 	ljmp	_JumpToApp
      0033AB                       2165 00123$:
                                   2166 ;	bootloader.c:133: reply_buf[59] = STATUS_UNKNOWN;
      0033AB 90 00 3B         [24] 2167 	mov	dptr,#(_reply_buf + 0x003b)
      0033AE 74 FF            [12] 2168 	mov	a,#0xff
      0033B0 F0               [24] 2169 	movx	@dptr,a
                                   2170 ;	bootloader.c:135: }
      0033B1                       2171 00124$:
                                   2172 ;	bootloader.c:137: USB_SendReport(reply_buf, 64);
      0033B1 75 28 40         [24] 2173 	mov	_USB_SendReport_PARM_2,#0x40
      0033B4 90 00 00         [24] 2174 	mov	dptr,#_reply_buf
      0033B7 75 F0 00         [24] 2175 	mov	b, #0x00
      0033BA 12 30 63         [24] 2176 	lcall	_USB_SendReport
                                   2177 ;	bootloader.c:138: USB_ReleaseRx();
                                   2178 ;	bootloader.c:139: }
      0033BD 02 30 5C         [24] 2179 	ljmp	_USB_ReleaseRx
                                   2180 ;------------------------------------------------------------
                                   2181 ;Allocation info for local variables in function 'main'
                                   2182 ;------------------------------------------------------------
                                   2183 ;button_pressed Allocated to registers r7 
                                   2184 ;first_word    Allocated to registers r5 r6 
                                   2185 ;vec_word      Allocated to registers r3 r4 
                                   2186 ;is_blank      Allocated to registers r6 
                                   2187 ;timeout       Allocated to registers 
                                   2188 ;stay_in_bootloader Allocated to registers r7 
                                   2189 ;------------------------------------------------------------
                                   2190 ;	bootloader.c:141: void main(void) {
                                   2191 ;	-----------------------------------------
                                   2192 ;	 function main
                                   2193 ;	-----------------------------------------
      0033C0                       2194 _main:
                                   2195 ;	bootloader.c:143: P3_MOD_OC &= ~(1 << BOOT_PIN_BIT); // Quasi-bidirectional / pull-up mode
      0033C0 53 96 FB         [24] 2196 	anl	_P3_MOD_OC,#0xfb
                                   2197 ;	bootloader.c:144: P3_DIR_PU |=  (1 << BOOT_PIN_BIT); // Enable pullup
      0033C3 43 97 04         [24] 2198 	orl	_P3_DIR_PU,#0x04
                                   2199 ;	bootloader.c:145: P3_2 = 1; // High impedance input read
                                   2200 ;	assignBit
      0033C6 D2 B2            [12] 2201 	setb	_P3_2
                                   2202 ;	bootloader.c:148: P1_MOD_OC &= ~(1 << 5);
      0033C8 53 92 DF         [24] 2203 	anl	_P1_MOD_OC,#0xdf
                                   2204 ;	bootloader.c:149: P1_DIR_PU |=  (1 << 5);
      0033CB 43 93 20         [24] 2205 	orl	_P1_DIR_PU,#0x20
                                   2206 ;	bootloader.c:150: P1_5 = 1;
                                   2207 ;	assignBit
      0033CE D2 95            [12] 2208 	setb	_P1_5
                                   2209 ;	bootloader.c:153: uint8_t button_pressed = (P3_2 == 0) || (P1_5 == 0);
      0033D0 30 B2 07         [24] 2210 	jnb	_P3_2,00113$
      0033D3 30 95 04         [24] 2211 	jnb	_P1_5,00113$
                                   2212 ;	assignBit
      0033D6 C2 00            [12] 2213 	clr	_main_sloc0_1_0
      0033D8 80 02            [24] 2214 	sjmp	00114$
      0033DA                       2215 00113$:
                                   2216 ;	assignBit
      0033DA D2 00            [12] 2217 	setb	_main_sloc0_1_0
      0033DC                       2218 00114$:
      0033DC A2 00            [12] 2219 	mov	c,_main_sloc0_1_0
      0033DE E4               [12] 2220 	clr	a
      0033DF 33               [12] 2221 	rlc	a
      0033E0 FF               [12] 2222 	mov	r7,a
                                   2223 ;	bootloader.c:156: uint16_t first_word = IAP_ReadWord(0x0000);
      0033E1 90 00 00         [24] 2224 	mov	dptr,#0x0000
      0033E4 C0 07            [24] 2225 	push	ar7
      0033E6 12 2D 09         [24] 2226 	lcall	_IAP_ReadWord
      0033E9 AD 82            [24] 2227 	mov	r5, dpl
      0033EB AE 83            [24] 2228 	mov	r6, dph
                                   2229 ;	bootloader.c:157: uint16_t vec_word   = IAP_ReadWord(0x0008);
      0033ED 90 00 08         [24] 2230 	mov	dptr,#0x0008
      0033F0 C0 06            [24] 2231 	push	ar6
      0033F2 C0 05            [24] 2232 	push	ar5
      0033F4 12 2D 09         [24] 2233 	lcall	_IAP_ReadWord
      0033F7 AB 82            [24] 2234 	mov	r3, dpl
      0033F9 AC 83            [24] 2235 	mov	r4, dph
      0033FB D0 05            [24] 2236 	pop	ar5
      0033FD D0 06            [24] 2237 	pop	ar6
      0033FF D0 07            [24] 2238 	pop	ar7
                                   2239 ;	bootloader.c:158: uint8_t is_blank = (first_word == 0xFFFF) || (vec_word == 0xFFFF);
      003401 BD FF 05         [24] 2240 	cjne	r5,#0xff,00193$
      003404 BE FF 02         [24] 2241 	cjne	r6,#0xff,00193$
      003407 80 0C            [24] 2242 	sjmp	00116$
      003409                       2243 00193$:
      003409 BB FF 05         [24] 2244 	cjne	r3,#0xff,00194$
      00340C BC FF 02         [24] 2245 	cjne	r4,#0xff,00194$
      00340F 80 04            [24] 2246 	sjmp	00116$
      003411                       2247 00194$:
                                   2248 ;	assignBit
      003411 C2 00            [12] 2249 	clr	_main_sloc0_1_0
      003413 80 02            [24] 2250 	sjmp	00117$
      003415                       2251 00116$:
                                   2252 ;	assignBit
      003415 D2 00            [12] 2253 	setb	_main_sloc0_1_0
      003417                       2254 00117$:
      003417 A2 00            [12] 2255 	mov	c,_main_sloc0_1_0
      003419 E4               [12] 2256 	clr	a
      00341A 33               [12] 2257 	rlc	a
      00341B FE               [12] 2258 	mov	r6,a
                                   2259 ;	bootloader.c:161: USB_Init();
      00341C C0 07            [24] 2260 	push	ar7
      00341E C0 06            [24] 2261 	push	ar6
      003420 12 2D D1         [24] 2262 	lcall	_USB_Init
      003423 D0 06            [24] 2263 	pop	ar6
      003425 D0 07            [24] 2264 	pop	ar7
                                   2265 ;	bootloader.c:165: uint8_t stay_in_bootloader = button_pressed || is_blank;
      003427 EF               [12] 2266 	mov	a,r7
      003428 70 07            [24] 2267 	jnz	00119$
      00342A EE               [12] 2268 	mov	a,r6
      00342B 70 04            [24] 2269 	jnz	00119$
                                   2270 ;	assignBit
      00342D C2 00            [12] 2271 	clr	_main_sloc0_1_0
      00342F 80 02            [24] 2272 	sjmp	00120$
      003431                       2273 00119$:
                                   2274 ;	assignBit
      003431 D2 00            [12] 2275 	setb	_main_sloc0_1_0
      003433                       2276 00120$:
      003433 A2 00            [12] 2277 	mov	c,_main_sloc0_1_0
      003435 E4               [12] 2278 	clr	a
      003436 33               [12] 2279 	rlc	a
      003437 FF               [12] 2280 	mov	r7,a
                                   2281 ;	bootloader.c:167: while (1) {
      003438 7B 00            [12] 2282 	mov	r3,#0x00
      00343A 7C 00            [12] 2283 	mov	r4,#0x00
      00343C 7D 00            [12] 2284 	mov	r5,#0x00
      00343E 7E 00            [12] 2285 	mov	r6,#0x00
      003440                       2286 00108$:
                                   2287 ;	bootloader.c:168: USB_Process();
      003440 C0 07            [24] 2288 	push	ar7
      003442 C0 06            [24] 2289 	push	ar6
      003444 C0 05            [24] 2290 	push	ar5
      003446 C0 04            [24] 2291 	push	ar4
      003448 C0 03            [24] 2292 	push	ar3
      00344A 12 2F 85         [24] 2293 	lcall	_USB_Process
                                   2294 ;	bootloader.c:170: if (USB_Available()) {
      00344D 12 30 51         [24] 2295 	lcall	_USB_Available
      003450 E5 82            [12] 2296 	mov	a, dpl
      003452 D0 03            [24] 2297 	pop	ar3
      003454 D0 04            [24] 2298 	pop	ar4
      003456 D0 05            [24] 2299 	pop	ar5
      003458 D0 06            [24] 2300 	pop	ar6
      00345A D0 07            [24] 2301 	pop	ar7
      00345C 60 19            [24] 2302 	jz	00102$
                                   2303 ;	bootloader.c:171: stay_in_bootloader = 1; // Handshake received, cancel timeout
      00345E 7F 01            [12] 2304 	mov	r7,#0x01
                                   2305 ;	bootloader.c:172: ProcessPacket();
      003460 C0 07            [24] 2306 	push	ar7
      003462 C0 06            [24] 2307 	push	ar6
      003464 C0 05            [24] 2308 	push	ar5
      003466 C0 04            [24] 2309 	push	ar4
      003468 C0 03            [24] 2310 	push	ar3
      00346A 12 30 C4         [24] 2311 	lcall	_ProcessPacket
      00346D D0 03            [24] 2312 	pop	ar3
      00346F D0 04            [24] 2313 	pop	ar4
      003471 D0 05            [24] 2314 	pop	ar5
      003473 D0 06            [24] 2315 	pop	ar6
      003475 D0 07            [24] 2316 	pop	ar7
      003477                       2317 00102$:
                                   2318 ;	bootloader.c:175: if (!stay_in_bootloader) {
      003477 EF               [12] 2319 	mov	a,r7
      003478 70 C6            [24] 2320 	jnz	00108$
                                   2321 ;	bootloader.c:176: timeout++;
      00347A 0B               [12] 2322 	inc	r3
      00347B BB 00 09         [24] 2323 	cjne	r3,#0x00,00199$
      00347E 0C               [12] 2324 	inc	r4
      00347F BC 00 05         [24] 2325 	cjne	r4,#0x00,00199$
      003482 0D               [12] 2326 	inc	r5
      003483 BD 00 01         [24] 2327 	cjne	r5,#0x00,00199$
      003486 0E               [12] 2328 	inc	r6
      003487                       2329 00199$:
                                   2330 ;	bootloader.c:177: if (timeout > 2000000UL) { // ~4.0s timeout at 24MHz
      003487 C3               [12] 2331 	clr	c
      003488 74 80            [12] 2332 	mov	a,#0x80
      00348A 9B               [12] 2333 	subb	a,r3
      00348B 74 84            [12] 2334 	mov	a,#0x84
      00348D 9C               [12] 2335 	subb	a,r4
      00348E 74 1E            [12] 2336 	mov	a,#0x1e
      003490 9D               [12] 2337 	subb	a,r5
      003491 E4               [12] 2338 	clr	a
      003492 9E               [12] 2339 	subb	a,r6
      003493 50 AB            [24] 2340 	jnc	00108$
                                   2341 ;	free result
                                   2342 ;	bootloader.c:178: JumpToApp();
      003495 C0 07            [24] 2343 	push	ar7
      003497 C0 06            [24] 2344 	push	ar6
      003499 C0 05            [24] 2345 	push	ar5
      00349B C0 04            [24] 2346 	push	ar4
      00349D C0 03            [24] 2347 	push	ar3
      00349F 12 30 B7         [24] 2348 	lcall	_JumpToApp
      0034A2 D0 03            [24] 2349 	pop	ar3
      0034A4 D0 04            [24] 2350 	pop	ar4
      0034A6 D0 05            [24] 2351 	pop	ar5
      0034A8 D0 06            [24] 2352 	pop	ar6
      0034AA D0 07            [24] 2353 	pop	ar7
                                   2354 ;	bootloader.c:182: }
      0034AC 02 34 40         [24] 2355 	ljmp	00108$
                                   2356 	.area CSEG    (CODE)
                                   2357 	.area CONST   (CODE)
                                   2358 	.area CONST   (CODE)
      00355E                       2359 _DevDesc:
      00355E 12                    2360 	.db #0x12	; 18
      00355F 01                    2361 	.db #0x01	; 1
      003560 10                    2362 	.db #0x10	; 16
      003561 01                    2363 	.db #0x01	; 1
      003562 00                    2364 	.db #0x00	; 0
      003563 00                    2365 	.db #0x00	; 0
      003564 00                    2366 	.db #0x00	; 0
      003565 40                    2367 	.db #0x40	; 64
      003566 09                    2368 	.db #0x09	; 9
      003567 12                    2369 	.db #0x12	; 18
      003568 5D                    2370 	.db #0x5d	; 93
      003569 C5                    2371 	.db #0xc5	; 197
      00356A 00                    2372 	.db #0x00	; 0
      00356B 01                    2373 	.db #0x01	; 1
      00356C 01                    2374 	.db #0x01	; 1
      00356D 02                    2375 	.db #0x02	; 2
      00356E 03                    2376 	.db #0x03	; 3
      00356F 01                    2377 	.db #0x01	; 1
                                   2378 	.area CSEG    (CODE)
                                   2379 	.area CONST   (CODE)
      003570                       2380 _ReportDesc:
      003570 06                    2381 	.db #0x06	; 6
      003571 00                    2382 	.db #0x00	; 0
      003572 FF                    2383 	.db #0xff	; 255
      003573 09                    2384 	.db #0x09	; 9
      003574 01                    2385 	.db #0x01	; 1
      003575 A1                    2386 	.db #0xa1	; 161
      003576 01                    2387 	.db #0x01	; 1
      003577 09                    2388 	.db #0x09	; 9
      003578 02                    2389 	.db #0x02	; 2
      003579 15                    2390 	.db #0x15	; 21
      00357A 00                    2391 	.db #0x00	; 0
      00357B 26                    2392 	.db #0x26	; 38
      00357C FF                    2393 	.db #0xff	; 255
      00357D 00                    2394 	.db #0x00	; 0
      00357E 75                    2395 	.db #0x75	; 117	'u'
      00357F 08                    2396 	.db #0x08	; 8
      003580 95                    2397 	.db #0x95	; 149
      003581 40                    2398 	.db #0x40	; 64
      003582 91                    2399 	.db #0x91	; 145
      003583 02                    2400 	.db #0x02	; 2
      003584 09                    2401 	.db #0x09	; 9
      003585 03                    2402 	.db #0x03	; 3
      003586 15                    2403 	.db #0x15	; 21
      003587 00                    2404 	.db #0x00	; 0
      003588 26                    2405 	.db #0x26	; 38
      003589 FF                    2406 	.db #0xff	; 255
      00358A 00                    2407 	.db #0x00	; 0
      00358B 75                    2408 	.db #0x75	; 117	'u'
      00358C 08                    2409 	.db #0x08	; 8
      00358D 95                    2410 	.db #0x95	; 149
      00358E 40                    2411 	.db #0x40	; 64
      00358F 81                    2412 	.db #0x81	; 129
      003590 02                    2413 	.db #0x02	; 2
      003591 C0                    2414 	.db #0xc0	; 192
                                   2415 	.area CSEG    (CODE)
                                   2416 	.area CONST   (CODE)
      003592                       2417 _CfgDesc:
      003592 09                    2418 	.db #0x09	; 9
      003593 02                    2419 	.db #0x02	; 2
      003594 29                    2420 	.db #0x29	; 41
      003595 00                    2421 	.db #0x00	; 0
      003596 01                    2422 	.db #0x01	; 1
      003597 01                    2423 	.db #0x01	; 1
      003598 00                    2424 	.db #0x00	; 0
      003599 80                    2425 	.db #0x80	; 128
      00359A 32                    2426 	.db #0x32	; 50	'2'
      00359B 09                    2427 	.db #0x09	; 9
      00359C 04                    2428 	.db #0x04	; 4
      00359D 00                    2429 	.db #0x00	; 0
      00359E 00                    2430 	.db #0x00	; 0
      00359F 02                    2431 	.db #0x02	; 2
      0035A0 03                    2432 	.db #0x03	; 3
      0035A1 00                    2433 	.db #0x00	; 0
      0035A2 00                    2434 	.db #0x00	; 0
      0035A3 00                    2435 	.db #0x00	; 0
      0035A4 09                    2436 	.db #0x09	; 9
      0035A5 21                    2437 	.db #0x21	; 33
      0035A6 11                    2438 	.db #0x11	; 17
      0035A7 01                    2439 	.db #0x01	; 1
      0035A8 00                    2440 	.db #0x00	; 0
      0035A9 01                    2441 	.db #0x01	; 1
      0035AA 22                    2442 	.db #0x22	; 34
      0035AB 22                    2443 	.db #0x22	; 34
      0035AC 00                    2444 	.db #0x00	; 0
      0035AD 07                    2445 	.db #0x07	; 7
      0035AE 05                    2446 	.db #0x05	; 5
      0035AF 01                    2447 	.db #0x01	; 1
      0035B0 03                    2448 	.db #0x03	; 3
      0035B1 40                    2449 	.db #0x40	; 64
      0035B2 00                    2450 	.db #0x00	; 0
      0035B3 01                    2451 	.db #0x01	; 1
      0035B4 07                    2452 	.db #0x07	; 7
      0035B5 05                    2453 	.db #0x05	; 5
      0035B6 81                    2454 	.db #0x81	; 129
      0035B7 03                    2455 	.db #0x03	; 3
      0035B8 40                    2456 	.db #0x40	; 64
      0035B9 00                    2457 	.db #0x00	; 0
      0035BA 01                    2458 	.db #0x01	; 1
                                   2459 	.area CSEG    (CODE)
                                   2460 	.area CONST   (CODE)
      0035BB                       2461 _Str0Desc:
      0035BB 04                    2462 	.db #0x04	; 4
      0035BC 03                    2463 	.db #0x03	; 3
      0035BD 09                    2464 	.db #0x09	; 9
      0035BE 04                    2465 	.db #0x04	; 4
                                   2466 	.area CSEG    (CODE)
                                   2467 	.area CONST   (CODE)
      0035BF                       2468 _Str1Desc:
      0035BF 0E                    2469 	.db #0x0e	; 14
      0035C0 03                    2470 	.db #0x03	; 3
      0035C1 44                    2471 	.db #0x44	; 68	'D'
      0035C2 00                    2472 	.db #0x00	; 0
      0035C3 65                    2473 	.db #0x65	; 101	'e'
      0035C4 00                    2474 	.db #0x00	; 0
      0035C5 76                    2475 	.db #0x76	; 118	'v'
      0035C6 00                    2476 	.db #0x00	; 0
      0035C7 42                    2477 	.db #0x42	; 66	'B'
      0035C8 00                    2478 	.db #0x00	; 0
      0035C9 6F                    2479 	.db #0x6f	; 111	'o'
      0035CA 00                    2480 	.db #0x00	; 0
      0035CB 78                    2481 	.db #0x78	; 120	'x'
      0035CC 00                    2482 	.db #0x00	; 0
                                   2483 	.area CSEG    (CODE)
                                   2484 	.area CONST   (CODE)
      0035CD                       2485 _Str2Desc:
      0035CD 20                    2486 	.db #0x20	; 32
      0035CE 03                    2487 	.db #0x03	; 3
      0035CF 49                    2488 	.db #0x49	; 73	'I'
      0035D0 00                    2489 	.db #0x00	; 0
      0035D1 64                    2490 	.db #0x64	; 100	'd'
      0035D2 00                    2491 	.db #0x00	; 0
      0035D3 61                    2492 	.db #0x61	; 97	'a'
      0035D4 00                    2493 	.db #0x00	; 0
      0035D5 6E                    2494 	.db #0x6e	; 110	'n'
      0035D6 00                    2495 	.db #0x00	; 0
      0035D7 27                    2496 	.db #0x27	; 39
      0035D8 00                    2497 	.db #0x00	; 0
      0035D9 73                    2498 	.db #0x73	; 115	's'
      0035DA 00                    2499 	.db #0x00	; 0
      0035DB 20                    2500 	.db #0x20	; 32
      0035DC 00                    2501 	.db #0x00	; 0
      0035DD 44                    2502 	.db #0x44	; 68	'D'
      0035DE 00                    2503 	.db #0x00	; 0
      0035DF 65                    2504 	.db #0x65	; 101	'e'
      0035E0 00                    2505 	.db #0x00	; 0
      0035E1 76                    2506 	.db #0x76	; 118	'v'
      0035E2 00                    2507 	.db #0x00	; 0
      0035E3 42                    2508 	.db #0x42	; 66	'B'
      0035E4 00                    2509 	.db #0x00	; 0
      0035E5 6F                    2510 	.db #0x6f	; 111	'o'
      0035E6 00                    2511 	.db #0x00	; 0
      0035E7 61                    2512 	.db #0x61	; 97	'a'
      0035E8 00                    2513 	.db #0x00	; 0
      0035E9 72                    2514 	.db #0x72	; 114	'r'
      0035EA 00                    2515 	.db #0x00	; 0
      0035EB 64                    2516 	.db #0x64	; 100	'd'
      0035EC 00                    2517 	.db #0x00	; 0
                                   2518 	.area CSEG    (CODE)
                                   2519 	.area CONST   (CODE)
      0035ED                       2520 _Str3Desc:
      0035ED 0A                    2521 	.db #0x0a	; 10
      0035EE 03                    2522 	.db #0x03	; 3
      0035EF 76                    2523 	.db #0x76	; 118	'v'
      0035F0 00                    2524 	.db #0x00	; 0
      0035F1 31                    2525 	.db #0x31	; 49	'1'
      0035F2 00                    2526 	.db #0x00	; 0
      0035F3 2E                    2527 	.db #0x2e	; 46
      0035F4 00                    2528 	.db #0x00	; 0
      0035F5 30                    2529 	.db #0x30	; 48	'0'
      0035F6 00                    2530 	.db #0x00	; 0
                                   2531 	.area CSEG    (CODE)
                                   2532 	.area XINIT   (CODE)
                                   2533 	.area CABS    (ABS,CODE)
