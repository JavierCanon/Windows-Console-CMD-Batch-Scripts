@ECHO OFF
setlocal ENABLEDELAYEDEXPANSION
set word=mp3
set str=%~1
set str=%str:mp4=!word!%

set path=%path%;"X:\PROGRAMAS_PROGRAMACION\VIDEO\ffmpeg\bin\"
rem set path=G:\MP4\AUDIOLIBROS\

ECHO procesing mp4 "%~1"
ECHO to %str%
echo.
echo.
echo ffmpeg -i "%~1" "%str%"
echo.
echo.
ffmpeg.exe -i "%~1" "%str%"
echo.
PAUSE
