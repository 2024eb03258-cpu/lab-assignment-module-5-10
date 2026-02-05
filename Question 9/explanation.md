# Explanation for Question 9

This program demonstrates zombie process prevention by creating multiple child processes using `fork()`. Each child prints its PID, performs a short task, and then terminates.

When a child process exits, it becomes a zombie until the parent collects its exit status. To prevent zombies, the parent repeatedly calls `wait()` inside a loop. Each successful `wait()` returns the PID of a terminated child, which the parent prints.

By waiting for all children, the parent ensures that no zombie processes remain.
