@echo off
@REM Crear usuarios locales y asignarlos a un grupo
@REM net user test Prometeo /add
@REM net localgroup "Administradores" test /add
set /p nusuario=introduce tu nombre de usuario:
set /p password=introduce tu password:
pause
net user %nusuario% %password% /add
pause
set /p grupo=introduce tu grupo Administradores, :
net localgroup %grupo% %nusuario% /add