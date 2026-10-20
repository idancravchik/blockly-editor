# מדריך 08: שמירה וטעינה של פרויקטים (Persistence & JSON)

הספרייה כוללת מנוע סריאליזציה מובנה (`WorkspaceSerializer`) המאפשר לשמור את מצב הלוח לקובץ JSON ולטעון אותו חזרה בשלמותו.

---

## 💾 שלב 1: שמירת מצב הלוח (Save)

כדי לשמור את הפרויקט, קרא למתודה `saveWorkspaceToJson()`:

```java
try {
    String projectJson = blocklyView.saveWorkspaceToJson();
    
    // שמירה ב-SharedPreferences:
    getSharedPreferences("blockly_prefs", MODE_PRIVATE)
            .edit()
            .putString("saved_project", projectJson)
            .apply();

    Toast.makeText(this, "הפרויקט נשמר בהצלחה!", Toast.LENGTH_SHORT).show();
} catch (Exception e) {
    e.printStackTrace();
}
```

---

## 📂 שלב 2: טעינת פרויקט שמור (Load)

לטעינה חוזרת של הפרויקט, קרא למתודה `loadWorkspaceFromJson(json)`:

```java
try {
    String savedJson = getSharedPreferences("blockly_prefs", MODE_PRIVATE)
            .getString("saved_project", null);

    if (savedJson != null) {
        blocklyView.loadWorkspaceFromJson(savedJson);
        Toast.makeText(this, "הפרויקט נטען בהצלחה!", Toast.LENGTH_SHORT).show();
    }
} catch (Exception e) {
    e.printStackTrace();
}
```

---

## 📄 מבנה ה-JSON של פרויקט שמור
הקובץ השמור הוא קריא, קומפקטי ופשוט:
```json
[
  {
    "id": "e2a3c748-...",
    "type": "gpio_set",
    "x": 120.0,
    "y": 80.0,
    "values": {
      "PIN": "13",
      "STATE": "HIGH"
    },
    "nextId": "b4f18d09-..."
  },
  {
    "id": "b4f18d09-...",
    "type": "delay_ms",
    "x": 120.0,
    "y": 124.0,
    "values": {
      "MS": "1000"
    }
  }
]
```
הספרייה משחזרת אוטומטית את כל הקשרים (`next`, `previous`, `statementChild`) ואת מיקומי השרשרת!
