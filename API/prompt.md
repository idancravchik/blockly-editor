```markdown
# מסמך אפיון טכני: שרת קומפילציה לקוד C עבור CH552 (CH552 Build Microservice)

## 1. הגדרת השירות
שירות API ללא מצב (Stateless Microservice) שתפקידו הבלעדי הוא קבלת קוד מקור (תחביר Arduino C++ / C), הידורו באמצעות `arduino-cli` מול ליבת `CH55xduino`, והחזרת קובץ בינארי (`.bin`) מוכן לצריבה על גבי מיקרו-בקר **CH552**.

השרת כולל בקובץ הבינארי תמיכה מובנית ב-USB CDC ובריסט אוטומטי (1200-baud reset).

---

## 2. מפרט ה-API

### `POST /compile`

#### קלט (Request)
* **Headers:** `Content-Type: application/json`
* **Body:**
```json
{
  "code": "void setup() {\n  pinMode(33, OUTPUT);\n}\nvoid loop() {\n  digitalWrite(33, HIGH);\n  delay(500);\n  digitalWrite(33, LOW);\n  delay(500);\n}"
}

```

#### פלט - הצלחה (`HTTP 200 OK`)

* **Headers:**
* `Content-Type: application/octet-stream`
* `Content-Disposition: attachment; filename="firmware.bin"`


* **Body:** הבתים הבינאריים הגולמיים (`raw bytes`) של קובץ ה-`.bin`.

#### פלט - שגיאת קומפילציה (`HTTP 400 Bad Request`)

* **Headers:** `Content-Type: application/json`
* **Body:**

```json
{
  "status": "error",
  "message": "Compilation failed",
  "errors": "sketch.ino: In function 'void loop()':\nsketch.ino:6:3: error: 'degitalWrite' was not declared in this scope\n   degitalWrite(33, HIGH);\n   ^~~~~~~~~~~~"
}

```

#### פלט - קלט לא תקין / שגיאת שרת (`HTTP 422` / `HTTP 500`)

* **Headers:** `Content-Type: application/json`
* **Body:** מחרוזת JSON עם תיאור התקלה (למשל: שדה `code` חסר, Timeout).

---

## 3. תהליך עיבוד פנימי (Compilation Pipeline)

בכל קריאת API השרת מבצע את השלבים הבאים:

1. **בידוד ריצה (Isolation):** יצירת תיקיית עבודה זמנית ייחודית (UUID) תחת `/tmp/{uuid}/sketch/`.
2. **כתיבת קובץ המקור:** שמירת תוכן המחרוזת `code` לקובץ `/tmp/{uuid}/sketch/sketch.ino`.
3. **הרצת פקודת ההידור (Subprocess execution עם Timeout של 5 שניות):**
```bash
arduino-cli compile \
  --fqbn CH55xDuino:mcs51:ch552:clock=24,usbsettings=defaultcdc \
  --output-dir /tmp/{uuid}/out \
  /tmp/{uuid}/sketch

```


4. **בדיקת תוצאת ההידור:**
* **Exit Code == 0:** קריאת הקובץ `/tmp/{uuid}/out/sketch.ino.bin` והחזרתו ב-Response.
* **Exit Code != 0:** לכידת ה-`stderr` / `stdout` והחזרת טקסט השגיאה ב-JSON.


5. **ניקוי (Cleanup):** מחיקה מוחלטת של התיקייה `/tmp/{uuid}/` (מתבצע תמיד, גם במקרה של שגיאה או קריסה).

---

## 4. תצורת ה-Build והסביבה (Container Image)

השרת נארז כ-Docker Container (מותאם להרצה על AWS Lambda / Cloud Run / VPS).

### מרכיבי התמונה (Dependencies):

1. **סביבת הרצה:** Python 3.11-slim (או Go/Node.js) להפעלת שרת ה-HTTP/Lambda Handler.
2. **arduino-cli:** מותקן בנתיב המערכת (`/usr/local/bin/arduino-cli`).
3. **חבילת הליבה (Core):**
* Board URL:
`https://raw.githubusercontent.com/DeqingSun/ch55xduino/ch55xduino/package_ch55xduino_index.json`
* חבילה מותקנת: `CH55xDuino:mcs51` (מותקנת מראש בזמן ה-Build של התמונה כדי למנוע הורדות בזמן ריצה).


4. **תצורת הידור (FQBN):**
* `CH55xDuino:mcs51:ch552:clock=24,usbsettings=defaultcdc`
* הגדרה זו מקמפלת בתדר 24MHz ומזריקה את תשתית ה-USB CDC עם מאזין ה-1200-baud.



---

## 5. דרישות אבטחה וביצועים

* **הגבלת זמן (Timeout):** כל תהליך קומפילציה מוגבל ל-5 שניות כדי למנוע חסימת משאבים.
* **הגבלת גודל קלט:** דחיית בקשות שבהן שדה ה-`code` עולה על 64KB.
* **מניעת זליגת זיכרון/דיסק:** הבטחת מחיקת קבצי ה-`/tmp` בסיום כל בקשה (בלוק `try...finally`).

```

```