# מדריך 05: עיצוב והגדרת בלוקים (blocks.json)

הגדרת הבלוקים היא לב המערכת. במקום לכתוב קוד ג'אווה ארוך עבור כל בלוק, כל הבלוקים מוגדרים בקובץ `blocks.json` בתיקיית `app/src/main/assets/`.

---

## 📄 דוגמה לקובץ `blocks.json`

```json
[
  {
    "type": "gpio_set",
    "message": "הגדר פין דיגיטלי",
    "color": "#4CAF50",
    "fields": [
      {
        "name": "PIN",
        "type": "dropdown",
        "default": "13",
        "options": ["13", "12", "11", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
      },
      {
        "name": "STATE",
        "type": "dropdown",
        "default": "HIGH",
        "options": ["HIGH", "LOW"]
      }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "pinMode(%PIN%, OUTPUT);\ndigitalWrite(%PIN%, %STATE%);\n"
  },
  {
    "type": "delay_ms",
    "message": "המתן מילישניות",
    "color": "#FF9800",
    "fields": [
      {
        "name": "MS",
        "type": "number",
        "default": "500"
      }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "delay(%MS%);\n"
  },
  {
    "type": "loop_forever",
    "message": "חזור לתמיד",
    "color": "#2196F3",
    "statements": [
      {
        "name": "DO"
      }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "while (true) {\n%DO%}\n"
  }
]
```

---

## 🔍 פירוט מאפייני הבלוק

| מאפיין | סוג | ברירת מחדל | תיאור |
| :--- | :--- | :--- | :--- |
| `type` | מחרוזת | **חובה** | מזהה ייחודי של סוג הבלוק (באנגלית) |
| `message` | מחרוזת | `type` | הטקסט הראשי שמוצג על הבלוק (למשל: "הגדר פין") |
| `color` | מחרוזת HEX | `#4CAF50` | צבע רקע הבלוק |
| `fields` | מערך אובייקטים | `[]` | רשימת שדות קלט לעריכה על ידי המשתמש |
| `previousStatement` | בוליאני | `true` | האם יש שקע עליון לחיבור לבלוק שלפניו |
| `nextStatement` | בוליאני | `true` | האם יש בליטה תחתונה לחיבור לבלוק שאחריו |
| `statements` | מערך אובייקטים | `[]` | הגדרת בלוק מכולה/לולאה המכיל בלוקים פנימיים |
| `code` | מחרוזת | `""` | תבנית הקוד שהבלוק מפיק (תומך ב-Placeholders) |

---

## 🎛️ סוגי שדות (Fields) הנתמכים

### 1. שדה בחירה מתוך רשימה (`dropdown`)
מציג דיאלוג בחירה מעוצב עם אפשרויות מוגדרות מראש:
```json
{
  "name": "STATE",
  "type": "dropdown",
  "default": "HIGH",
  "options": ["HIGH", "LOW"]
}
```

### 2. שדה מספר (`number`)
פותח מקלדת מספרית לעריכת ערך:
```json
{
  "name": "MS",
  "type": "number",
  "default": "1000"
}
```

### 3. שדה טקסט חופשי (`text`)
מאפשר הקלדת כל מחרוזת טקסט חופשית:
```json
{
  "name": "MSG",
  "type": "text",
  "default": "Hello World"
}
```
