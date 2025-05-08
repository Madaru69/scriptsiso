@echo off
@rem Cuenta Regresiva desde 10 hasta cero restando de a 1
for /L %%i in (10,-1,0) do (
    echo iteracion: %%i
)