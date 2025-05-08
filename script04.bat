@echo off
rem condicionales
set /p edad=introduce tu edad: 

if %edad% GEQ 18 (
echo Eres mayor de edad)
else %edad% LSS 18 (
    echo Eres menor de edad
)