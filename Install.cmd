@echo off
REM Dell Command | Configure - Silent Installation Script
REM For Microsoft Intune Win32 App Deployment

REM Install MSI with English (US) language transform
msiexec /i "%~dp0Command_Configure.msi" TRANSFORMS="%~dp01033.mst" /qn /norestart /l*v "%TEMP%\DellCommandConfigure_Install.log"

REM Return the exit code to Intune
exit /b %ERRORLEVEL%
