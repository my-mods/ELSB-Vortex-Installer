@echo off
setlocal
set "PS1=%~dp0ELSB.ps1"
if not exist "%PS1%" goto :nops1
start "ELSB" /min powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"
exit /b 0

:nops1
echo  NG: ELSB.ps1 was not found next to this bat.
echo  Extract the whole zip to a folder first, then run this again.
pause
exit /b 1
