# מדריך 03: שילוב Blockly בעמוד (XML & Activity)

הספרייה מספקת רכיב UI יחיד ואינטגרלי: `com.blockly.android.BlocklyView`.
רכיב זה מכיל בתוכו את משטח הבלוקים (Canvas), את סרגל הקטגוריות, סרגל הבחירה של הבלוקים וכפתורי הזום והניקוי.

---

## 🎨 שלב 1: הוספת הרכיב לקובץ ה-XML

פתח את קובץ ה-Layout שלך (למשל `activity_main.xml`) והוסף את `BlocklyView`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <!-- סרגל עליון עם כפתור להפקת קוד -->
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
            android:text="פרויקט Blockly שלי"
            android:textColor="#FFFFFF"
            android:textSize="18sp"
            android:textStyle="bold" />

        <Button
            android:id="@+id/btnViewCode"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="הצג קוד"
            android:backgroundTint="#FF9800"
            android:textColor="#FFFFFF" />
    </LinearLayout>

    <!-- רכיב Blockly המודרני תופס את שאר המסך -->
    <com.blockly.android.BlocklyView
        android:id="@+id/blocklyView"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />

</LinearLayout>
```

---

## ☕ שלב 2: אתחול ב-Activity (Java)

ב-`MainActivity.java` נדרשות שתי שורות בלבד:

```java
package com.example.myapp;

import android.os.Bundle;
import android.widget.Toast;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import com.blockly.android.BlocklyView;

public class MainActivity extends AppCompatActivity {

    private BlocklyView blocklyView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        blocklyView = findViewById(R.id.blocklyView);

        // 🚀 אתחול ישיר משני קבצי ה-JSON בתיקיית assets
        blocklyView.initFromAssets("blocks.json", "categories.json");

        // האזנה ללחיצה על כפתור הצגת הקוד
        findViewById(R.id.btnViewCode).setOnClickListener(v -> {
            String code = blocklyView.generateCode();
            showCodeDialog(code);
        });
    }

    private void showCodeDialog(String code) {
        new AlertDialog.Builder(this)
                .setTitle("הקוד שהופק")
                .setMessage(code.isEmpty() ? "// לוח הבלוקים ריק!" : code)
                .setPositiveButton("סגור", null)
                .show();
    }
}
```

---

## 🧩 שלב 2 (חלופי): שימוש ב-Kotlin

```kotlin
package com.example.myapp

import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import com.blockly.android.BlocklyView

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val blocklyView = findViewById<BlocklyView>(R.id.blocklyView)
        blocklyView.initFromAssets("blocks.json", "categories.json")

        findViewById<Button>(R.id.btnViewCode).setOnClickListener {
            val code = blocklyView.generateCode()
            AlertDialog.Builder(this)
                .setTitle("הקוד שהופק")
                .setMessage(if (code.isEmpty()) "// לוח הבלוקים ריק!" else code)
                .setPositiveButton("סגור", null)
                .show()
        }
    }
}
```
