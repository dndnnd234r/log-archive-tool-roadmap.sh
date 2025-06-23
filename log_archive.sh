#!/bin/bash

# Welcome to Log Archive Tool!

# Checks if argument is provided
if [[ $# -eq 0 ]]; then
	echo "Usage: $0 <log-directory>"
	exit 1
fi

# Get the log directory from the argument
LOG_DIR="$1"

# Checks if the provided path exists and is a directory
if [[ ! -d "$LOG_DIR" ]]; then
	echo "Error: Directory '$LOG_DIR' does not exist"
	exit 1
fi

# Generate timestamp using the date command in for mate YYYY-MM-DD_HH:MM:SS
TIMESTAMP=$(date +"%Y-%m-%d_%H:%M:%S")

# Create archive filename
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Create archive directory if it doesn't exist
ARCHIVE_DIR="/home/user/archives" # Replace with your directory
mkdir -p "$ARCHIVE_DIR"

# Create the compressed archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR"

# Log the archive creation with timestamp
LOG_FILE="/home/user/archive.log" # Replace with your log destination
echo "$(date) - Archived $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_NAME" >> "$LOG_FILE"

echo "Archive created successfully: $ARCHIVE_DIR/$ARCHIVE_NAME"
