#!/bin/bash


# Get the name of the current directory
CURRENT_DIR=$(basename "$(pwd)")

# Get the path of the parent directory
PARENT_DIR=$(dirname "$(pwd)")

# Define the new directory path
NEW_DIR="$PARENT_DIR/${CURRENT_DIR}-Unix-x64-debug"

# Check if the directory exists and delete it if it does
if [ -d "$NEW_DIR" ]; then
    echo "Deleting existing directory: $NEW_DIR"
    rm -rf "$NEW_DIR"
fi

# Create the new directory
mkdir -p "$NEW_DIR"

# Print the path of the new directory
echo "Created new directory: $NEW_DIR"

# Launch the compilation with CMake
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug -S . -B "$NEW_DIR"
cmake --build "$NEW_DIR"
