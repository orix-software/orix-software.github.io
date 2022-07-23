

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

Twil command can also swap bank 4, 3, 2 and to eeprom set or ram set.

[]{#anchor-87}Displays Twilighte board firmware
-----------------------------------------------

/\#twil -f

[]{#anchor-88}Swap to sdcard for root file system
-------------------------------------------------

/\#twil -d

[]{#anchor-89}Swap to usb key for root file system
--------------------------------------------------

/\#twil -u

[]{#anchor-90}PI ZERO connection for DRAG AND DROP
==================================================

[]{#anchor-91}Drag and drop or file copy to the pi zero
-------------------------------------------------------

If you have a pi zero, you can use it to simulate a usb key with wifi
connectivity for drag and drop.

You need to follow this documentation :
<http://orix.oric.org/drag-and-drop-files-from-pc-to-the-card/>

Please note that you must connect pi to usb twilighte port on his usb
port (not the psu port). Also note that pi consumes power and if you use
a psu lower than 2 A, you should have some hardware errors

![](.//Pictures/10000201000004E0000003605B6721EC7F221E18.png){width="17cm"
height="11.769cm"}Some usb cable are only for charge, it means that it
won't work with the card and pi zero, because it missed data wires

[]{#anchor-92}CUMULUS COMPATIBILITY
===================================

[]{#anchor-93}How to connect a cumulus 
---------------------------------------

On the current firmware (Firmware 1) : and current hardware (board
version v0.65), we have to do some hacks to have cumulus working. But,
you will only launch two diskfile. Anyway, you can access to drive with
no restriction, except bank switching. See « Hardware and firmware
upgrade », if you want to avoid theses modifications

In firmware 1, and with board modification, there is only two working
disk : Blake's 7 and VIP2015.

Please, test your cumulus on the oric connected to the board. If it does
not work on your Oric, it won't work too with card plugged !

If you want to use cumulus, you have to :

[]{#anchor-94}1) cut 4 pins on daughter card (ROMDIS, MAP, A14, A15)

![](.//Pictures/1000000000000241000002DF1DDB9B71410F29FF.jpg){width="11.137cm"
height="14.185cm"}

[]{#anchor-95}2) remove eprom from cumulus

![](.//Pictures/1000000000000247000002FE052A2A60D55EE267.jpg){width="15.722cm"
height="20.657cm"}

[]{#anchor-96}3) add another amplibus before twilighte daughter board

![](.//Pictures/1000000000000301000002BB0094EC211BFA5935.jpg){width="17cm"
height="15.452cm"}

[]{#anchor-97}4) Connect all cards to the oric

![](.//Pictures/1000000000000284000002DB24C3DD3ED115C54A.jpg){width="16.346cm" height="18.554cm"}
-------------------------------------------------------------------------------------------------

[]{#anchor-98}Twilighte board firmware compatibility
----------------------------------------------------

Only firmware 2 is available to use boot sector to start Microdisc disk.

[]{#anchor-99}Hardware and firmware upgrade
===========================================

[]{#anchor-100}Firmware upgrade
-------------------------------

There is only one firmware available. The version 2 is in development.

[]{#anchor-101}First method : For those who have programmers and some hardware tool
-----------------------------------------------------------------------------------

But, when it will be released, you could update the firmware with :

1\) a plcc extractor

2\) altera software (Quartys v13)

3\) a Jtag programmer

4\) solder the jtag connector

5\) get .pof file

[]{#anchor-102}Second method : send the card to the author of the card (me)
---------------------------------------------------------------------------

In that case, fimware upgrade will be done, and you could ask to upgrade
to new board version to add (sometimes new functionnality)

[]{#anchor-103}TROUBLE SHOOTING
===============================

[]{#anchor-104}'ls' displays garbage on screen
----------------------------------------------

Insert your sdcard or your usb drive into your PC. You should have
strange « file » on the sdcard : remove theses files.

[]{#anchor-105}Impossible to mount a usb key or a sdcard
--------------------------------------------------------

The sdcard must be in FAT32 format

[]{#anchor-106}Screen garbage when i use bank
---------------------------------------------

If you have screen garbage when you switched to ram bank before with
« twil -w »

It means that ram bank are not initialized. See orixcfg section to fix
it

[]{#anchor-107}Pi zero always reboots
-------------------------------------

Check your PSU. If you have a 2A PSU and you have a pi zero, cumulus and
TOM2 connected, you should reach the PSU limits. If you can't get
another PSU, you can disable bluetooth of you pi zero, or you can also
downclock from 1Ghz to 700mhz for example.

You can also use a 3A PSU. In the future, it will be possible to add
another PSU on the board.

[]{#anchor-108}When i start Orix, filesytem is unstable or displays usb controler not found
-------------------------------------------------------------------------------------------

If you have pi zero connected, it could answer to the controler partial
information or could hang the usb controler because controler does not
understand usb data when it sends information to usb port.

You have to wait a bit. If you want to verify this, you can switch off
the oric (and then the pi zero), switch on the oric with Orix, and type
'debug', if you have another value than \#AA for ch376 check exists,
it's the problem, if you do 'debug' another value will be displayed but
not \#AA. In fact, when pi zero boot, usb controler is unstable.

[]{#anchor-109}« I/O Error » is displayed
-----------------------------------------

You can reach this message in some case :

1.  device (sdcard or usbdrive is missing)
2.  after a launch of « df » command : There is an issue, the controler
    is in incorrect state after this command. It's a bug

You can usually fix it by launching « ls » twice. Because « ls » handles
a reset order to the usb controler when it does not produce the correct
answer. It means that if USB controler is not working well, ls displays
the error message and will produce a reset command to the controler. If
you launch ls again, it will work.

[]{#anchor-110}The oric does not work : black screen
----------------------------------------------------

If you have a pi zero connected on usb port, unplug it. Boot the oric,
and now insert pi zero into usb port

[]{#anchor-111}Kernel panic
---------------------------

When kernel can't solve a « free memory kernel call» in a binary, it
could produce a kernel panic. In that case, you need to do a reset.
There is a bug in kernel 2021.1 which could produce this error. It will
be corrected as soon as possible.

[]{#anchor-112}A folder is displayed on my PC but not under my Oric
-------------------------------------------------------------------

Sometimes sdcard or usbkey has bad format for the usb controler and it
can reads some content. Format the usb key or sdcard and install again
all files. Or try another usb key/sdcard

[]{#anchor-113}I have strange behavior when un do csave or cload on basic ROM : It's always the same file event i cload another content
---------------------------------------------------------------------------------------------------------------------------------------

Sometimes sdcard or usbkey has bad format for the usb controler and it
can reads some content. Format the usb key or sdcard and install again
all files. Or try another usb key/sdcard

[]{#anchor-114}Q&A
==================

[]{#anchor-115}I want to change the current directory
-----------------------------------------------------

See « cd » command

[]{#anchor-116}I want to see which bank are loaded into ROM and RAM
-------------------------------------------------------------------

See «bank» section

[]{#anchor-117}I want to read a .dsk file
-----------------------------------------

You can only extract files from a .dsk file (see « dsk-util »)

If you have a cumulus board, you can use « bootfd » and connect your
cumulus on expansion board « see how to connect a cumulus section »

[]{#anchor-118}I can't type anything in basic rom (« basic11 » command)
-----------------------------------------------------------------------

There is a firmware bug on some board which generate a false state for
the third button of a joystick. The easier step to avoid this, is to
connect a joystick to the left port on the board.

The issue can be fixed by upgrading firmware board (it needs to open the
box and program the firmware with Jtag port)

[]{#anchor-119}ANNEXES
======================

[]{#anchor-120}Firmware version
-------------------------------

  --------- ------------------------------------------------------------- ------------
  Version   Features                                                      Known bugs
  1         RAM/ROM switch, ROM programmation, joysticks, usb controler   N/A
  2         Start all sedoric disks from cumulus                          N/A
  --------- ------------------------------------------------------------- ------------

[]{#anchor-121}Upgrade from older version
-----------------------------------------


Upgrade from v2021.4 to v2022.1
---------------------------------------------

If your card is below v2021.4 version, please go to annexes part at the
end of this document, before you try to upgrade to v2022.1

-   Download
    <http://repo.orix.oric.org/dists/official/tgz/6502/sdcard.tgz>
-   untar/gunzip sdcard.tgz (use 7zip under windows) on your device usb
    or sdcard : It could require some time to copy because there is a
    lot of small files (tap, hlp etc)
-   you can start orix on real machine, and type :

    /\#cd usr\
    /usr\#cd share\
    /*usr/share\#cd carts\
    /usr/share/carts\#cd 2022.1*

    If you want to usr usb drive for default device :

    */usr/share/carts/2022.1\#orixcfg -r -s 4 kernelus.r64*

    If you want to use sdcard for default device :

    /usr/share/carts/2022.1\#orixcfg -r -s 4 kernelsd.r64

-   press 'y', and **wait until Orix reboots **

    (Don't switch off the Oric at this step)

Upgrade from v2021.3 to v2021.4
-------------------------------

If your card is below v2021.3 version, please go to annexes part at the
end of this document, before you try to upgrade to v2021.4

-   Download
    <http://repo.orix.oric.org/dists/official/tgz/6502/sdcard.tgz>
-   untar/gunzip sdcard.tgz (use 7zip under windows) on your device usb
    or sdcard : It could require some time to copy because there is a
    lot of small files (tap, hlp etc)
-   you can start orix on real machine, and type :

    /\#cd usr\
    /usr\#cd share\
    /*usr/share\#cd carts\
    /usr/share/carts\#cd 2021.4*

    If you want to usr usb drive for default device :

    */usr/share/carts/2021.4\#orixcfg -r -s 4 kernelus.r64*

    If you want to use sdcard for default device :

    /usr/share/carts/2021.4\#orixcfg -r -s 4 kernelsd.r64

-   press 'y', and **wait until Orix reboots **

    (Don't switch off the Oric at this step)

[]{#anchor-122}Upgrade from v2021.2 to v2021.3
----------------------------------------------

You need to unzip/untar orixcfg new version here :
<http://repo.orix.oric.org/dists/2021.3/tgz/6502/orixcfg.tgz>

-   Download
    <http://repo.orix.oric.org/dists/official/tgz/6502/sdcard.tgz> or
    <http://repo.orix.oric.org/dists/2021.3/tgz/6502/cardridge.tgz>
-   untar/gunzip sdcard.tgz (use 7zip under windows) on your device usb
    or sdcard : It could require some time to copy because there is a
    lot of small files (tap, hlp etc)
-   you can start orix on real machine, and type :

    /\#cd usr\
    /usr\#cd share\
    /*usr/share\#cd carts\
    /usr/share/carts\#cd 2021.3*

    If you want to usr usb drive for default device :

    */usr/share/carts/2021.3\#orixcfg -r -s 4 kernelus.r64*

    If you want to use sdcard for default device :

    /usr/share/carts/2021.3\#orixcfg -r -s 4 kernelsd.r64

-   press 'y', and **wait until Orix reboots **

    (Don't switch off the Oric at this step)

[]{#anchor-123}Optionnal step for upgrade
-----------------------------------------

Now bank displays all banks from l to 64. It means that you should have
some strange bank signature for eeprom. Now an empty set is provided in
*/usr/share/carts/2021.3 *folder. With Orixcfg you can initialize your
set with this cart. Don't use « -s 4 » flag for orixcfg when you want to
load emptyset.

### []{#anchor-124}Upgrade from v2021.1 to v2021.2

If your card is below v2021.1 version, please go to annexes part at the
end of this document, before you try to upgrade to v2021.2

-   Download
    <http://repo.orix.oric.org/dists/official/tgz/6502/sdcard.tgz>
-   untar/gunzip sdcard.tgz (use 7zip under windows) on your device usb
    or sdcard : It could require some time to copy because there is a
    lot of small files (tap, hlp etc)
-   you can start orix on real machine, and type :

    /\#cd usr\
    /usr\#cd share\
    /*usr/share\#cd carts\
    /usr/share/carts\#cd 2021.2*

    If you want to usr usb drive for default device :

    */usr/share/carts/2021.2\#orixcfg -r -s 4 kernelus.r64*

    If you want to use sdcard for default device :

    /usr/share/carts/2021.2\#orixcfg -r -s 4 kernelsd.r64

-   press 'y', and **wait until Orix reboots **

    (Don't switch off the Oric at this step)

### []{#anchor-125}From 2020.4 to 2021.1

Download : <http://repo.orix.oric.org/dists/2021.1/tgz/6502/carts.zip>

Unzip it on your device (sdcard/usbkey)

-   you can start orix on real machine, and type :

    /\#cd usr\
    /usr\#cd share\
    /*usr/share\#cd carts\
    /usr/share/carts\#cd 2021.1*

    If you want to usr usb drive for default device :

    */usr/share/carts/2021.1\#orixcfg -r -s 4 kernelus.r64*

    If you want to use sdcard for default device :

    /usr/share/carts/2021.1\#orixcfg -r -s 4 kernelsd.r64

-   press 'y', and **wait until Orix reboots **

    (Don't switch off the Oric at this step)