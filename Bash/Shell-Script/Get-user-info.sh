#!/bin/bash

# פונקציה ששואלת מה הפרטים האישיים שלך
function get_user_info {

    # בקשת מידע - מה שמך
    echo "wath your name?"

    # הכנסת השם שהתקבל למשתנה user_name
    read user_name

    # בקשת מידע - מה גילך
    echo "your age is:"

    # user_age הכנסת הגיל שהתקבל למתשתנה
    read user_age

    # בקשת מידע - מה מקום המגורים שלך
    echo "you live in:"

    # הכנסת מקום המגורים שהתקבל למשתנה user_live
    read user_live

    # הצגת הנתונים שהתקבלו למשתמש, ובקשת אישור או שלילה
    echo "your name is $user_name, your age is $user_age, you live in $user_live. is this true? [y/n]:"

    # הכנסת התשובה שהתקבלה מהמשתמש לתוך המשתנה true_or_false
    read true_or_false

    # הגדרת המשתנים של נתוני המשתמש (שםת גיל, ומקום מגורים) למשתנים מקומיים - רק בתוך הפונקציה
    local user_info=("$user_name" "$user_age" "$user_live" "$true_or_false")

    # החזרת קוד יציאה 0 - שאומרת שהפונקציה התבצעה בהצלחה
    return 0
}

# פונקציה שנקראת במקרה והמשתמש אישר את פרטיו
function user_yes {

    # אם המשתמש אימת אישר את פרטיו - המערכת תציג לו הודעת אישור וכולי
    echo "OK, the system has received your details. You can go home! Have a good day, and thank you!"

    # בשלב הבא, מאחורי הקלעים,
    # המערכת תיצור קובץ CSV עם שם user-info חתימת תאריך ושעה מדויקים של יצירת הקובץ.
    # user-info_24-05-2024_16:42:20.csv לדוגמא:

    # המערכת תכתוב את השם של המשתמש לתוך הקובץ
    echo $user_name >> users-info/"user-info_$(date +'%d-%m-%Y_%H:%M:%S').csv"

    # המערכת תוסיף שורה עם גיל המשתמש
    echo $user_age >> users-info/"user-info_$(date +'%d-%m-%Y_%H:%M:%S').csv"

    # המערכת תוסיף שורה עם מקום מגורי המשתמש
    echo $user_live >> users-info/"user-info_$(date +'%d-%m-%Y_%H:%M:%S').csv"
}

# פונקציה שנקראת במקרה והמשתמש לא אישר את פרטיו
function user_no {

    # המערכת תציג למשתמש שיזין את פרטיו שוב
    echo "please enter your details again!"

    # קריאה לפונקציה שמבקשת מהמשתמש את פרטיו
    get_user_info

    # הגדרת מונה שסופר את מספר נסיונות הזנת הנתונים,
    # והעלאה בכל פעם שהמשתמש מזין נתונים באחד
    ((counter++))

    # הגדרת תנאי למונה - אם מספר המונה עולה על שלוש -
    if [ $counter -ge 2 ]; then

        # המערכת תציג למשתמש הודעה שינסה במועד מאוחר יותר,
        echo "Please try again later"

        # והמערכת תוציא אותו
        exit 1
    fi

    # תנאי שבודק את הקלט מהמשתמש שהוכנס למשתנה true_or_false
    # אם הקלט הוא y
    if [ "$true_or_false" = "y" ]; then

        # המערכת תקרא לפונקציה user_yes
        # שתציג למשתמש הודעת אישור ותכתוב את הפרטים לקובץ
        user_yes
    # אם הקלט של המשתמש אינו y (אלא כל דבר אחר)
    else
        # המערכת תקרא לפונקציה user_no
        # שתבקש מהמשתמש להזין את פרטיו שוב
        user_no
    fi
}

# איפוס המונה לאפס
counter=0

# קריאה לפונקציה ששואלת את המשתמש את פרטיו
get_user_info

# לאחר שקיבלנו את הקלט מהמשתמש,
# נגדיר פונקציה שפועלת בהתאם לקלט מהמשתמש

# אם המשתנה הוא y
if [ "$true_or_false" = "y" ]; then
    # קריאה לפונקציה שמתבצעת אם המשתמש אישר את פרטיו
    user_yes
# אם הקלט של המשתמש אינו y (אלא כל דבר אחר)
else

    # קריאה לפונקציה שמתבצעת אם המשתמש לא אישר את פרטיו
    user_no
fi
