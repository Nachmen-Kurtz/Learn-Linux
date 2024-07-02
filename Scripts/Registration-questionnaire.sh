#!/bin/bash

# הגדרת שם למשתנה
csv_file="kindergarten_girls_details.csv"

# בדיקה אם קיים קובץ של הערך שבמשתנה
if [ ! -f "$csv_file" ]; then

    # ואם אין הוא יוצר קובץ ומכניס בשורה הראשונה את רשימת הערכים הנתונה
    echo "Name,F-Name,Number,Birthday,Phone1,Phone2,Elergy" > "$csv_file"
fi

# פונקציה שתשאל את פרטי הילדה
function get_girls_details() {

    echo "שלום לכם הורים יקרים, נשמח שתענו על שאלות אחדות בתהליך רישום ילדתכם לגן הילדים"

    # בקשת פרטים והכנסתם לתוך המשתנים
    read -p "שם הילדה: " girl_first_name
    read -p "שם משפחתה: " girls_family
    read -p "מס' ת.ז. של הילדה: " girls_number
    read -p "יום ההולדת של הילדה (dd/mm/yyyy): " girls_birthday
    read -p "מספר טלפון בבית: " girls_home_phone
    read -p "מספר טלפון של אחד ההורים: " girls_parents_phone
    read -p "האם לילדה יש אלרגיה כל שהיא?: " girls_elergy

    # הכנסת הערכים שבתוך המשתנים לתוך הקובץ CSV
    echo "$girl_first_name","$girls_family","$girls_number","$girls_birthday","$girls_home_phone","$girls_parents_phone","$girls_elergy" >> girls/"$csv_file"

    # הודעת תודה
    echo "תודה! המזכירות תיצור עמכם קשר בימים הקרובים."
}

get_girls_details