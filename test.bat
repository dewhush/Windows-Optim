@echo off
title Auto Backup Disk D to ZIP (Downloads)
color 0B

:: ====== CONFIG ======
set SOURCE=D:
set DEST=%USERPROFILE%\Downloads
set DATE=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%
set ZIPNAME=Backup_D_%DATE%.zip
:: ====================

echo =========================================
echo   AUTO BACKUP DISK D TO ZIP
echo   DESTINATION: Downloads
echo =========================================
echo.

echo Compressing Disk D...
powershell -command "Compress-Archive -Path '%SOURCE%*' -DestinationPath '%DEST%%ZIPNAME%' -Force"

echo.
echo =========================================
echo   BACKUP COMPLETE
echo   File saved to:
echo   %DEST%%ZIPNAME%
echo =========================================
pause
exit
