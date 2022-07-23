# Build an Orix rom

## Guideline

* In order to have commands available from shell, some rules must be set in the bank structure ([https://github.com/orix-software/empty-rom/](https://github.com/orix-software/empty-rom/)). Bank structure must be used, or commands won't be accessed from the kernel or commands (As [help](/commands/help/) -b XX)

* A ROM which will be in an ROM slot or a RAM slot. 

Ram slot is useful if some values must be set internaly (and it avoid malloc use, but it's not the way a ROM should not done if the process can be launched twice at the same time).

Some existing roms are in a eeprom slot (kernel, shell, monitor, forth ..). Systemd rom is a rom loaded into RAM bank.

* C language can be used for bank, but the 16KB of a bank is quickly filled with C code.

* [orix-sdk](/home/orixsdk/) must be intensively used, and if it can't used, kernel primitives must be used. If a universal feature is missing in kernel, it's better to insert into kernel than develop only for the ROM.

* Each rom contains 1 or X commands.

* In order to have multitasking in the future, commands must use malloc and free from kernel (and file operations)

* commands must use zero page from $80 to $80+26 because kernel saves 26 bytes from $80 to $80+26 in order to swap processes

*limit for a rom is 16KB. But, it's maybe enough because many operations are done with kernel calls (fopen for example).

* Kernel is always **available** when "set" banking is RAM or EEPROM Bank 7 (kernel is always available even when there is swapping between twilighte banking register.

## Bank Structure

If you want to build an orix compatible rom, a special format is used for Orix bank.

You can download rom template here : [https://github.com/orix-software/empty-rom/](https://github.com/orix-software/empty-rom/)

### Rom definition

* $fff0 : 1 byte, rom type (Value 0 : empty bank, value 1 : command bank)

## Zero page

Kernel uses some address in zero page. But $80 to $FF offset are reserved for binary, Orix banks. Address below $80 can be used, but kernel could erase it when IRQ or Kernels calls occurs.

Mainly, in some orix rom, userzp is a label for $80 offset.

Kernel saves 16 bytes when a binary is forked. It means that a XEXEC calls in a binary will save PPID offset from $80 to $80+16, and kernel will restore theses offsets when the PID has finished. In the future, multitasking will work in the same ways, and there is no guarantee that a binary will have its values restores when offset are greater than $80+16

## Launch the ROM

### Oricutron

If it's a rom which must be in a ram slot, the config file must be set it in in bankram section or else insert it in bankrom section.

### Real

Rom can be loaded on eeprom easily, it will erase 4 banks :

``` bash
orixcfg -r -s 0 myrom.rom
```

Rom must be loaded into ram slot, it will erase only one bank :  :

``` bash
orixcfg -w -s 0 -b 4 myrom.rom
```

At this step if everything is OK, each commands from the bank can be accessed from shell.


