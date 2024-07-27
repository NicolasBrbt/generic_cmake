@echo off
REM Get the name of the current directory
for %%I in (.) do set "CURRENT_DIR=%%~nxI"

REM Définir le chemin vers l'exécutable en utilisant le répertoire parent
set "exePath=..\%CURRENT_DIR%-Visual-Studio-17-x64-debug\bin\main.exe"
if exist "%exePath%" (
    "%exePath%"
) else (
    echo L'executable "%exePath%" n'existe pas.
)