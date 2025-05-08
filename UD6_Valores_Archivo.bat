@echo off
setlocal enabledelayedexpansion

set /p variable=<archivo.txt

echo La primera linea del archivo es: %variable%

pause