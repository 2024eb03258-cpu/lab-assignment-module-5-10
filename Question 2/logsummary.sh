#!/bin/bash

# Check if filename is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

LOGFILE="$1"

# Validate file exists and is readable
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1
fi

if [ ! -r "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' is not readable."
    exit 1
fi

# Count total log entries
total=$(wc -l < "$LOGFILE")

# Count INFO, WARNING, ERROR
info=$(grep -c "INFO" "$LOGFILE")
warning=$(grep -c "WARNING" "$LOGFILE")
error=$(grep -c "ERROR" "$LOGFILE")

# Most recent ERROR message
recent_error=$(grep "ERROR" "$LOGFILE" | tail -1)

# Generate report file
date_str=$(date +%Y-%m-%d)
report="logsummary_${date_str}.txt"

{
    echo "Log Summary Report ($date_str)"
    echo "------------------------------"
    echo "Total log entries: $total"
    echo "INFO messages: $info"
    echo "WARNING messages: $warning"
    echo "ERROR messages: $error"
    echo
    echo "Most recent ERROR message:"
    echo "$recent_error"
} > "$report"

echo "Report generated: $report"
