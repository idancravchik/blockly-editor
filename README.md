# pin defenitions
| port 1 | main, SDA, PWM|
|-----|----|
| <-- | P1.7 |
| <-- | P1.5 |
| <-- | 3.3V |
| <-- | GND |

| port | secondery, SCL|
|----|----|
| <-- | P1.6 |
| <-- | P1.4 |
| <-- | 3.3V|
| <-- | GND|




MODULE NAMES:
SERVO
BUZZER
BUTTON
TEMPHUM



אני צריך ליצור מערכ ליצירת קבועי מערכת לפינים. לי יש 2 חיבורי מודולים בלוח ולכל אחד מהם 2 פינים.
הפעולה תקבל את המודול שמחוברים לכל חיבור ותקבע את הקבועים של אותו מודול לפינים של החיבור.
מיפוי פינים:
port 1:
main - 15
sec - 17
port 2:
main - 14
sec - 16

קבועים שצריך (אם אני נותן רק פין אחד לסוג מודול מדובר על הראשי של אותו החיבור, אם לא אז להתאים לפי השם)
SERVO_PIN
BUTTON_PIN
BUZZER_PIN
TEMPHUM_TX (MAIN)
TEMPHUM_RX (SEC)