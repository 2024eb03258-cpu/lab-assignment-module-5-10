# Explanation for Question 10

This program demonstrates signal handling using a parent and two child processes. The parent installs two different handlers: one for SIGTERM and one for SIGINT.

The first child sleeps for 5 seconds and then sends SIGTERM to the parent using `kill()`. The second child sleeps for 10 seconds and sends SIGINT. Each signal triggers a different handler in the parent, demonstrating customized behavior.

The parent runs indefinitely while waiting for signals. After both children terminate and the signals are handled, the parent exits gracefully.
