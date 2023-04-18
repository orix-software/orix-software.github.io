# Command: bootfd

## Starts microdisc bootsector

bootfd is a tool to boot the boot sector when a drive is connected.
Insert a disk and type :

/#bootfd

The binary is located in "/bin" folder. It will load microdisc rom and
will start it. If it displays "microdis.rom not found",
then place "microdis.rom" file in the right folder.

If you have firmware 1, you will be able to load « blake's 7 ». If you
have firmware 2, all sedoric .dsk should start.

For instance, only Space99 does not work, it stops after intro.

## SYNOPSYS
+ bootfd

## EXAMPLES
+ bootfd

Boots only microdisc boot sector with the help of microdisc.rom. In this version, we don't verify if a dsk is inserted or not. If there is no disk, the oric will crash

## SOURCE
Src code : https://github.com/orix-software/bootfd.git (Assembly and C)
