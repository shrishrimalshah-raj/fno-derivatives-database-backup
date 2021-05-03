SETLOCAL EnableDelayedExpansion
(set d=%date:~8,2%-%date:~3,2%-%date:~0,2%) & (set t=%time::=.%) & (set t=!t: =0!) & (set STAMP=!d!)
cd "C:\Users\shris\Desktop\Github-Project\fno-derivatives-database-backup"
set HOME=%USERPROFILE%
mongodump
"C:\Program Files\7-Zip\7z.exe" a -tzip "./backup.zip" -r "./dump\*" -mx5
git add .
git commit -m "database backup completed on %STAMP%"
git push
@REM del "./backup.zip"
