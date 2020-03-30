@echo off
setlocal

REM Author: Emil Nes
REM Copyright: MIT License
REM Date: 17.12.2016
REM Ver: a0.0.1

set tries=3

:_proc

if %tries% LEQ 0 (
	exit /b 2
)

set /a tries=%tries%-1

NET SESSION >nul 2>&1

if not %errorlevel% equ 0 (
    echo.
    echo This script must be run as administrator.
    echo Right click on the shortcut and select "Run As Administrator".

    timeout 10 /nobreak >nul
    exit /b 1
)
    
netsh winsock reset >nul & :: reset winsock catalog
netsh int ip reset reset.txt >nul & :: reset TCP/IP settings
ipconfig /release >nul & :: Releases TCP/IP-settings
ipconfig /flushdns >nul & :: Flushes DNS resolve cache
ipconfig /renew >nul & :: Renews TCP/IP-settings
	
REM Testing pinging. Do the whole process over again if it fails.

ping 8.8.8.8 -n 1 -l 1 >nul
if not %errorlevel% equ 0 (
	echo ping 8.8.8.8 failed.   Re-executing script... %tries%
	goto :_proc
	
)

ping www.vg.no -n 1 -l 1 >nul
if not %errorlevel% equ 0 (
	echo ping www.vg.no failed. Re-executing script... %tries%
	ipconfig /flushdns >nul
	goto :_proc
)


REM Batch script removes itself if successful execution.
start /b "" cmd /c del "%~f0"&&exit /b 
