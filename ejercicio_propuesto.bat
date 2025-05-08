@echo off
:: Desactiva la visualización de comandos en la consola

:: --- Paso 1: Crear usuario administrativo ---
net user Admin SuperPass123 /add
:: Crea un nuevo usuario llamado "Admin" con contraseña "SuperPass123"

net localgroup Administradores Admin /add
:: Añade el usuario "Admin" al grupo "Administradores"

:: --- Paso 2: Configurar permisos ---
icacls C:\ /grant Admin:(OI)(CI)F
:: Otorga control total al usuario Admin sobre el disco C:

:: --- Paso 3: Registrar acción ---
echo [%date% %time%] Usuario administrativo creado >> setup_log.txt
:: Guarda registro en setup_log.txt

:: Mensaje final
echo Usuario 'Admin' configurado con privilegios completos.
pause