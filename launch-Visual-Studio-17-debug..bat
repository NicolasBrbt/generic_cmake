@echo off
REM Get the name of the current directory
for %%I in (.) do set "CURRENT_DIR=%%~nxI"
echo CURRENT_DIR: %CURRENT_DIR%

REM Définir le chemin vers l'exécutable en utilisant le répertoire parent
set "exePath=..\%CURRENT_DIR%-Visual-Studio-17-debug\bin\main.exe"
echo exePath: %exePath%
if exist "%exePath%" (
    "%exePath%"
) else (
    echo L'executable "%exePath%" n'existe pas.
)