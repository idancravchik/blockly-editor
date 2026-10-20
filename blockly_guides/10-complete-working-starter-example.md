# מדריך 10: דוגמה מלאה מוכנה להרצה

מדריך זה מרכז פרויקט דמו שלם שניתן להעתיק ולהריץ מיד.

---

## 📁 1. קובץ הבלוקים: `app/src/main/assets/blocks.json`

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

## 📁 2. קובץ הקטגוריות: `app/src/main/assets/categories.json`

```json
[
  {
    "id": "gpio",
    "name": "פינים",
    "color": "#4CAF50",
    "blocks": ["gpio_set"]
  },
  {
    "id": "timing",
    "name": "תזמון",
    "color": "#FF9800",
    "blocks": ["delay_ms"]
  },
  {
    "id": "control",
    "name": "בקרה",
    "color": "#2196F3",
    "blocks": ["loop_forever"]
  }
]
```

---

## 📁 3. קובץ העיצוב: `app/src/main/res/layout/activity_main.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="56dp"
        android:background="#1976D2"
        android:gravity="center_vertical"
        android:paddingHorizontal="16dp">

        <TextView
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="Blockly Android Starter"
            android:textColor="#FFFFFF"
            android:textSize="18sp"
            android:textStyle="bold" />

        <Button
            android:id="@+id/btnViewCode"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:backgroundTint="#FF9800"
            android:text="צפה בקוד"
            android:textColor="#FFFFFF" />
    </LinearLayout>

    <com.blockly.android.BlocklyView
        android:id="@+id/blocklyView"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1" />

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="120dp"
        android:background="#263238"
        android:padding="8dp"
        android:orientation="vertical">

        <TextView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="קוד חי (Live):"
            android:textColor="#80CBC4"
            android:textSize="12sp"
            android:textStyle="bold" />

        <ScrollView
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:layout_marginTop="4dp">

            <TextView
                android:id="@+id/tvLiveCode"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:text="// גרור בלוקים ללוח לצפייה בקוד..."
                android:textColor="#FFFFFF"
                android:textSize="13sp"
                android:fontFamily="monospace" />
        </ScrollView>
    </LinearLayout>

</LinearLayout>
```

---

## 📁 4. קוד ה-Activity: `app/src/main/java/com/example/myapp/MainActivity.java`

```java
package com.example.myapp;

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import com.blockly.android.BlocklyView;

public class MainActivity extends AppCompatActivity {

    private BlocklyView blocklyView;
    private TextView tvLiveCode;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        blocklyView = findViewById(R.id.blocklyView);
        tvLiveCode = findViewById(R.id.tvLiveCode);

        // אתחול בשורה אחת
        blocklyView.initFromAssets("blocks.json", "categories.json");

        // עדכון תצוגה מקדימה חיה
        blocklyView.setOnWorkspaceChangedListener(() -> {
            String code = blocklyView.generateCode();
            tvLiveCode.setText(code.isEmpty() ? "// גרור בלוקים ללוח לצפייה בקוד..." : code);
        });

        // כפתור הצגת דיאלוג קוד
        findViewById(R.id.btnViewCode).setOnClickListener(v -> {
            String code = blocklyView.generateCode();
            new AlertDialog.Builder(this)
                    .setTitle("Generated C/Arduino Code")
                    .setMessage(code.isEmpty() ? "// לוח הבלוקים ריק!" : code)
                    .setPositiveButton("סגור", null)
                    .show();
        });
    }
}
```
