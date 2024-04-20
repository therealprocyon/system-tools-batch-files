@echo off
echo (c) TheRealProcyon (CC Oosting), 25th March 2017
timeout 2 >nul
echo.
echo I need to make sure you have problems, so please answer the next question before starting the script
timeout 5 >nul
echo.
goto :areyousure

:areyousure
set /P sure=Are you sure you have any problems, and want to execute this script [Y/N]?
if /I "%sure%" EQU "Y" goto :continue
if /I "%sure%" EQU "N" goto :exitnoproblems
goto :areyousure

:continue
echo.
echo Because this script requires elevated permissions, we need to check the current permissions level.
echo This won't harm your PC in any way.
echo.
echo Please sit back, while we check for permissions...
timeout 10 >nul
goto :elevatedperms

:elevatedperms
timeout 3 >nul
cls
echo Elevated access required. Detecting current access level...
net session >nul 2>&1
if %errorLevel% == 0 (
	goto :commandsneeded
) else (
	goto :exitnoelevatedrights
)
pause >nul

:commandsneeded
timeout 4 >nul
echo.
echo We have the permissions required to execute the commands
echo Please sit back, while we are running the commands required to fix your PC
timeout 5 >nul
cls
DISM /Online /Cleanup-Image /Scanhealth
timeout 4 >nul
cls
DISM /Online /Cleanup-Image /Restorehealth
timeout 4 >nul
cls
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
timeout 4 >nul
cls
echo Finished running the commands, I hope this script helped you.
echo Press any key to exit...
pause >nul
exit

:exitnoproblems
cls
echo Press any key to exit...
pause >nul
exit

:exitnoelevatedrights
timeout 4 >nul
echo.
echo Couldn't obtain the proper permissions to run this script. 
echo Please restart this script in elevated mode. 
echo.
echo Press any key to exit...
pause >nul
exit
