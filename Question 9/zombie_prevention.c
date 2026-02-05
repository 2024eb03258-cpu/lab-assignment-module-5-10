#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int i;
    pid_t pid;

    for (i = 0; i < 3; i++) {   // create multiple children
        pid = fork();

        if (pid < 0) {
            perror("fork failed");
            exit(1);
        }

        if (pid == 0) {
            // Child process
            printf("Child %d started with PID: %d\n", i + 1, getpid());
            sleep(1);  // simulate some work
            exit(0);   // child exits → becomes zombie until parent waits
        }
    }

    // Parent process cleans up children
    pid_t child_pid;
    while ((child_pid = wait(NULL)) > 0) {
        printf("Parent cleaned up child with PID: %d\n", child_pid);
    }

    printf("All children cleaned. No zombies remain.\n");
    return 0;
}
