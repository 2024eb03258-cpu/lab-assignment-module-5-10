#!/bin/bash
# Question 2: Log File Analyzer
if [ $# -ne 1 ]; then
    echo "ERROR: Provide log filename"
    echo "Example: $0 sample.log"
    exit 1
fi

LOG="$1"
REPORT="logsummary_$(date +%Y%m%d).txt"
if [ ! -f "$LOG" ]; then
    echo "ERROR: $LOG not found"
    exit 1
fi
echo "Processing: $LOG"
echo "----------------"
LINES=$(wc -l < "$LOG")
echo "Lines: $LINES"
INFO_COUNT=$(grep -c " INFO " "$LOG")
WARN_COUNT=$(grep -c " WARNING " "$LOG")
ERR_COUNT=$(grep -c " ERROR " "$LOG")
echo "INFO:    $INFO_COUNT"
echo "WARNING: $WARN_COUNT"
echo "ERROR:   $ERR_COUNT"

LAST_ERROR=$(grep " ERROR " "$LOG" | tail -1)
if [ -n "$LAST_ERROR" ]; then
    echo "Last ERROR: $LAST_ERROR"
else
    echo "Last ERROR: None"
fi

echo "----------------"
echo "Creating report: $REPORT"

echo "Log Report" > "$REPORT"
echo "File: $LOG" >> "$REPORT"
echo "Date: $(date)" >> "$REPORT"
echo "" >> "$REPORT"
echo "Total lines: $LINES" >> "$REPORT"
echo "INFO: $INFO_COUNT" >> "$REPORT"
echo "WARNING: $WARN_COUNT" >> "$REPORT"
echo "ERROR: $ERR_COUNT" >> "$REPORT"
echo "" >> "$REPORT"
echo "Last ERROR:" >> "$REPORT"
echo "$LAST_ERROR" >> "$REPORT"

echo "Report saved!"
