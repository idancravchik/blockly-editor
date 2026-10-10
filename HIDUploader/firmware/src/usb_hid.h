#ifndef __USB_HID_H__
#define __USB_HID_H__

#include <stdint.h>
#include "ch552.h"

#define HID_REPORT_SIZE     64
#define VENDOR_ID           0x1209
#define PRODUCT_ID          0xC55D

// Initializes the USB controller in Full-Speed HID Device mode
void USB_Init(void);

// Polls the USB SIE hardware (no interrupts needed)
void USB_Process(void);

// Returns 1 if a 64-byte OUT packet is ready to read from host
uint8_t USB_Available(void);

// Returns pointer to the 64-byte received payload
uint8_t *USB_GetRxBuffer(void);

// Releases the RX buffer so the next packet can be received
void USB_ReleaseRx(void);

// Sends a 64-byte Input Report back to the host
void USB_SendReport(const uint8_t *buf, uint8_t len);

// Shuts down USB hardware prior to jumping to application code
void USB_Shutdown(void);

#endif // __USB_HID_H__
