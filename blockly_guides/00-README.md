# מדריך מקיף לספריית Blockly Android (הגרסה המודרנית)

ברוכים הבאים לתיעוד הרשמי והמעודכן של **Blockly Android** — ספריית קוד פתוח מודרנית, מהירה וטבעית (Pure Native) למערכת Android.

---

## 🎯 למה נבנתה הגרסה החדשה?
הספרייה הישנה המקורית של Google (שפותחה עוד ב-2015) התבססה על WebView פנימי, גשר JavaScript איטי, קבצי XML מיושנים ומאות אזהרות Deprecation מול סביבות Android מודרניות (Android 14+, Java 17/21).

**Blockly Android החדשה פותחה מחדש מהיסוד על פי עקרונות פיתוח מודרניים:**
* ⚡ **100% Native Canvas & Android Views**: ללא WebViews, ללא תלות במנועי JS, ביצועים חלקים של 60/120 FPS.
* 📦 **מודול נקי לפרויקט (Clean Module)**: תיקיית `blockly-android` עצמאית שמוסיפים ישירות לפרויקט ב-2 שורות ב-`settings.gradle` וב-`build.gradle`.
* 📄 **הגדרה מבוססת 2 קבצי JSON פשוטים**:
  * `blocks.json` — הגדרת הבלוקים, השדות (Fields), הצבעים והקוד שהם מפיקים.
  * `categories.json` — הגדרת הקטגוריות והסדר בסרגל הכלים (Toolbox).
* ⚙️ **מחולל קוד מובנה (Code Generator)**: הפקת קוד C / Arduino / Python / JS מיידית ללא המתנה וללא קריאות אסינכרוניות.
* 💾 **שמירה וטעינה מובנית (JSON Workspace)**: שמירת לוח הבלוקים למחרוזת JSON פשוטה וטעינה חוזרת בשורה אחת.
* 📱 **חוויית מגע מלאה**: Pinch-to-Zoom (הגדלה והקטנה במגע שתי אצבעות), גרירה מגנטית (Magnetic Snapping), דיאלוגים מותאמים לעריכת ערכים.

---

## 📚 תוכן המדריכים בסדרה

| מס' | מדריך | תיאור |
| :--- | :--- | :--- |
| **01** | [סקירת ארכיטקטורה](01-blockly-in-android-overview.md) | הבנת מבנה המערכת: Canvas, AST, מודלים ורנדרר |
| **02** | [הוספת המודול לפרויקט Android Studio](02-adding-blockly-to-android-project.md) | צעד אחר צעד: העתקת התיקייה וחיבור ב-Gradle |
| **03** | [שילוב ברכיבי ממשק (XML & Activity)](03-adding-blockly-to-page-and-layout.md) | הוספת `BlocklyView` ל-Layout ואתחול ב-Activity |
| **04** | [הגדרת קטגוריות וסרגל כלים (categories.json)](04-configuring-workspace-and-toolbox.md) | מבנה קובץ הקטגוריות, צבעים וסדר הבלוקים |
| **05** | [עיצוב והגדרת בלוקים (blocks.json)](05-designing-custom-blocks.md) | שדות טקסט, מספרים, תפריטי בחירה (Dropdown) וחיבורי שרשרת |
| **06** | [מחולל קוד ותבניות (Code Generator)](06-writing-block-logic-and-c-generators.md) | שימוש ב-Placeholders, הזחות (Indentation) וקוד מותאם אישית |
| **07** | [אירועים ועדכונים חיים (Events & Listeners)](07-workspace-controller-and-events.md) | האזנה לשינויים בלוח הבלוקים והצגת תצוגה מקדימה חיה של הקוד |
| **08** | [שמירה וטעינה (Persistence & JSON)](08-saving-and-loading-workspaces.md) | שמירת פרויקטים לקובץ או ל-SharedPreferences |
| **09** | [אופטימיזציית מגע ומובייל](09-mobile-and-touch-optimizations.md) | זום, פאן (Pan), מגנטיות ועריכת שדות בדיאלוגים ייעודיים |
| **10** | [דוגמה מלאה מוכנה להרצה](10-complete-working-starter-example.md) | קוד מלא של Activity, קבצי JSON וקובץ Layout |
| **11** | [מדריך מעשי: פרויקט 3 בלוקים ב-5 דקות](11-step-by-step-3-blocks-external-library-demo.md) | מדריך מהיר להקמת פרויקט מאפס עד יצירת קוד |
| **12** | [הרחבות והתאמה אישית מתקדמת](12-architecture-and-extensibility.md) | הוספת שפות יעד חדשות והתאמת עיצוב הרנדרר |

---

## 🚀 התחלה מהירה (Quick Start ב-30 שניות)

### 1. הוסף את ה-Layout:
```xml
<com.blockly.android.BlocklyView
    android:id="@+id/blocklyView"
    android:layout_width="match_parent"
    android:layout_height="match_parent" />
```

### 2. אתחל ב-Activity:
```java
BlocklyView blocklyView = findViewById(R.id.blocklyView);
// טוען ישירות מתיקיית src/main/assets:
blocklyView.initFromAssets("blocks.json", "categories.json");

// קבלת הקוד שנוצר בכל רגע:
String code = blocklyView.generateCode();
```
