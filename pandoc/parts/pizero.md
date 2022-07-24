\newpage

[]{#anchor-65}MONITOR
=====================

[]{#anchor-66}Usage
-------------------

Monitor is a rom which can displays a monitor. It's teleass without
assembler part.

[]{#anchor-67}ORIXCFG
=====================

[]{#anchor-68}Update kernel, shell : orixcfg
--------------------------------------------

When a new released is done, you can update the eeprom with the new
kernel and new roms.

If you want to know if you need to update the kernel, you can compare
your current version, and the last release version. You can go to
[http://orix.oric.org](http://orix.oric.org/) You need to have a look to
this release below :

![](.//Pictures/10000000000004A9000002B630F032C016A16F4A.png){width="17cm"
height="9.888cm"}

If on your Oric screen, it's not the same value, you can update it. The
sequence of the Orix release is Year.X. There is 4 releases a year, and
each one must be done until you reach the final one, in order to avoid
some case. If your version is v2020.3 and the last available version is
v2021.4. You need to update to v2020.4, then v2021.1, v2021.2, v2021.3,
v2021.4.

It's maybe possible to jump to version v2021.4, but it's at your own
risk because there is a « chance » that some kernel calls changed, and
orixcfg could do wrong step.

[]{#anchor-69}Update kernel, shell
----------------------------------

When you need to update kernel, you can update it with orixcfg. You just
need to define set 4 on the command line. This step is very
**dangerous** if you don't load the right file. There is no verification
and any file on the command line will be load in the kernel set.
Usually, kernel set file is named kernxxxx.r64.

If you did something wrong on this step, you won't be able to start orix
again. It means that you will need to remove eeprom from the card and
program it with a eeprom programmer

This next command will load kernel.r64 to kernel set. Please wait until
Orix reboots. If you have a kernel 2020.3 and you need to load a kernel
2021,1, you will need to load previous kernel set before the update of
2021.1.

.r64 extension means that it's a 64KB set. It's usually used to define
that the file contains 4 roms of 16KB.

Please note that we provide 2 kernels version. One named
« kernelsd.r64 » which means that the default device will be sdcard, and
the other one « kernelus.r64 » which means that default device will be
« usb » (usbkey). If you load the wrong kernel at this step, you can use
twil command to switch to the right device, and you can start again
kernel update with the right file (kernelsd.r64 or kernelus.r64
depending of your configuration).

/\#orixcfg -r -s 4 kernelsd.r64

[]{#anchor-70}Load a ROM into a ram slot
----------------------------------------

Space between values and switches are not optionnal, orixcfg needs
theses spaces

/\#orixcfg -b XX -l myrom.rom

This command will load myrom.rom (in the current path), in RAM bank XX

Older usage as : orixcfg -r -s X -b Y myrom.rom is no longer included in
orixcfg since orixcfg v2021.3

[]{#anchor-71}Load a set of ROM into ROM slot
---------------------------------------------

/\#orixcfg -r -s 0 myrom.r64

[]{#anchor-72}This command will load myrom.r64 (in the current path), in
set 0. For instance, you can not load one bank, you need to load 64KB
set.

[]{#anchor-73}Clear bank ram or initialize it
---------------------------------------------

Ram bank are not initialized when the board is tested. If you have
garbage on screen when you uses bank (after you used twil -w). You have
to clear all ram bank (ram bank are battery saved).

If you want to clear bank 4 of the set 0, you can do this command. You
need to do this command for each bank of each set. For instance, there
is no switch to clear all the ram with one command.

/\#orixcfg -w -s 0 -b 4 -c

[]{#anchor-74}Flush all ram bank
--------------------------------

/\#orixcfg -w -f

[]{#anchor-75}OSID MUSIC
========================

[]{#anchor-76}How to play osid music ?
--------------------------------------

You need to check if you have twilighte board firmware 2 :

/\#twil -f

If it returns 2 or greater, you can download some osid files :

<https://www.oric.org/software/osid_music-2534.html>

Place all .tap files in /home/basic11

And launch :

/\#basic11

Load patch to avoid to load sedoric routines (in basic command line)

CLOAD«OSID

And then load the osid file you want :

CLOAD«OSNEVER

[]{#anchor-77}PWD
=================

[]{#anchor-78}Introduction
--------------------------

Displays current PWD

[]{#anchor-79}SHA1
==================

[]{#anchor-80}Usage
-------------------

Sha1 is a tool to displays a string into sha1 encoding

[]{#anchor-81}STORMLORD
=======================

[]{#anchor-82}Introduction
--------------------------

Stormlord is Stormlord game port to Orix. You can use joysticks to plays
to this game.

[]{#anchor-83}Only one joystick port is working on this version
===============================================================

[]{#anchor-84}SYSTEMD
=====================

Systemd is a rom which can load another ROM in ram slot. When you type
systemd, it will reads * /etc/systemd/banks and will load rom declared
in this file sequencialy. It means that the first rom will be load in
bank id 33, the second one in bank id 34.*

This roms can be used in a eeprom bank, you can load it with orixcfg

You can set roms in *« /etc/systemd/banks » as : *

*\[MYROMNAME1\]*

*path=/usr/share/rom/my.rom*

*\[MYROMNAME2\]*

path=/usr/share/rom/my2.rom

[]{#anchor-85}TWIL
==================

[]{#anchor-86}Introduction
--------------------------

Twil command can displays the current firmware of twilighte card, and
can swap root folder to usbkey or sdcard.


[]{#anchor-87}Displays Twilighte board firmware
-----------------------------------------------

/\#twil -f

[]{#anchor-88}Swap to sdcard for root file system
-------------------------------------------------

/\#twil -d

[]{#anchor-89}Swap to usb key for root file system
--------------------------------------------------

/\#twil -u
