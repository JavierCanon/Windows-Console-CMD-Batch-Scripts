@echo off
cd %~dp0
rem Get native screen resolution - Not tried on multimonitor
FOR /f "delims=" %%q IN ('%comspec% /c "wmic desktopmonitor get ScreenWidth,ScreenHeight" /value ^| find "="') DO (SET %%q)
SET res=%ScreenWidth%%ScreenHeight%
SET "dest=%USERPROFILE%\Pictures\Spotlight\"
SET "source=%USERPROFILE%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets"
FOR /R %source% %%F IN (*.*) DO (
	FOR /f %%a in ('imgInfo.bat %%F')  DO (
		IF "%%a" == "%res%" (
			echo F|XCOPY  "%%F" "%dest%%%~nF.jpeg" /d /y /q > nul
		)
	) 
)
EXIT /B /0
