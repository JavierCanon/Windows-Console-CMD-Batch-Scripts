@ECHO OFF
title Restart print spooler

ECHO.
ECHO Stopping services, please wait for 10 seconds…
NET STOP Spooler


TIMEOUT /t 10 /NOBREAK
ECHO.
NET START Spooler
PAUSE
EXIT
