@echo off
setlocal EnableDelayedExpansion

:pedir
set /p entrada=Escribe "salir" para terminar: 

if /i not "%entrada%"=="salir" (
    echo Debes escribir salir
    goto pedir
)

echo saliendo del bucle
pause