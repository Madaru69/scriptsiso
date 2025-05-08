@echo off
@REM Crear usuarios locales y asignarlos a un grupo
@REM net user test Prometeo /add
@REM net localgroup "Administradores" test /add
set /p nusuario=introduce tu nombre de usuario:
set /p password=introduce tu password:
net user %nusuario% %password% /add
echo El usuario %nusuario% ha sido creado

set /p AgregarGrupo=Quieres ser agregado al grupo de administradores? s/n: 
echo Haz seleccionado la opcion: %AgregarGrupo%
pause

%grupo%=Administradores

if %AgregarGrupo% == s(
    net localgroup %grupo% %nusuario% /add
) else (
    echo No haz sido asignado al grupo administradores

)

