@ECHO OFF
setlocal ENABLEDELAYEDEXPANSION
set word=mp3
set str=%~1
set str=%str:m4a=!word!%

set path=%path%;"X:\PROGRAMAS_PROGRAMACION\VIDEO\ffmpeg\bin\"
rem set path=G:\MP4\AUDIOLIBROS\

ECHO procesing m4a "%~1"
ECHO to %str%
echo.
echo.
echo ffmpeg -i "%~1" -acodec libmp3lame -aq 2 "%str%"
echo.
echo.
ffmpeg.exe -i "%~1" -acodec libmp3lame -aq 2 "%str%"
echo.
PAUSE
