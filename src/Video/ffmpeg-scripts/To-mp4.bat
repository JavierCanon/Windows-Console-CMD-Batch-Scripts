@echo off

setlocal ENABLEDELAYEDEXPANSION
set ext=mp4
set str=%~1
set str=%str:~0,-3%%ext%

echo.
echo CONVERTING TO "%str%"
ffmpeg -i "%~1" -f mp4 -vcodec libx264 -preset medium -profile:v main -acodec aac "%str%" -hide_banner
echo.
PAUSE