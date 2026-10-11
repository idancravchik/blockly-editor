/**
 * ch552_sdcc.h - Minimal standalone header for CH552 development with SDCC.
 * Compatible with pure SDCC on PC, Android, and WebAssembly.
 */

#ifndef __CH552_SDCC_H__
#define __CH552_SDCC_H__

#include <stdint.h>
#include <stdbool.h>

/* --- Core Special Function Registers (SFRs) --- */
__sfr __at (0x80) P0;
__sfr __at (0x81) SP;
__sfr __at (0x82) DPL;
__sfr __at (0x83) DPH;
__sfr __at (0x87) PCON;
__sfr __at (0x88) TCON;
__sfr __at (0x89) TMOD;
__sfr __at (0x8A) TL0;
__sfr __at (0x8B) TL1;
__sfr __at (0x8C) TH0;
__sfr __at (0x8D) TH1;

__sfr __at (0x90) P1;
__sfr __at (0x98) SCON;
__sfr __at (0x99) SBUF;

__sfr __at (0xA0) P2;
__sfr __at (0xA1) SAFE_MOD;
__sfr __at (0xA8) IE;

__sfr __at (0xB0) P3;
__sfr __at (0xB1) CLOCK_CFG;
__sfr __at (0xB2) P1_DIR_PU;
__sfr __at (0xB3) P1_MOD_OC;
__sfr __at (0xB4) P3_DIR_PU;
__sfr __at (0xB5) P3_MOD_OC;

__sfr __at (0xC0) P1_IE;
__sfr __at (0xC8) T2CON;
__sfr __at (0xC9) T2MOD;
__sfr __at (0xCA) RCAP2L;
__sfr __at (0xCB) RCAP2H;
__sfr __at (0xCC) TL2;
__sfr __at (0xCD) TH2;

__sfr __at (0xD0) PSW;
__sfr __at (0xE0) ACC;
__sfr __at (0xF0) B;
__sfr __at (0x9B) PWM_DATA1;
__sfr __at (0x9C) PWM_DATA2;
__sfr __at (0x9D) PWM_CTRL;
__sfr __at (0x80) ADC_CTRL;
__sfr __at (0x81) ADC_DATA;

/* --- Port 1 SBITs --- */
__sbit __at (0x90) P1_0;
__sbit __at (0x91) P1_1;
__sbit __at (0x92) P1_2;
__sbit __at (0x93) P1_3;
__sbit __at (0x94) P1_4;
__sbit __at (0x95) P1_5;
__sbit __at (0x96) P1_6;
__sbit __at (0x97) P1_7;

/* --- Port 3 SBITs --- */
__sbit __at (0xB0) P3_0;
__sbit __at (0xB1) P3_1;
__sbit __at (0xB2) P3_2;
__sbit __at (0xB3) P3_3;
__sbit __at (0xB4) P3_4;
__sbit __at (0xB5) P3_5;
__sbit __at (0xB6) P3_6;
__sbit __at (0xB7) P3_7;

/* --- Helper Pin Macros --- */
#define PIN_MODE_OUTPUT(port, bit) do { \
    if ((port) == 1) { P1_DIR_PU |= (1 << (bit)); P1_MOD_OC &= ~(1 << (bit)); } \
    else if ((port) == 3) { P3_DIR_PU |= (1 << (bit)); P3_MOD_OC &= ~(1 << (bit)); } \
} while(0)

#define PIN_MODE_INPUT_PULLUP(port, bit) do { \
    if ((port) == 1) { P1_DIR_PU |= (1 << (bit)); P1_MOD_OC |= (1 << (bit)); } \
    else if ((port) == 3) { P3_DIR_PU |= (1 << (bit)); P3_MOD_OC |= (1 << (bit)); } \
} while(0)

#define PIN_MODE_INPUT_FLOAT(port, bit) do { \
    if ((port) == 1) { P1_DIR_PU &= ~(1 << (bit)); P1_MOD_OC &= ~(1 << (bit)); } \
    else if ((port) == 3) { P3_DIR_PU &= ~(1 << (bit)); P3_MOD_OC &= ~(1 << (bit)); } \
} while(0)

/* --- Calibrated Millisecond Delay for 16MHz Clock --- */
static inline void delay_ms(uint16_t ms) {
    uint16_t i;
    while (ms--) {
        for (i = 0; i < 1600; i++) {
            __asm__("nop");
        }
    }
}

/* --- Calibrated Microsecond Delay --- */
static inline void delay_us(uint16_t us) {
    while (us--) {
        __asm__("nop");
        __asm__("nop");
    }
}

#endif // __CH552_SDCC_H__
