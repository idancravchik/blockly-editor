# מדריך 11: מדריך מעשי צעד-אחר-צעד (3 בלוקים ב-5 דקות)

מדריך זה מיועד למפתח שרוצה להקים פרויקט עובד מאפס עם ספריית **Blockly Android** ולהפיק קוד עבור בקר חומרה (כגון Arduino / ESP32 / CH55x) בתוך 5 דקות בלבד.

---

## צעד 1: צרף את תיקיית `blockly-android` לפרויקט שלך
1. העתק את התיקייה `blockly-android` לצד תיקיית `app`.
2. ב-`settings.gradle` הוסף:
   ```groovy
   include ':blockly-android'
   ```
3. ב-`app/build.gradle` הוסף:
   ```groovy
   dependencies {
       implementation project(':blockly-android')
   }
   ```
4. בצע **Gradle Sync**.

---

## צעד 2: צור את תיקיית `assets`
תחת `app/src/main/` פתח תיקייה בשם `assets` (אם אינה קיימת):
`app/src/main/assets/`

---

## צעד 3: צור את `blocks.json` ב-`assets`
צור קובץ בשם `app/src/main/assets/blocks.json`:

```json
[
  {
    "type": "gpio_set",
    "message": "קבע פין",
    "color": "#4CAF50",
    "fields": [
      {
        "name": "PIN",
        "type": "dropdown",
        "default": "13",
        "options": ["13", "12", "11", "2"]
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
    "message": "השהה מילישניות",
    "color": "#FF9800",
    "fields": [
      {
        "name": "MS",
        "type": "number",
        "default": "1000"
      }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "delay(%MS%);\n"
  },
  {
    "type": "loop_forever",
    "message": "לולאה אינסופית",
    "color": "#2196F3",
    "statements": [
      {
        "name": "DO"
      }
    ],
    "previousStatement": true,
    "nextStatement": true,
    "code": "void loop() {\n%DO%}\n"
  }
]
```

---

## צעד 4: צור את `categories.json` ב-`assets`
צור קובץ בשם `app/src/main/assets/categories.json`:

```json
[
  {
    "id": "basic",
    "name": "פקודות בסיס",
    "color": "#4CAF50",
    "blocks": ["gpio_set", "delay_ms", "loop_forever"]
  }
]
```

---

## צעד 5: הוסף את ה-View ב-XML
בקובץ `app/src/main/res/layout/activity_main.xml`:

```xml
<com.blockly.android.BlocklyView
    android:id="@+id/blocklyView"
    android:layout_width="match_parent"
    android:layout_height="match_parent" />
```

---

## צעד 6: אתחל ב-Activity
בקובץ `MainActivity.java` (חשוב מאוד: `findViewById` חייב להיקרא **אחרי** `setContentView`!):

```java
package com.example.blocksdemo;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import com.blockly.android.BlocklyView;

public class MainActivity extends AppCompatActivity {

    private BlocklyView blocklyView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // 1. חובה קודם לטעון את ה-Layout שמכיל את ה-BlocklyView:
        setContentView(R.layout.activity_main);

        // 2. עכשיו מוצאים את ה-View לפי ה-ID שהוגדר ב-XML:
        blocklyView = findViewById(R.id.blocklyView);

        // 3. מאתחלים משני קבצי ה-JSON ב-assets:
        blocklyView.initFromAssets("blocks.json", "categories.json");
    }
}
```

זה הכל! הפעל את האפליקציה, גרור את הבלוקים ללוח, חבר אותם יחד וצפה בקוד ה-C שנוצר אוטומטית!
