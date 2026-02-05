# Explanation for Question 8

The script bg_move.sh accepts a directory path as an argument. It creates a subdirectory named `backup/` inside the given directory and moves each file into it.

Each move operation is executed in the background using `&`. The script prints the PID of each background process using `$!`. The PID of the script itself is shown using `$$`.

After starting all background jobs, the script uses `wait` to pause until all background move operations are completed.
