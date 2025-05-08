@echo off
setlocal EnableDelayedExpansion

for /f "tokens=3 delims=,"  %%a in (archivo.csv) do (
    set "linea=%%a"
    echo Linea: !linea!
)

pause