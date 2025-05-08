@echo off
setlocal enabledelayedexpansion

:: Script para configurar IP estática y realizar copia de archivos
:: Versión corregida del original manteniendo su estructura básica

set /p IP=Introduce la IP estática:
set /p MASCARA=Introduce la máscara de subred:
set /p PUERTA=Introduce la puerta de enlace:

echo Configurando IP...
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA% 1
echo Configuración aplicada.

set /p ORIGEN=Ruta de origen para la copia:
set /p DESTINO=Ruta de destino para la copia:

if not exist "%DESTINO%" mkdir "%DESTINO%"

echo Iniciando backup...
robocopy "%ORIGEN%" "%DESTINO%" /E /Z /NP /LOG+:log_admin.txt

echo --- >> log_admin.txt
echo [%DATE% %TIME%] Configuración de red: IP=%IP%, MASK=%MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt
echo [%DATE% %TIME%] Copia realizada de "%ORIGEN%" a "%DESTINO%" >> log_admin.txt

echo Operación completada. Revisa el archivo log_admin.txt
pause