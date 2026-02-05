# Explanation for Question 2

The script `logsummary.sh` accepts a log file name as a command-line argument. It first checks that the file exists and is readable. If not, it prints an appropriate error message and exits.

The script counts the total number of log entries using `wc -l`. It then counts the number of INFO, WARNING, and ERROR messages using `grep -c`.

To find the most recent ERROR message, the script filters all ERROR lines with `grep` and selects the last one using `tail -1`.

A report file named `logsummary_<date>.txt` is generated using the current system date. The report includes all counts and the most recent ERROR message.

This approach ensures proper validation, clear output, and graceful error handling.

