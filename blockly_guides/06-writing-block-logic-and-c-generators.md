# מדריך 06: מחולל הקוד (Code Generator) ותבניות הפקה

מחולל הקוד ב-Blockly Android פועל ישירות מעץ הבלוקים (Abstract Syntax Tree) ומפיק קוד נקי, מהיר ומסודר ללא תלות ב-JavaScript.

---

## 🎯 תבניות קוד מובנות (Template Substitution)

הדרך הקלה והנפוצה ביותר להגדרת קוד היא ישירות בשדה `code` בקובץ `blocks.json`.
המחולל מחליף אוטומטית שמות שדות המוקפים ב-`%`:

### דוגמה 1: החלפת שדות פשוטה
אם הגדרת שדות `PIN` ו-`STATE`:
```json
"code": "pinMode(%PIN%, OUTPUT);\ndigitalWrite(%PIN%, %STATE%);\n"
```
אם המשתמש בחר פין `13` ומצב `HIGH`, יופק:
```c
pinMode(13, OUTPUT);
digitalWrite(13, HIGH);
```

---

### דוגמה 2: בלוק לולאה והזחות (Indentation)
אם הבלוק מוגדר עם `statements`:
```json
"statements": [ { "name": "DO" } ],
"code": "while (true) {\n%DO%}\n"
```
המחולל מייצר אוטומטית את הקוד של כל הבלוקים שנמצאים בתוך הלולאה, ומוסיף להם הזחה תקנית של שני רווחים (`  `):
```c
while (true) {
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  delay(500);
}
```

---

## ⚙️ מחולל קוד דינמי מותאם אישית (Custom Generator Hook)

אם יש לך בלוק הדורש לוגיקה מורכבת שאינה מתאימה לתבנית טקסט פשוטה, תוכל לרשום פונקציית Generator מותאמת אישית ישירות ב-Java או Kotlin:

```java
// רישום מחולל קוד דינמי עבור בלוק "custom_calc"
blocklyView.getCodeGenerator().registerGenerator("custom_calc", (block, values) -> {
    String op = values.get("OP");
    String a = values.get("A");
    String b = values.get("B");
    
    if ("MULTIPLY".equals(op)) {
        return "int result = " + a + " * " + b + ";\n";
    } else {
        return "int result = " + a + " + " + b + ";\n";
    }
});
```
