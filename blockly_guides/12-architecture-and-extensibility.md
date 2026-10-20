# מדריך 12: ארכיטקטורה פנימית והרחבות מתקדמות

מדריך זה מיועד למפתחים שמעוניינים להעמיק במבנה הפנימי של ספריית **Blockly Android**, להוסיף יכולות מותאמות אישית או לשנות את התנהגות הרכיבים.

---

## 🏛️ פירוט המחלקות המרכזיות במודול

### 1. `com.blockly.android.BlocklyView`
הרכיב החיצוני הראשי שיורש מ-`FrameLayout`.
* מאחד את `WorkspaceCanvasView`, רשימת הקטגוריות וכפתורי השליטה.
* מספק API ברור: `initFromAssets`, `generateCode`, `saveWorkspaceToJson`, `loadWorkspaceFromJson`.

### 2. `com.blockly.android.view.WorkspaceCanvasView`
משטח הציור האינטראקטיבי (יורש מ-`android.view.View`).
* מנהל את קואורדינטות העולם (`panX`, `panY`, `scale`).
* מטפל באירועי מגע (`ScaleGestureDetector` ו-`onTouchEvent`).
* מזהה חיבורים מגנטיים (`updateSnapCandidate`) ומצייר מלבן חיווי מואר.
* פותח דיאלוגי עריכה בעת לחיצה על שדות (`showFieldEditorDialog`).

### 3. `com.blockly.android.view.BlockRenderer`
מנוע הרינדור הווקטורי של הבלוקים.
* מודד את גודל הבלוק לפי כמות השדות והטקסט (`measure`).
* מחשב נתיב וקטורי (`Path`) הכולל פינות מעוגלות, שקע עליון (`Notch`), בליטה תחתונה ופתח פנימי ללולאות (`Statement Inset`).
* צובע את הבלוק ומכהה את המסגרת ב-20% לקבלת מראה תלת-ממדי נקי.

### 4. `com.blockly.android.model.Workspace` & `BlockInstance`
מודל הנתונים המייצג את עץ הבלוקים.
* כל `BlockInstance` שומר את מיקומו (`x`, `y`), מזהה ייחודי (`id`), ערכי שדותיו, ומצביעים לבלוקים סמוכים (`previous`, `next`, `parentStatement`, `statementChild`).
* המתודה `updateChainPositions()` מעדכנת את מיקומי כל שרשרת הבלוקים ברגע שבלוק האב זז.

### 5. `com.blockly.android.codegen.CodeGenerator`
מנוע ייצור הקוד.
* סורק את הבלוקים השורשיים (`getRootBlocks`) ומייצר קוד שרשרתי.
* מנהל הזחות (Indentation) תקניות עבור בלוקים המוכלים בתוך לולאות ותנאים.

### 6. `com.blockly.android.model.WorkspaceSerializer`
מנוע סריאליזציה ישיר מבוסס JSON (`org.json`).
* ממיר את עץ הבלוקים למערך JSON שטוח עם קישורי מזהים.
* בונה מחדש את העץ בטעינה ומחבר את כל המצביעים ללא אובדן נתונים.

---

## 🎨 התאמת עיצוב וסגנון אישי

ניתן לשנות את מידות השקעים והפינות בקלות ב-`BlockRenderer.java`:
```java
public static final float NOTCH_WIDTH = 20f;
public static final float NOTCH_HEIGHT = 8f;
public static final float CORNER_RADIUS = 6f;
public static final float HEADER_HEIGHT = 44f;
```
בנוסף, צבעי הלוח ונקודות הרשת מוגדרים ב-`colors.xml`:
* `@color/blockly_bg` — צבע רקע הלוח
* `@color/blockly_grid` — צבע נקודות הרשת
