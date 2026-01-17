@echo off
title Windows Disk Optimization Script
color 0A

echo =========================================
echo  WINDOWS DISK OPTIMIZATION (SAFE MODE)
echo  Target: Disk 90-100%%
echo =========================================
echo.
pause

:: Disable Superfetch / SysMain
echo [1/6] Disabling Superfetch (SysMain)...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1

:: Disable Windows Search
echo [2/6] Disabling Windows Search...
sc stop "WSearch" >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1

:: Disable Background Apps (Windows 8.1 safe)
echo [3/6] Disabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul

:: Reduce Visual Effects
echo [4/6] Optimizing visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul

:: Clear Temp Files
echo [5/6] Cleaning temporary files...
del /f /s /q "%temp%*" >nul 2>&1
del /f /s /q "C:\Windows\Temp*" >nul 2>&1

:: Set Power Plan to High Performance
echo [6/6] Setting power plan to High Performance...
powercfg -setactive SCHEME_MIN >nul 2>&1

echo.
echo =========================================
echo  OPTIMIZATION COMPLETE
echo  RESTART PC FOR BEST RESULT
echo =========================================
pause
exit
