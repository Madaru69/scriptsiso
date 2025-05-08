@echo off
setlocal enabledelayedexpansion

::Comentario::

set "origen=C:\Users\Alumno\Desktop"
set "destino=C:\Users\Alumno\Desktop\backup"

set contador=1

if not exist "%destino%" mkdir "%destino%"

for %%F in (%origen%\*.bat) do (
    copy "%%F" "%destino%\copia_!contador!.bat"
    echo copiado: %%F como copia_!contador!.bat
    set /a contador+=1
    if !contador! gtr 5 goto :fin
)
:fin
pause
endlocal