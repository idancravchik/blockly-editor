# מדריך 02: הוספת מודול blockly-android לפרויקט

הספרייה מגיעה בצורת **מודול עצמאי (Android Library Module)**.
אין צורך בהתקנת חבילות AAR מסורבלות או בהגדרת שרתי Maven חיצוניים. 
המודול יושב ישירות בתוך הפרויקט שלך ב-Android Studio, מאפשר לך לצפות בקוד המקור, לדבג אותו ולקמפל אותו כחלק טבעי מהאפליקציה שלך.

---

## 📋 שלבי ההוספה (3 שלבים פשוטים)

### שלב 1: העתקת תיקיית המודול לפרויקט
העתק את התיקייה `blockly-android` ישירות לתיקיית השורש של הפרויקט שלך (לצד תיקיית `app`).

מבנה התיקיות צריך להיראות כך:
```
MyAndroidProject/
├── app/
│   ├── src/
│   └── build.gradle
├── blockly-android/           <-- התיקייה שהעתקת
│   ├── src/
│   ├── build.gradle
│   └── consumer-rules.pro
├── gradle/
├── build.gradle
└── settings.gradle
```

---

### שלב 2: הוספת המודול לקובץ `settings.gradle`
פתח את הקובץ `settings.gradle` (או `settings.gradle.kts`) בשורש הפרויקט והוסף את השורה:

```groovy
include ':app'
include ':blockly-android'
```

---

### שלב 3: הוספת התלות לקובץ `app/build.gradle`
פתח את הקובץ `app/build.gradle` והוסף תחת בלוק ה-`dependencies`:

```groovy
dependencies {
    // הוספת מודול Blockly Android המקומי
    implementation project(':blockly-android')

    // תלויות AndroidX סטנדרטיות שכבר קיימות בפרויקט שלך:
    implementation 'androidx.appcompat:appcompat:1.6.1'
    implementation 'com.google.android.material:material:1.11.0'
}
```

---

### שלב 4: ביצוע Sync Project with Gradle Files
לחץ על כפתור **Sync Now** בסרגל העליון של Android Studio (או בחר בתפריט `File -> Sync Project with Gradle Files`).

ברגע שהסנכרון יסתיים בהצלחה:
1. המודול `blockly-android` יופיע בעץ הפרויקטים של Android Studio עם אייקון ספריה.
2. המחלקה `com.blockly.android.BlocklyView` תהיה זמינה לשימוש בכל קובץ XML ו-Java/Kotlin באפליקציה שלך.
