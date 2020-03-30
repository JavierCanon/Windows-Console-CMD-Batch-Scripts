@echo off
@title saveTime
mode con:cols=32 lines=15
color 0A
set /a counter=0
:redo
echo %time%
timeout 900 > NUL
cscript /nologo "C:\Users\1039599607\Documents\_log\dodelay.vbs"
set /a counter +=1
if %counter% LEQ 50 goto redo
echo Last Time: %time%
pause
cls
csript /nologo "C:\Users\1039599607\Documents\_log\doClick.vbs" "C:\Users\1039599607\Documents\_log" "saveTime.bat"
exit