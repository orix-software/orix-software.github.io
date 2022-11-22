# Binary start sequence

All commands are started with XEXEC kernel primitive. For example, when something is typed into shell, shell calls XEXEC kernel primitive (except for shell internal commands like echo, pwd ...).

When a binary is executed, kernel fork a new process with its PID, PPID, CWD

## Step 1 : check if binary is in a bank

XEXEC reads all banks from 4 to 1 and tries to check if the program is in a ROM (that is why ROM needs to have a kind of header)

If the commands is in a bank, it switches to the right bank and launch command vector (and it forks). If the commands is not found, it swaps "Twilighte banking register" to provide others 65KB of bank, kernel checks banks again. When kernel reached the 32 banks of rom, it swap to ram set, and reads all theses 32 banks of RAM. If the command is not found, kernel send error code, and shell will display error message according to kernel error code.

That is why commands located in bank (eeprom and after RAM) are quicker to start. EEPROM banks are quicker to launch because kernel starts with eeprom set.

## Step 2 : Check if the binary is on the device

If the binary is not in a bank, kernel will try to open "/bin/BINARY_FILE". If the binary open fails, it returns "command not found" or impossible to mount if device is not present.

## Step 3 : binary on storage device is found

Kernel opens the file, reads the header, and loads the content of the binary on the right address. When it's OK, the binary is started (and a fork occurs)

