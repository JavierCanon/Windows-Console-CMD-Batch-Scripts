
@title  Begin Work Day

REM @echo off
setlocal enableextensions disabledelayedexpansion
@title  Welcome to work

mode con:cols=64 lines=30
color 0A

REM certutil -scinfo

start "New Window" cmd /c saveTime.bat
@ECHO %now%

@ECHO write time stamp to plain-text file with this VBS
rem Start "" "C:\Users\1039599607\Documents\_log\workDay_start.vbs"
pushd %~dp0
start "" cmd /c cscript C:\Users\1039599607\Documents\_log\workDay_start.vbs

@ECHO Start: DreamWeaver 
start "" "C:\Program Files (x86)\Adobe\Adobe Dreamweaver CC\Dreamweaver.exe"

@ECHO Start: Excel Timesheet
Start "" "C:\Users\1039599607\Documents\_log\timeSheet_stats_2018.xlsx"

@ECHO Start: Outlook Web Mail in IE
start /max "" iexplore.exe https://cp.mail.us.af.mil

@ECHO Start: Chrome
start "Chrome" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory="Default"

@ECHO Start: MSSQL Server Management Studio
start "" "C:\Program Files (x86)\Microsoft SQL Server\140\Tools\Binn\ManagementStudio\Ssms.exe"

REM @TITLE ITNSS Copy Local & Open Git
REM purpose: copy server files to local machine, open IE, start GitBash

REM @ECHO Copy Server Files to Local
xcopy "F:\wwwroot\AFRL ASD Intranet\itnss" "C:\Users\1039599607\Documents\projects\itnss" /e /c /i /k /y /f /m 

REM @ECHO Opening ITNSS in Internet Explorer
start /max "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://rqintranetdev.rz.afrl-wrs.hpc.mil/itnss/index.cfm

REM @ECHO Opening Conference Room Scheduler in Chrome
start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://rqintranetdev.rz.afrl-wrs.hpc.mil/apps/jackie/conf_room_sched/room_search.cfm

REM @ECHO Starting GitBash 
start "" "C:\Program Files (x86)\Git\git-bash.exe" --cd=c:\Users\1039599607\Documents\projects

@PAUSE
REM Start "" "C:\Users\1039599607\Documents\_log\itnss_start_script.sh"


REM cd c:/Users/1039599607/Documents/projects/itnss
REM git remote -v
REM git status
REM 
REM git clone git@gitlab.ext.rdte.afrl.af.mil:cherocas/itnss.git
REM git add .
REM 
REM 
REM $ git push -u origin --all



exit