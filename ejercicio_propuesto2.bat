@echo off
:: Desactiva la visualización de comandos en la consola para una salida más limpia

setlocal enabledelayedexpansion
:: Habilita la expansión retardada de variables para manejar correctamente los valores

:: Solicita al usuario que introduzca la dirección IP estática
set /p IP=Introduce la IP estática:

:: Solicita al usuario que introduzca la máscara de subred
set /p MASCARA=Introduce la máscara de subred:

:: Solicita al usuario que introduzca la puerta de enlace
set /p PUERTA=Introduce la puerta de enlace:

:: Muestra mensaje indicando que se está configurando la IP
echo Configurando IP...

:: Configura la interfaz de red Ethernet con los valores proporcionados
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA% 1

:: Muestra mensaje de confirmación
echo Configuración aplicada.

:: SECCIÓN DE COPIA DE ARCHIVOS

:: Solicita la ruta de origen para la copia de seguridad
set /p ORIGEN=Ruta de origen para la copia:

:: Solicita la ruta de destino para la copia de seguridad
set /p DESTINO=Ruta de destino para la copia:

:: Verifica si existe el directorio de destino, si no existe, lo crea
if not exist "%DESTINO%" mkdir "%DESTINO%"

:: Muestra mensaje indicando que comienza el proceso de copia
echo Iniciando backup...

:: Ejecuta robocopy para realizar la copia de archivos con las opciones:
:: /E - Copia subdirectorios, incluyendo vacíos
:: /Z - Permite reanudar transferencias interrumpidas
:: /NP - No muestra el porcentaje de progreso
:: /LOG+: - Añade la salida al archivo log_admin.txt (sin sobrescribir)
robocopy "%ORIGEN%" "%DESTINO%" /E /Z /NP /LOG+:log_admin.txt

:: -------------------------------------------------------------------
:: SECCIÓN DE REGISTRO (LOG)
:: -------------------------------------------------------------------

:: Añade una línea separadora al archivo de log
echo --- >> log_admin.txt

:: Registra la configuración de red aplicada con fecha y hora
echo [%DATE% %TIME%] Configuración de red: IP=%IP%, MASK=%MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt

:: Registra la operación de copia realizada con fecha y hora
echo [%DATE% %TIME%] Copia realizada de "%ORIGEN%" a "%DESTINO%" >> log_admin.txt

:: -------------------------------------------------------------------
:: FINALIZACIÓN
:: -------------------------------------------------------------------

:: Muestra mensaje final indicando que la operación se completó
echo Operación completada. Revisa el archivo log_admin.txt

:: Pausa la ejecución para que el usuario pueda ver los resultados
pause
