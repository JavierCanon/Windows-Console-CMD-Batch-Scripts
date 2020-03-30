@setlocal DisableDelayedExpansion
@echo off
set "SysPath=%SystemRoot%\System32"
if exist "%SystemRoot%\Sysnative\reg.exe" (set "SysPath=%SystemRoot%\Sysnative")
set "Path=%SysPath%;%SystemRoot%;%SysPath%\Wbem;%SysPath%\WindowsPowerShell\v1.0\"
set "xOS=x64"
set "_Common=%CommonProgramFiles%"
if /i %PROCESSOR_ARCHITECTURE%==x86 (if defined PROCESSOR_ARCHITEW6432 (
  set "_Common=%CommonProgramW6432%"
  ) else (
  set "xOS=x86"
  )
)
set "_target=%_Common%\Microsoft Shared\ClickToRun"
set "_file=%_target%\OfficeClickToRun.exe"
set "_work=%~dp0bin"
reg query HKU\S-1-5-19 >nul 2>&1 || (
set "msg=ERROR: right click on the script and 'Run as administrator'"
goto :end
)
for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G
if %winbuild% LSS 7601 (
set "msg=ERROR: Windows 7 SP1 is the minimum supported OS"
goto :end
)
setlocal EnableDelayedExpansion
if not exist "!_work!\!xOS!\cleanospp.exe" (
set "msg=ERROR: required file cleanospp.exe is missing"
goto :end
)
set "_Nul1=1>nul"
set "_Nul2=2>nul"
set "_Nul6=2^>nul"
set "_Nul3=1>nul 2>nul"

title Uninstall Office Keys
set OfficeC2R=0
sc query ClickToRunSvc %_Nul3% && set OfficeC2R=1
sc query OfficeSvc %_Nul3% && set OfficeC2R=1
reg query HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration /v ProductReleaseIds %_Nul3% && (
set OfficeC2R=1
)
reg query HKLM\SOFTWARE\WOW6432Node\Microsoft\Office\ClickToRun\Configuration /v ProductReleaseIds %_Nul3% && set OfficeC2R=1
if exist "!_file!" set OfficeC2R=1
set OfficeMSI=0
for /f "skip=2 tokens=2*" %%a in ('"reg query HKLM\SOFTWARE\Microsoft\Office\16.0\Common\InstallRoot /v Path" %_Nul6%') do if exist "%%b\OSPP.VBS" set OfficeMSI=1
for /f "skip=2 tokens=2*" %%a in ('"reg query HKLM\SOFTWARE\Wow6432Node\Microsoft\Office\16.0\Common\InstallRoot /v Path" %_Nul6%') do if exist "%%b\OSPP.VBS" set OfficeMSI=1

if %OfficeC2R% equ 0 if %OfficeMSI% equ 0 (
echo.
echo ============================================================
echo No installed Office ClickToRun or Office 2016 MSI detected
echo.
echo.
choice /C YN /N /M "Continue with uninstalling Office keys anyway? [y/n]: "
if errorlevel 2 goto :eof
if errorlevel 1 goto :main
)
echo.
echo ============================================================
if %OfficeC2R% equ 1 echo Detected Office C2R
if %OfficeMSI% equ 1 echo Detected Office 2016 MSI
echo.
echo.
choice /C YN /N /M "Continue with uninstalling detected Office keys? [y/n]: "
if errorlevel 2 goto :eof
if errorlevel 1 goto :main

:main
cls
echo.
echo ============================================================
echo Uninstalling Product Key^(s)
echo ============================================================
echo.
pushd "!_work!\!xOS!"
cleanospp.exe -PKey %_Nul3%
call :cKMS %_Nul3%
if exist "%SysPath%\spp\store_test\2.0\tokens.dat" (
echo.
echo ============================================================
echo Refreshing Windows Insider Preview Licenses...
echo ============================================================
echo.
cscript //Nologo //B %SysPath%\slmgr.vbs /rilc
)
set "msg=Finished.."
goto :end

:cKMS
set "OSPP=SOFTWARE\Microsoft\OfficeSoftwareProtectionPlatform"
set "SPPk=SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform"
if %winbuild% geq 9200 (
set spp=SoftwareLicensingProduct
) else (
set spp=OfficeSoftwareProtectionProduct
)
for /f "tokens=2 delims==" %%G in ('"wmic path %spp% where (Name LIKE 'Office%%' AND PartialProductKey is not NULL) get ID /VALUE" %_Nul6%') do (set app=%%G&call :cAPP %_Nul3%)
call :cREG %_Nul3%
goto :eof

:cAPP
wmic path %spp% where ID='%app%' call ClearKeyManagementServiceMachine
wmic path %spp% where ID='%app%' call ClearKeyManagementServicePort
wmic path %spp% where ID='%app%' call UninstallProductKey
goto :eof

:cREG
reg delete "HKLM\%OSPP%\0ff1ce15-a989-479d-af46-f275c6370663" /f
reg delete "HKLM\%SPPk%\0ff1ce15-a989-479d-af46-f275c6370663" /f
reg delete "HKU\S-1-5-20\%SPPk%\0ff1ce15-a989-479d-af46-f275c6370663" /f
goto :eof

:end
echo.
echo ============================================================
echo %msg%
echo ============================================================
echo.
echo Press any key to exit.
pause >nul
goto :eof