#include <stdint.h>
#include <string.h>

char buffer[10];
uint8_t index = 0;

// --- State Machine Variables ---
uint8_t current_mode = 0; // 0=IDLE, 1=SV, 2=DC, 3=BZ
uint8_t active_pin = 0;
unsigned long last_time = 0;
uint8_t toggle_state = 0;

// --- Student Code Forward Declarations ---
void student_setup();
void student_loop();

// --- INJECT STUDENT CODE HERE ---
{STUDENT_CODE}
// --------------------------------

void stop_all() {
    current_mode = 0; // חזרה למצב מנוחה
    // כיבוי כל הפינים האפשריים
    digitalWrite(14, LOW);
    digitalWrite(15, LOW);
    digitalWrite(16, LOW);
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
        
        if (c == '\\n' || c == '\\r') {
            if (index > 0) {
                buffer[index] = '\\0';
                
                if (strncmp(buffer, "ST", 2) == 0) {
                    stop_all();
                }
                else if (strncmp(buffer, "BT1", 3) == 0) {
                    pinMode(15, INPUT_PULLUP);
                    if (digitalRead(15) == HIGH) USBSerial_println("h");
                    else USBSerial_println("l");
                }
                else if (strncmp(buffer, "BT2", 3) == 0) {
                    pinMode(14, INPUT_PULLUP);
                    if (digitalRead(14) == HIGH) USBSerial_println("h");
                    else USBSerial_println("l");
                }
                else if (strncmp(buffer, "DC1", 3) == 0) {
                    pinMode(15, OUTPUT);
                    current_mode = 2; active_pin = 15; toggle_state = 1;
                    digitalWrite(15, HIGH);
                    last_time = millis();
                }
                else if (strncmp(buffer, "DC2", 3) == 0) {
                    pinMode(14, OUTPUT);
                    current_mode = 2; active_pin = 14; toggle_state = 1;
                    digitalWrite(14, HIGH);
                    last_time = millis();
                }
                else if (strncmp(buffer, "BZ1", 3) == 0) {
                    pinMode(15, OUTPUT);
                    current_mode = 3; active_pin = 15; toggle_state = 1;
                    digitalWrite(15, HIGH);
                    last_time = millis();
                }
                else if (strncmp(buffer, "BZ2", 3) == 0) {
                    pinMode(16, OUTPUT);
                    current_mode = 3; active_pin = 16; toggle_state = 1;
                    digitalWrite(16, HIGH);
                    last_time = millis();
                }
                else if (strncmp(buffer, "SV1", 3) == 0) {
                    pinMode(15, OUTPUT);
                    current_mode = 1; active_pin = 15; toggle_state = 1;
                    digitalWrite(15, HIGH); // מדמה פעולת סרוו במידה ואין ספרייה ייעודית
                    last_time = millis();
                }
                else if (strncmp(buffer, "SV2", 3) == 0) {
                    pinMode(14, OUTPUT);
                    current_mode = 1; active_pin = 14; toggle_state = 1;
                    digitalWrite(14, HIGH);
                    last_time = millis();
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
        
        // מנוע או באזר - הבהוב כל 3000 מילישניות
        if (current_mode == 2 || current_mode == 3) {
            if (current_time - last_time >= 3000) {
                toggle_state = !toggle_state;
                digitalWrite(active_pin, toggle_state ? HIGH : LOW);
                last_time = current_time;
            }
        }
        // סרוו - הבהוב כל 200 מילישניות
        else if (current_mode == 1) {
            if (current_time - last_time >= 200) {
                toggle_state = !toggle_state;
                digitalWrite(active_pin, toggle_state ? HIGH : LOW);
                last_time = current_time;
            }
        }
    }
    
    // 3. הרצת הלולאה של התלמיד
    student_loop();
}
