@echo off
setlocal EnableDelayedExpansion

set /a contador=0

:while_loop
if %contador% lss 5 (
    echo Contador: %contador%
    set /a contador+=1
    goto while_loop
)