#include <string.h>

char buffer[10];
uint8_t index = 0;

void setup() {

}

void loop() {
    while (USBSerial_available() > 0)
    {
        char c = USBSerial_read();

        if (c == '\n' || c == '\r') {
      
            if (index > 0) {
                
                buffer[index] = '\0';

                if (strcmp(buffer, "BT") == 0) {
                    USBSerial_println("OK");
                }
        
            index = 0;
            }
        } 
        else {
            if (index < 9) {
                buffer[index] = c;
                index++;
            }
        }
    }
    
}