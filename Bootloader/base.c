#include <stdint.h>
#include <string.h>

char buffer[10];
uint8_t index = 0;

// --- State Machine Variables ---
uint8_t current_mode = 0; // 0=IDLE, 1=SV, 3=BZ
uint8_t active_pin = 0;
unsigned long last_time = 0;
uint8_t toggle_state = 0;

// --- Servo Control Variables ---
uint16_t servo_pulse_us = 1000;
unsigned long last_angle_toggle = 0;

// --- Student Code Forward Declarations ---
void student_setup();
void student_loop();

// --- INJECT STUDENT CODE HERE ---
{STUDENT_CODE}
// --------------------------------

void stop_all() {
    current_mode = 0; // חזרה למצב מנוחה
    #ifdef SERVO_PIN
    digitalWrite(SERVO_PIN, LOW);
    #endif
    #ifdef BUZZER_PIN
    digitalWrite(BUZZER_PIN, LOW);
    #endif
    digitalWrite(14, LOW);
    digitalWrite(15, LOW);
    digitalWrite(16, LOW);
    digitalWrite(17, LOW);
    USBSerial_println("Stopped");
}

void setup() {
    delay(1000);
    USBSerial_println("DevboxV1 initiated successfully!");
    
    // קריאה לקוד ההתחלתי של התלמיד
    student_setup();
}

void loop() {
    // 1. קריאת סריאל ובדיקת פקודות
    while (USBSerial_available() > 0) {
        char c = USBSerial_read();
        
        if (c == '\n' || c == '\r') {
            if (index > 0) {
                buffer[index] = '\0';
                
                if (strncmp(buffer, "ST", 2) == 0) {
                    stop_all();
                }
                else if (strncmp(buffer, "BT", 2) == 0) {
                    #ifdef BUTTON_PIN
                    pinMode(BUTTON_PIN, INPUT);
                    if (digitalRead(BUTTON_PIN) == HIGH) USBSerial_println("h");
                    else USBSerial_println("l");
                    #else
                    USBSerial_println("No button defined");
                    #endif
                }
                else if (strncmp(buffer, "BZ", 2) == 0) {
                    #ifdef BUZZER_PIN
                    pinMode(BUZZER_PIN, OUTPUT);
                    current_mode = 3; active_pin = BUZZER_PIN; toggle_state = 1;
                    digitalWrite(BUZZER_PIN, HIGH);
                    last_time = millis();
                    #else
                    USBSerial_println("No buzzer defined");
                    #endif
                }
                else if (strncmp(buffer, "RST", 3) == 0 || strncmp(buffer, "BOOT", 4) == 0) {
                    USBSerial_println("BOOTLOADER_MODE");
                    delay(50);
                    #ifdef EA
                    EA = 0;
                    #endif
                    #ifdef USB_CTRL
                    USB_CTRL = 0;
                    #endif
                    delay(100);
                    ((void (*)(void))0x3800)();
                }
                else if (strncmp(buffer, "SV", 2) == 0) {
                    #ifdef SERVO_PIN
                    pinMode(SERVO_PIN, OUTPUT);
                    current_mode = 1; active_pin = SERVO_PIN;
                    servo_pulse_us = 1000;
                    last_time = millis();
                    last_angle_toggle = millis();
                    #else
                    USBSerial_println("No servo defined");
                    #endif
                }
                index = 0; // איפוס הראפר להודעה הבאה
            }
        } else {
            if (index < 9) {
                buffer[index] = c;
                index++;
            }
        }
    }
    
    // 2. ניהול המצבים ברקע (Non-blocking)
    if (current_mode != 0) {
        unsigned long current_time = millis();
        
        // באזר - הבהוב/פעימה כל 3000 מילישניות
        if (current_mode == 3) {
            if (current_time - last_time >= 3000) {
                toggle_state = !toggle_state;
                if (toggle_state) {
                    digitalWrite(active_pin, HIGH);
                } else {
                    digitalWrite(active_pin, LOW);
                }
                last_time = current_time;
            }
        }
        // סרוו - ייצור פולסים 50Hz (20ms) והחלפת זווית מ-0 ל-180 מעלות (1000us / 2000us) כל 1000ms
        else if (current_mode == 1) {
            if (current_time - last_angle_toggle >= 1000) {
                last_angle_toggle = current_time;
                if (servo_pulse_us == 1000) {
                    servo_pulse_us = 2000;
                } else {
                    servo_pulse_us = 1000;
                }
            }
            if (current_time - last_time >= 20) {
                last_time = current_time;
                digitalWrite(active_pin, HIGH);
                delayMicroseconds(servo_pulse_us);
                digitalWrite(active_pin, LOW);
            }
        }
    }
    
    // 3. הרצת הלולאה של התלמיד
    student_loop();
}
