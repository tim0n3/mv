#!/bin/bash

# Define the destination directory for .txt files
DEST_DIR="/home/pi/data/hotfolder/2023/August"
VERBOSE=false

# Define the log file
LOG_FILE="/home/pi/textfilemover.log"

# Function to log messages
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Function to log and print messages if verbose mode is enabled
log_or_print() {
    message="$1"
    log "$message"
    if [ "$VERBOSE" = true ]; then
        echo "$message"
    fi
}

# Parse command line options
while getopts ":v" opt; do
  case $opt in
    v)
      VERBOSE=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift the options so that $1 now refers to the directory argument
shift "$((OPTIND-1))"

# Define the source directory (use "$1" or the current directory if not provided)
SRC_DIR="${1:-.}"

# Check if the source directory exists
if [ ! -d "$SRC_DIR" ]; then
  log_or_print "Source directory does not exist: $SRC_DIR"
  exit 1
fi

# Use find to locate .txt files and move them to the destination directory
find "$SRC_DIR" -type f -name "*.txt" -print0 | while IFS= read -r -d '' file; do
  # Log and print the file move
  log_or_print "Moving $file to $DEST_DIR"
  
  # Move the file to the destination directory
  mv "$file" "$DEST_DIR"
  
  # Check if the move was successful
  if [ $? -eq 0 ]; then
    log_or_print "Move of $file completed successfully"
  else
    log_or_print "Move of $file failed"
  fi
done

log_or_print "File movement completed."