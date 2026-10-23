#include "iap_flash.h"

uint8_t IAP_WriteWord(uint16_t addr, uint16_t data_word) {
    uint8_t status;

    // Safety bounds check: never overwrite the bootloader partition
    if (addr >= BOOTLOADER_START) {
        return 0x03; // Out of bounds error
    }

    // Must be even address
    addr &= ~0x0001;

    // Disable all interrupts during flash programming
    EA = 0;

    // Enter safe mode and enable code write
    SAFE_MOD = 0x55;
    SAFE_MOD = 0xAA;
    GLOBAL_CFG |= bCODE_WE;
    SAFE_MOD = 0x00;

    // Load address and 16-bit word
    ROM_ADDR_L = (uint8_t)(addr & 0xFF);
    ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);
    ROM_DATA_L = (uint8_t)(data_word & 0xFF);
    ROM_DATA_H = (uint8_t)((data_word >> 8) & 0xFF);

    // Trigger flash write
    ROM_CTRL = ROM_CMD_WRITE;

    // Read result status
    status = ROM_STATUS;

    // Re-lock safe mode and disable code write
    SAFE_MOD = 0x55;
    SAFE_MOD = 0xAA;
    GLOBAL_CFG &= ~bCODE_WE;
    SAFE_MOD = 0x00;

    // Re-enable interrupts if they were enabled
    EA = 1;

    // Success if address valid (bit 6 set) and no command error (bit 1 clear)
    if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
        return 0x04; // Write error
    }
    return 0x00;
}

uint16_t IAP_ReadWord(uint16_t addr) {
    uint8_t low, high;
    __code const uint8_t *ptr = (__code const uint8_t *)addr;
    low = *ptr;
    high = *(ptr + 1);
    return ((uint16_t)high << 8) | low;
}

uint16_t IAP_CalculateCRC16(uint16_t start_addr, uint16_t length) {
    uint16_t crc = 0xFFFF;
    __code const uint8_t *ptr = (__code const uint8_t *)start_addr;

    for (uint16_t i = 0; i < length; i++) {
        uint8_t byte = *ptr++;
        crc ^= ((uint16_t)byte << 8);
        for (uint8_t b = 0; b < 8; b++) {
            if (crc & 0x8000) {
                crc = (crc << 1) ^ 0x1021;
            } else {
                crc <<= 1;
            }
        }
    }
    return crc;
}

#ifndef ROM_CMD_ERASE
#define ROM_CMD_ERASE 0xA6
#endif

uint8_t IAP_ErasePage(uint16_t addr) {
    uint8_t status;
    uint8_t ea_saved;

    if (addr >= BOOTLOADER_START) return 0x03;

    addr &= ~0x03FF; // יישור לבלוק 1KB

    ea_saved = EA;
    EA = 0;

    // כניסה ל-Safe Mode
    SAFE_MOD = 0x55;
    SAFE_MOD = 0xAA;
    GLOBAL_CFG |= bCODE_WE;

    ROM_ADDR_L = (uint8_t)(addr & 0xFF);
    ROM_ADDR_H = (uint8_t)((addr >> 8) & 0xFF);

    ROM_CTRL = ROM_CMD_ERASE; // ביצוע המחיקה כשה-Safe Mode עדיין פתוח!

    status = ROM_STATUS;

    // נעילה רק בסיום הפעולה
    SAFE_MOD = 0x55;
    SAFE_MOD = 0xAA;
    GLOBAL_CFG &= ~bCODE_WE;
    SAFE_MOD = 0x00;

    EA = ea_saved;

    if ((status & bROM_CMD_ERR) || !(status & bROM_ADDR_OK)) {
        return 0x04;
    }
    return 0x00;
}
