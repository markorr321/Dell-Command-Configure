@echo off
REM Dell Command | Configure - Silent Uninstallation Script
REM For Microsoft Intune Win32 App Deployment

REM Uninstall using the MSI
msiexec /x "%~dp0Command_Configure.msi" /qn /norestart /l*v "%TEMP%\DellCommandConfigure_Uninstall.log"

REM Return the exit code to Intune
exit /b %ERRORLEVEL%
