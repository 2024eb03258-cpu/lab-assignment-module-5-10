#!/bin/bash

# Check if directory path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIR="$1"

# Check if directory exists
if [ ! -d "$DIR" ]; then
    echo "Directory not found."
    exit 1
fi

# Create backup directory inside the given directory
mkdir -p "$DIR/backup"

echo "Script PID: $$"

# Loop through files in the directory
for file in "$DIR"/*; do
    # Skip the backup folder itself
    if [ "$file" = "$DIR/backup" ]; then
        continue
    fi

    # Move each file in the background
    mv "$file" "$DIR/backup/" &

    # Display PID of background process
    echo "Moving $file in background with PID: $!"
done

# Wait for all background jobs to finish
wait
echo "All background move operations completed."
