# Bootfd

bootfd is a tool to boot the boot sector when a drive is connected. Insert a disk (in cumulus for example) and type :

``` bash
/#bootfd
```

The binary is located to bin folder. It will load microdisc rom and start it. If the binary displays that it does not found microdis.rom, then place microdis.rom file in the right folder.

If you have firmware 1, you will be able to load « blake’s 7 ». If you have firmware 2, all sedoric .dsk should start.

For instance, only Space99 does not work, it stops after intro.
