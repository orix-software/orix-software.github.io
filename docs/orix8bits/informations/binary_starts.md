# Binary start sequence

All commands are started with XEXEC kernel primitive. For example, when something is typed into shell, shell calls XEXEC kernel primitive (except for shell internal commands like echo, pwd ...).

When a binary is executed, kernel fork a new process with its PID, PPID, CWD

## Step 1 : check if binary in a bank

Xexec reads all banks from 4 to 1 and tries to check if the program is in a ROM (that is why ROM needs to have a kind of header)

If the commands is in a bank, it switches to the right bank and launch command vector (and it forks)

That is why commands located in bank are quicker to start

## Step 2 : Check if the binary is on the device

If the binary is not in a bank, kernel will try to open "/bin/BINARY_FILE". If open fails, it returns "command not found" or impossible to mount if device is not present.

## Step 3 : binary on device is found

Kernel opens the file, reads the header, and loads the content of the binary on the right address. When it's OK, the binary is started (and a fork occurs.)
