@echo off
setlocal enabledelayedexpansion

set /p nombre=Nombre de usuario:

set /p origen=introduce la ruta del origen: 
set /p destino=Introduce la carpeta destino: 

set contador=1

if not exist "%destino%" mkdir "%destino%"

for %%F in (%origen%\*.bat) do (
    copy "%%F" "%destino%\ mkdir "
)