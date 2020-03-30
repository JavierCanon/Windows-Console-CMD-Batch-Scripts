@echo off
REM Author: Emil Nes
set server=%COMPUTERNAME%
title Logout Utility -  %server%

:main
cls
echo.
echo.
echo.
set /p usr="Enter username (type 'quit' to exit the program)  : "

qwinsta /server:%server% | find /i "%usr%" >nul
if %errorlevel% equ 1 goto :not_found
goto :user


:user
qwinsta /server:%server% | find "%usr%"
CHOICE /C YN /M "Log of user?" 

if "%errorlevel%" equ "1" (goto :exec_cmd)
if "%errorlevel%" equ "2" (goto :main)
goto :quit


:exec_cmd
for /f "tokens=3,* delims= " %%A in ('qwinsta /server:%server%  ^| find "%usr%"') do set sessid=%%A

if "%sessid%"=="Disc" (for /f "tokens=2,* delims= " %%A in ('qwinsta /server:%server%  ^| find "%usr%"') do set sessid=%%A)
if "%sessid%"=="" (echo No sessions found & timeout /t 2 /NOBREAK >nul & goto :main)


logoff %sessid% /server:%server%
echo.
echo.
echo.
echo User with session id %sessid% logged out from %server%.
pause >nul
goto :main


:not_found
echo User not found.
timeout /t 2 /NOBREAK >nul
goto :main


:quit
exit /b 0



