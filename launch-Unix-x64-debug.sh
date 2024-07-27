#!/bin/bash
# This script is used to run the executable generated with the Unix-x64-debug configuration
# Give the name of your executable
executable_name=""

# Get the name of the current directory
CURRENT_DIR=$(basename "$(pwd)")

# Define the path to the executable using the parent directory
exePath="../${CURRENT_DIR}-Unix-x64-debug/bin/${executable_name}"

# Check if the executable exists and run it, or print an error message
if [ -f "$exePath" ]; then
    "$exePath"
else
    echo "The executable \"$exePath\" does not exist."
fi
