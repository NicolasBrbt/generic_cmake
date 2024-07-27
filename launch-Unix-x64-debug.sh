#!/bin/bash

# Get the name of the current directory
CURRENT_DIR=$(basename "$(pwd)")

# Define the path to the executable using the parent directory
exePath="../${CURRENT_DIR}-Unix-x64-debug/bin/main"

# Check if the executable exists and run it, or print an error message
if [ -f "$exePath" ]; then
    "$exePath"
else
    echo "L'exécutable \"$exePath\" n'existe pas."
fi
