#!/bin/bash

# סקריפט שמחפש את כל קבצי הפודקאסטים שהורדתי ביום האחרון 
# ומעתיק אותם לתיקייה חדשה בשם היום הנוכחי
# בתוך הנגן שלי

# יצירת משתנה עבור שם התיקייה העתידית
dir_for_day="pod_for_$(date +'%d-%m-%y')"

# יצירת התיקייה בכונן הנייד
# שימו לב: 
# יש להחליף את שם המשתמש ושם הכונן הנייד כפי שמופיע בתיקייה
mkdir /run/media/nachmen/9C33-6BBD/$dir_for_day/

# חיפוש כל הקבצי הפודקאסטים והעתקתם לתיקייה החדשה
find ~/gPodder -type f -mtime -1 -name "*.mp3" -exec cp -t /run/media/nachmen/9C33-6BBD/$dir_for_day/ {} +
