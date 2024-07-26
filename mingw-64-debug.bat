@echo off
setlocal

REM Get the name of the current directory
for %%I in (.) do set "CURRENT_DIR=%%~nxI"

REM Get the path of the parent directory
for %%I in (..) do set "PARENT_DIR=%%~fI"

REM Define the new directory path
set "NEW_DIR=%PARENT_DIR%\%CURRENT_DIR%-mingw-64-debug"

REM Check if the directory exists and delete it if it does
if exist "%NEW_DIR%" (
    echo Deleting existing directory: %NEW_DIR%
    rmdir /s /q "%NEW_DIR%"
)

REM Create the new directory
mkdir "%NEW_DIR%"

REM Print the path of the new directory
echo Created new directory: %NEW_DIR%

REM Lauch the compilation with cmake
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Debug -S . -B "%NEW_DIR%"
cmake --build "%NEW_DIR%"
endlocal
