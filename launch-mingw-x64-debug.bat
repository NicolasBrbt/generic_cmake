@echo off
REM This script is used to launch the executable built with mingw-x64-debug
REM Give the name of the executable
set EXECUTABLE_NAME= "coucou"
REM Get the name of the current directory
for %%I in (.) do set "CURRENT_DIR=%%~nxI"


REM Définir le chemin vers l'exécutable en utilisant le répertoire parent
set "exePath=..\%CURRENT_DIR%-mingw-x64-debug\bin\%EXECUTABLE_NAME%.exe"
if exist "%exePath%" (
    "%exePath%"
) else (
    echo The executable "%exePath%" does not exist.
)