#include "ch552.h"
#include "ch552_usb.h"
#include <stdint.h>
#include <string.h>

// User application runs at 0x0000 (User Flash partition)
__xdata __at(0x0000) uint8_t Ep0Buffer[64];
__xdata __at(0x0040) uint8_t Ep1Buffer[64];

static uint8_t usb_dev_addr = 0;
static uint8_t usb_config = 0;
static const __code uint8_t *setup_tx_ptr = 0;
static uint16_t setup_tx_len = 0;

// Device Descriptor
static const __code uint8_t DevDesc[] = {
    0x12, 0x01, 0x10, 0x01, 0x00, 0x00, 0x00, 0x40,
    0x09, 0x12, 0x5D, 0xC5, 0x00, 0x01, 0x01, 0x02, 0x00, 0x01
};

// Standard USB HID Keyboard Report Descriptor
static const __code uint8_t ReportDesc[] = {
    0x05, 0x01, 0x09, 0x06, 0xA1, 0x01, 0x05, 0x07,
    0x19, 0xE0, 0x29, 0xE7, 0x15, 0x00, 0x25, 0x01,
    0x75, 0x01, 0x95, 0x08, 0x81, 0x02, 0x95, 0x01,
    0x75, 0x08, 0x81, 0x03, 0x95, 0x05, 0x75, 0x01,
    0x05, 0x08, 0x19, 0x01, 0x29, 0x05, 0x91, 0x02,
    0x95, 0x01, 0x75, 0x03, 0x91, 0x03, 0x95, 0x06,
    0x75, 0x08, 0x15, 0x00, 0x25, 0x65, 0x05, 0x07,
    0x19, 0x00, 0x29, 0x65, 0x81, 0x00, 0xC0
};

// Configuration Descriptor (34 bytes)
static const __code uint8_t CfgDesc[] = {
    0x09, 0x02, 0x22, 0x00, 0x01, 0x01, 0x00, 0xA0, 0x32,
    0x09, 0x04, 0x00, 0x00, 0x01, 0x03, 0x01, 0x01, 0x00,
    0x09, 0x21, 0x11, 0x01, 0x00, 0x01, 0x22, sizeof(ReportDesc), 0x00,
    0x07, 0x05, 0x81, 0x03, 0x08, 0x00, 0x0A
};

static const __code uint8_t Str0Desc[] = { 0x04, 0x03, 0x09, 0x04 };
static const __code uint8_t Str1Desc[] = { 0x0E, 0x03, 'D',0,'e',0,'v',0,'B',0,'o',0,'x',0 };
static const __code uint8_t Str2Desc[] = { 0x1A, 0x03, 'C',0,'H',0,'5',0,'5',0,'2',0,' ',0,'K',0,'e',0,'y',0,' ',0,'A',0 };

void USB_Init(void) {
    SAFE_MOD = 0x55; SAFE_MOD = 0xAA; CLOCK_CFG = 0x86; SAFE_MOD = 0x00; // 24MHz
    USB_CTRL = bUC_RESET_SIE | bUC_CLR_ALL; USB_CTRL = 0x00;
    UEP0_DMA_L = (uint8_t)((uint16_t)Ep0Buffer & 0xFF);
    UEP0_DMA_H = (uint8_t)(((uint16_t)Ep0Buffer >> 8) & 0xFF);
    UEP1_DMA_L = (uint8_t)((uint16_t)Ep1Buffer & 0xFF);
    UEP1_DMA_H = (uint8_t)(((uint16_t)Ep1Buffer >> 8) & 0xFF);
    UEP4_1_MOD = 0x40; // EP1 IN enable
    UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
    UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
    USB_CTRL = bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;
    UDEV_CTRL = bUD_PD_DIS | bUD_PORT_EN;
    USB_DEV_AD = 0x00;
}

static void Handle_EP0_Setup(void) {
    uint8_t req_type = Ep0Buffer[0];
    uint8_t req = Ep0Buffer[1];
    uint16_t value = Ep0Buffer[2] | ((uint16_t)Ep0Buffer[3] << 8);
    uint16_t length = Ep0Buffer[6] | ((uint16_t)Ep0Buffer[7] << 8);
    setup_tx_ptr = 0; setup_tx_len = 0;

    if ((req_type & USB_REQ_TYP_MASK) == USB_REQ_TYP_STANDARD) {
        switch (req) {
            case USB_GET_DESCRIPTOR:
                switch (Ep0Buffer[3]) {
                    case 0x01: setup_tx_ptr = DevDesc; setup_tx_len = sizeof(DevDesc); break;
                    case 0x02: setup_tx_ptr = CfgDesc; setup_tx_len = sizeof(CfgDesc); break;
                    case 0x03:
                        if (Ep0Buffer[2] == 0) { setup_tx_ptr = Str0Desc; setup_tx_len = sizeof(Str0Desc); }
                        else if (Ep0Buffer[2] == 1) { setup_tx_ptr = Str1Desc; setup_tx_len = sizeof(Str1Desc); }
                        else if (Ep0Buffer[2] == 2) { setup_tx_ptr = Str2Desc; setup_tx_len = sizeof(Str2Desc); }
                        break;
                    case 0x22: setup_tx_ptr = ReportDesc; setup_tx_len = sizeof(ReportDesc); break;
                }
                break;
            case USB_SET_ADDRESS: usb_dev_addr = (uint8_t)value; break;
            case USB_SET_CONFIGURATION: usb_config = (uint8_t)value; break;
            case USB_GET_STATUS: Ep0Buffer[0] = 0; Ep0Buffer[1] = 0; setup_tx_len = 2; break;
        }
    }

    if (setup_tx_len > length) setup_tx_len = length;
    uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
    if (setup_tx_ptr && send_len > 0) {
        memcpy(Ep0Buffer, setup_tx_ptr, send_len);
        setup_tx_ptr += send_len; setup_tx_len -= send_len;
    }
    UEP0_T_LEN = send_len;
    UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_T_RES_ACK | UEP_R_RES_ACK;
}

void USB_Process(void) {
    if (UIF_BUS_RST) {
        USB_DEV_AD = 0x00;
        UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
        UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;
        UIF_BUS_RST = 0;
        return;
    }
    if (UIF_TRANSFER) {
        uint8_t token = USB_INT_ST & MASK_UIS_TOKEN;
        uint8_t endp = USB_INT_ST & MASK_UIS_ENDP;
        if (endp == 0) {
            if (token == UIS_TOKEN_SETUP) {
                Handle_EP0_Setup();
            } else if (token == UIS_TOKEN_IN) {
                if (usb_dev_addr != 0 && USB_DEV_AD == 0) USB_DEV_AD = usb_dev_addr;
                if (setup_tx_len > 0) {
                    uint8_t send_len = (setup_tx_len > 64) ? 64 : (uint8_t)setup_tx_len;
                    memcpy(Ep0Buffer, setup_tx_ptr, send_len);
                    setup_tx_ptr += send_len; setup_tx_len -= send_len;
                    UEP0_T_LEN = send_len;
                    UEP0_CTRL ^= bUEP_T_TOG;
                    UEP0_CTRL = (UEP0_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
                } else {
                    UEP0_T_LEN = 0;
                    UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
                }
            } else if (token == UIS_TOKEN_OUT) {
                UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
            }
        } else if (endp == 1) {
            if (token == UIS_TOKEN_IN) {
                UEP1_T_LEN = 0;
                UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_NAK;
            }
        }
        UIF_TRANSFER = 0;
    }
}

void SendKey(uint8_t keycode) {
    while (UEP1_CTRL & 0x03) { USB_Process(); } // Wait until EP1 IN is idle
    Ep1Buffer[0] = 0; // No modifiers
    Ep1Buffer[1] = 0; // Reserved
    Ep1Buffer[2] = keycode;
    memset(&Ep1Buffer[3], 0, 5);
    UEP1_T_LEN = 8;
    UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;

    // Wait and send key release
    for (uint16_t i = 0; i < 20000; i++) { USB_Process(); }
    while (UEP1_CTRL & 0x03) { USB_Process(); }
    memset(Ep1Buffer, 0, 8);
    UEP1_T_LEN = 8;
    UEP1_CTRL = (UEP1_CTRL & ~MASK_UEP_T_RES) | UEP_T_RES_ACK;
}

void main(void) {
    USB_Init();

    while (1) {
        // Wait ~1 second while processing USB
        for (uint32_t i = 0; i < 180000UL; i++) {
            USB_Process();
        }

        // Send Key 'A' (HID Keycode 0x04)
        if (usb_config != 0) {
            SendKey(0x04);
        }
    }
}
