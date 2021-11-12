# Build an Orix rom

## Guideline

In order to have commands available from shell, some rules must be set. Bank structure must be used, or commands won't be accessed from the kernel or commands (As help -b XX)

There is the choice to build a ROM which will be in an eeprom slot or a RAM slot.

Ram slot is useful if some values must be set internaly (and it avoid malloc use, but it's not the way a ROM should not done if the process can be launched twice at the same time).

Almost all existing roms are in a eeprom slot (kernel, shell, monitor, forth ..). Systemd rom is the only rom loaded into RAM slot, because, systemd can not be started twice, and keep internal informations.

C is possible for ROM, but the 16KB of a bank is quickly filled with code.

orix-sdk must be intensively used, and if it can't used, kernel primitives must be used. If a universal feature is missing in kernel, it's better to insert into kernel than develop only for the ROM.

Each rom contains 1 or X commands.

In order to have multitasking in the future, commands must use malloc and free from kernel (and file operations)

The limit is 16KB for a ROM for instance. But, it's maybe enough because many operations are done with kernel calls (fopen for example).

## Bank Structure

If you want to build an orix compatible rom, a special format is used for Orix bank.

You can download rom template here : [https://github.com/orix-software/empty-rom/](https://github.com/orix-software/empty-rom/)

### Rom definition

* $fff0 : 1 byte, rom type (Value 0 : empty bank, value 1 : command bank)

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


