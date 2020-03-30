@echo off
REM Author: Emil Nes
setlocal
title Remove Microsoft Credentials

for /f "tokens=2 delims= " %%a in ('cmdkey /list ^| find "Microsoft"') do (
    for /f "tokens=2 delims==" %%b in ("%%a") do (
	echo Deleting: %%b
	cmdkey /delete:%%b
    )
)

pause >nul