# Definitions

## Twilighte board

The Twilighte board is an extra hardware connected on the the oric (Atmos or Oric-1), it improves default Oric with hardware feature as eeprom (in system update), RAM, joysticks, usb controler.

It handles 32 Banks of 16KB of eeprom and 32 Banks of 16KB for RAM. The architecture of hardware registers, joystick management has compatibility with Telestrat in order to have Oric working on Telestrat or Atmos.

| Feature     | Availability                          |
| ----------- | ------------------------------------ |
| `Sdcard`         | :material-check:     |
| `Usbdrive storage`       | :material-check:  |
| `Long filename`    | :material-check:      |
| `Every usb device control`    | :material-check:     |
| `2 Joysticks`    | :material-check:     |
| `Joysticks works at independently`    | :material-check:     |
| `512KB RAM memory`    | :material-check:     |
| `512KB eeprom memory`    | :material-check:     |
| `Eeprom in system update`    | :material-check:     |

## Orix

loader_img.jpg
![Image](loader_img.jpg){ align=left }

Orix is the default (D)OS of the board when it plugged into the oric. Orix is a linux/unix style OS. It's the main OS which can help to start every others systems as oric-1 ROM, atmos ROM etc

Orix must have at least 2 banks to boot : Kernel and shell.

Kernel is a bank inserted in the 7th slot and it's the first start to boot. Shell is the 5th bank and contains sh binary.

When system starts, kernel forks "sh" commands at the end of the kernel initialisation. Shell is available and can starts any commands.

There are 2 kind of rom :

* Standalone ROM : it does not need to call kernel primitive, and manage all the main memory (for example : atmos ROM)

* Orix Roms : in that case, rom does not manage the main memory, and calls kernel to do tasks (for example : Shell roms).

In Orix roms, the rom declares commands to an offset in the bank and can be accessed from command line. If any command are typed from prompt, kernel will launch "XEXEC" primitive to find in any rom where the command is.


| Feature     | Availability                          |
| ----------- | ------------------------------------ |
| `Multitasking`         | :material-close:     |
| `Long filename management`       | :material-close:  |



Page last revised on: {{ git_revision_date }}
