---
title: Orix/Twilighte Manual
author: v2022.4.1
date: rev 09/11/2022
---

![](.//Pictures/10000000000003F0000002F4BA33A9E79E8D2E3F.jpg){width="17cm" height="12.749cm"}


\newpage

## EXTRA DOCUMENTATION

===================

Rom loader and firmware twilighte board menu
--------------------------------------------

https://raw.githubusercontent.com/orix-software/systemd/master/doc/pdf/systemd.pdf

[]{#anchor}INTRODUCTION
=======================

[]{#anchor-1}What is new (v2022.4) ?
-------------------------------------

https://orix-software.github.io/update/2022_4/

[]{#anchor-4}General informations
---------------------------------

This documentation must be use when you have installed orix version
**2022.3** (see at the top of the banner on the oric at boot).

On [http://orix.oric.org](http://orix.oric.org/), you will have some
youtube videos links showiint how to use some functionnality.

The board has a firmware version. This firmware can be upgarded see
« Hardware and firmware upgrade » section.

The board can be upgarded too but you have to send it to upgrade the
board see «  Hardware and firmware upgrade » section » too.

The card has a 512KB of eeprom, and 512KB of RAM. This RAM is saved with
a battery. For instance, only bank 4, 3, 2 and 1 can be switched to see
others sets. It's a software limit. In the future, you will be able to
displays all bank and starts any binary from theses banks. If you wants
to change the set, you can use twil command. This command can switch to
eeprom bank or ram bank and can switch to any set.

Some extra devices (TOM2, logitech joypad) are explained a bit in this
manual, but it's not adverts, we don't ear anything:) It explains some
ways to use joystick, others hardware exists in the same way)

[]{#anchor-5}Features
---------------------

-   .tap file fast loading (with multitap files)

<!-- -->

-   Joysticks support for a lot of games on atmos mode
-   the hobbit, defence-force (and others games) works without any
        patch for loading

-   in system : kernel update, roms and ram update (with
    [orixcfg](http://orix.oric.org/command-orixcfg/) binary)
-   2 DB9 Joysticks (atari)
-   512KB of EEPROM (banking mode)
-   512KB of RAM (banking mode)
-   read/write from sdcard (MAX 64GB) or usb drive (mass storage)
-   drag and drop from the PC to the oric : It will be available on the
    oric (with WIFI connexion) : It requires extra hardware with a
    raspberry pi zero
-   fast loading : 46KB per second. A game require less than one second
    to load and start
-   cumulus compatible with the help of an other amplibus board (not
    provided)

[]{#anchor-6}GETTING STARTED
============================

[]{#anchor-7}Content
--------------------

![ Figure1 : Expansion board and reset button](.//Pictures/10000000000003C000000500327D8F1579FF49A0.jpg "fig:"){width="6.08cm" height="8.107cm"}![ Figure 2: Twilighte board](.//Pictures/1000000000000FC000000BD07B912694A61F7F2E.jpg "fig:"){width="10.509cm" height="7.881cm"}
=================================================================================================================================================================================================================================================================================

[]{#anchor-8}Physicals ports
----------------------------

![\
Figure 1: 2 joysticks port : left port and right port, 1 usb
port](.//Pictures/10000000000003E9000002297085C8C49E232E8C.jpg "fig:"){width="8.326cm"
height="4.598cm"}![\
Figure 2: sdcard
port](.//Pictures/10000000000003EE000001D3DAA5DF11D6460212.jpg "fig:"){width="9.181cm"
height="4.262cm"}

[]{#anchor-9}Hardware limits
----------------------------

The usb controler manage FAT32 only. Sdcard and usb key must be
formatted with FAT32 filesystem. If you want to use pi zero gadget
trick, you need to do a mkfs to FAT32 file system.

All tests had been done with samsung evo sdcard and sandisk usb key. A
lot of sdcard works, and we did not see incompatibility with sdcard.

Sdcard controler and usb key controler can work with 32GB storage Max.
But it can handle 64 GB sdcard (tested). It can handle larger sdcard/usb
key reader, but only 32 and 64 GB devices was used.

[]{#anchor-10}Software limits
-----------------------------

The sdcard/usb controler can handle long filename, but Orix handles 8+3
filename only.

[]{#anchor-11}Information about joysticks part
----------------------------------------------

The left port has only 1 button. The right port has 3 buttons. The
joystick pinout is atari pinout. You can use standard DB9 joystick. You
can also plug « TOM2 » hardware (not provided), it can connect a usb
mouse or usb joypad (wireless) to theses ports. For example, logitech
joypad F710 (wireless) works with TOM2.

Please note that TOM2 can only handle 2 buttons. It means that the third
button can't work with TOM2 connected.

![](.//Pictures/1000020100000310000000B48F2DD6FDDF185453.png){width="17cm" height="3.902cm"}
--------------------------------------------------------------------------------------------

{#anchor-12}First boot : Initialize the storage
-------------------------------------------------------------------------------------------------------------------------------------------------

When the card is sent, kernel is built with a default storage. In order
to know which device is the default one, you can type « mount ». You can
only use one device at the same time, but you can swap easily theses
devices from command line.

If you see « sdcard », then sdcard will be read by default. You can
change it, with a command : « twil -u », it will switch to usbdrive. If
you want to have usb drive by default, you can program kernel with the
tool « orixcfg ». See Orixcfg section.

Now, if you know which device you will use by default, you can install
all software on it.

Plug the device on your PC (sdcard or usb key). If you have a pi zero w,
you can do this with drag and drop solution from the PC.

Download sdcard.tgz from this :
<http://repo.orix.oric.org/dists/official/tgz/6502/>

It contains all software for orix there is others which are not
available in this archive.

Now, use 7zip on your PC (or tar/gzip under linux), and unzip all files
from this sdcard.tgz. Put all theses new files in your device root
folder.

Now, you can insert the device (sdcard or usbkey -- or pi zero) in the
twilighte board and play.

![check default storage](.//Pictures/1000020100000280000001CFC6CDA413ADDF6624.png){width="10.659cm" height="7.712cm"}[]

[]{#anchor-13}Upgrade from v2022.4 to v2022.4.1
---------------------------------------------

If your orix version is below v2022.3 version, please go to annexes part at the
end of this document, before you try to upgrade to v2022.4.1

-   Download
    <http://repo.orix.oric.org/dists/official/tgz/6502/sdcard.tgz>
-   untar/gunzip sdcard.tgz (use 7zip under windows) on your device usb
    or sdcard : It could require some time to copy because there is a
    lot of small files (tap, hlp etc)
-   you can start orix on real machine, and type :

    /\#cd usr\
    /usr\#cd share\
    /*usr/share\#cd carts\
    /usr/share/carts\#cd 2022.4*

    If you want to usr usb drive for default device :

    */usr/share/carts/2022.4\#orixcfg -r -s 4 kernelus.r64*

    If you want to use sdcard for default device :

    /usr/share/carts/2022.4\#orixcfg -r -s 4 kernelsd.r64

-   press 'y', and **wait until Orix reboots **

    (Don't switch off the Oric at this step)


[]{#anchor-14}Optionnal step for upgrade
----------------------------------------

Now bank displays all banks from l to 64. It means that you should have
some strange bank signature for eeprom. Now an empty set is provided in
*/usr/share/carts/2021.4 *folder. With Orixcfg you can initialize your
set with this cart. Don't use « -s 4 » flag for orixcfg when you want to
load emptyset.

[]{#anchor-15}First step : type a command
-----------------------------------------

You can access to available command from many ways :

-   From /bin folders, there is binary available on current device, 'ls'
    will show you available commands
-   From banks : type « help -b5 » you will see available commands



\newpage

[]{#anchor-26}Basic10 & Basic11
=====================

Launch
------

Basic10 starts Oric-1 rom with sdcard/usb key support

Basic11 starts Atmos rom with sdcard/usb key support

You can type basic11 or press FUNCT+B to start

[]{#anchor-27}Load a personal .tap file
---------------------------------------

When you starts basic11 commands, the default path is
*« /home/basic11/ ». Each action on the basic11 mode will be done in
this folder (cload/csave). If you cload a tape file, it must be in
« /home/basic11 » folder.*

![](.//Pictures/1000000000000280000001CEBA336B5CD12B9A19.png){width="7.544cm" height="5.447cm"}

You have downloaded a .tap file, and want to use it.
Then, you can create a folder /*home*/basic11/

Under Orix

/\#mkdir home\
/\#cd home\
/home\#mkdir basic11\
/home\#cd basic11

Put you file in this folder from your PC, and start basic11 (you don't
need to be in the «/home/basic11 » folder to start basic11 with no
parameter. By default, basic11 starts in « /home/basic11/ »

[]{#anchor-28}Oric.org tape file
--------------------------------

When you downloaded sdcard.tgz and unzip it into sdcard or usbkey
device, there is many tape file included in this archive. You don't need
to move these type file, if you know the key, you can starts it from
commands line. In this case, it will load the correct basic1.1 rom to
start the tape file (see below), and the correct joystick configuration
if it's correct.

[]{#anchor-29}Oric.org tape file update
---------------------------------------

Each week a new software.tgz is generated. You can download it from
« repo » and unzip it on the device. It will generate last tape file and
last joysticks configuration.

[]{#anchor-30}Search a tape file from command line
--------------------------------------------------

![](.//Pictures/1000000000000280000001D0A6B6EC50CAE741F0.png){width="7.304cm" height="5.398cm"}[]{#anchor-31}

Basic11 has also many.tap files inserted in sdcard.tgz

Try to find the software with option -l

/\# basic11 -l

If you find your software, you can do perform **ctrl+c.**

You can type space to do a pause.

On that case, you can launch the tape file like :

/\# basic11 «KEYDISPLAYED

When KEYDISPLAYED is the key displayed in key column. Please note that
the key must be in **UPPERCASE**

[]{#anchor-32}Load a tap file from command line
-----------------------------------------------

Note that MYFILE must be in **UPPERCASE**

/\# basic11 «MYFILE

If MYFILE is in the oric.org database, it will launch the software with
the filename MYFILE.

If basic11 command does not find MYFILE in the oric.org database, it
will try to load it from /home/basic11/ folder.

[]{#anchor-33}Save your program 
--------------------------------

\
If you start « basic11 » with no options, basic rom will starts and each
csave (or cload) actions will store files in « /*home/basic11 » folder*

[]{#anchor-34}Start basic11 menu
--------------------------------

![](.//Pictures/1000020100000280000001CF0A8D4A0E098A9D66.png){width="7.384cm"height="5.341cm"}

If you type « basic11 -g » on command line or FUNCT+G,
you will have a menu with all software which have a download link on
oric.org (only atmos version and when a tape file is available).

/\#basic11 -g

You can use left and right letters to change to a new letter. If the
letter is empty, it means that there is no available tap file for this
letter.

You can use up and down link to navigate into software. If you press
enter, the software will starts.

Note that not all games are working yet. Some times, chars are
corrupted. If the joysticks does not works, there is two case :

-   the game does not call rom routine to manage keyboard
-   keyboard mapping is not done yet

You can use arrows to navigate into the menu :

-   up and down to select the software
-   right and left to switch to the menu letters

Some letters are empty. It means that there is no software with tape
file available on oric.org for this letter

[]{#anchor-35}Quit basic11
--------------------------

If you want to quit basic11 from interpreter command line, you can type
« QUIT ». This will force to reboot to Orix (you can also use reset
button)

[]{#anchor-36}How the .tap file starts
--------------------------------------

If you only type « basic11 », this will start bank 6 (normal basic rom).
The default folder in that case is «/*home/basic11 »*

If you type « basic11 » with a tape file as an argument, there is 2
cases

1.  The tape file (key) is already known in oric.org website, then
    basic11 try to find it in its databank file (/var/cache/basic11/
    folder). If the key is found, it will start the tape file located in
    «/usr/share/basic11/\... »
2.  If the key is unknown, it will try to find it in «/home/basic11 »

If the tap file is in the oric.org db file, basic11 will load the
software configuration from the db software file (as joystick
configuration, and the id of the rom). Basic11 load the right rom into
ram bank, override the default basic11 path to the tape file folder
(« *usr/share/basic11/\[firstletter software\]. *

It means that if you load this kind of software and you can quit the
software, each file action in basic11 rom, will be performed in
«  usr/share/basic11/\[firstletter software\]. »

[]{#anchor-37}Not working tapes (for instance)
----------------------------------------------

-   All Oric-1 games can be started with FUNCT+L in ROM menu : start
    oric-1 (depending of your device), and put .tap files in
    /home/basic10
-   Software which does not work (25), but the number can be reduced in
    future release.

  ----------------------------- --------------------- ------------------------------------------------------------
  cobra                         Cobra pinball         Damsel in distress
  Rush hour 4K
  Le diamant de l'ile maudite   Durendal              HU\*BERT
  Hunchback                     Schtroumpfs           Stanley (ROM 0,1 tested)
  Them                          Titan                 Visif
  Xenon III                     Dig Dog               Elektro Storm
  Kilburn Encounter             Le tresor du pirate   L'aigle d'or (ROM 0,1 tested)
  Compatible (micropuce)        Volcanic demo         Clavidact
  DAO Cobra Soft                CW-Morse              The Hellion
  MARC                          Caspak                Kryllis : when we lost one life, the game does not restart
  ----------------------------- --------------------- ------------------------------------------------------------

[]{#anchor-38}Tape with altered charset
---------------------------------------

  ------------ ------------ -------------------------
  Fire flash   Scuba Dive   3D fongus (i,f letters)

  ------------ ------------ -------------------------

[]{#anchor-39}Joysticks issues
------------------------------

We did keyboard/joystick mapping for a lot of games, but we did not set
the keyboard mapping for all software. If you want to help us, contact
us.

Some game does not work because they handle their own keyboard routine.
It could be handle with hardware tricks but, it's not done.

Some others games uses special keys (SHIFT, CTRL) for direction or the
first button. Theses cases are not handle yet : but it could in the
future.


\newpage
\newpage

404: Not Found\newpage

404: Not Found\newpage

# bank

## Introduction

Bank command is command line tool to see which bank are loaded into EEPROM bank and RAM bank. Each bank has a
"signature". Bank allows to see theses banks.
Bank can also starts a ROM with his id. In that case, you don’t need to have a rom "orix friendly" and you can start it
from command line. In the current bank version, there is restriction to launch a command.

## SYNOPSYS

### List all bank (when ROM signature is valid)

/#bank
Bank 1 to 32 is eeprom bank and bank 33 to 64 are ram bank

### Displays all signature even when ROM is not valid

/#bank

### List all commands from a bank

/#help -b5

### Start a specific bank

/#bank 1

If you need to load a rom into a bank, you need to have a look to orixcfg binar

## DESCRIPTION

This command displays bank when the command is called without parameter. WIth a parameter, you can switch to a the id of the bank passed to the argument :

bank : displays all the bank (if a signature is found)
bank 4 : switch to bank 4
bank -a : displauys all bank (empty bank too)

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/bank.asm
\newpage

404: Not Found\newpage

404: Not Found\newpage

# Command: bootfd

## Starts microdisc bootsector

bootfd is a tool to boot the boot sector when a drive is connected.
Insert a disk and type :

/#bootfd

The binary is located to bin folder. It will load microdisc rom and
start it. If the binary displays that it does not found microdis.rom,
then place microdis.rom file in the right folder.

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
\newpage

404: Not Found\newpage

# cat

## Introduction

 Display a file to the screen

## SYNOPSYS

+ cat FILENAME

## NOTES

Displays content of the FILENAME

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/cat.asm
\newpage

# cd

## Introduction

Change directory

## SYNOPSYS

+ cd DIRECTORY

## EXAMPLES

+ cd /usr/bin
+ cd ..
+ cd /

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/cd.asm
\newpage

# Command: cksum

### checksum utility

## SYNOPSYS
+ cksum file [...]
+ cksum @batchfile
+ cksum -h

## EXAMPLES
+ cksum /bin/cksum

## DESCRIPTION
checksum and count the bytes in a file

## OPTIONS
*  -h
                show this help message and exit

## SOURCE
https://github.com/orix-software/cksum

![](.//Pictures/1000020100000281000001CFDD8EF28C17D2A206.png){width="7.685cm" height="5.595cm"}
\newpage

# clear

## Introduction

Clear the screen

## SYNOPSYS

+ clear

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/clear.asm
\newpage

# cp

## Introduction

 Copy a file to another file

## SYNOPSYS

+ #cp from to

## DESCRIPTION

Copy a file to another. Only 40KB can be copied. It's a software limit. cp tries to allocate 40KB, if there is not enough memory it displays Out of memory.

## EXAMPLES

+ cp from.txt to.txt

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/cp.asm
\newpage

# df 

Displays storage device informations
![](.//Pictures/1000000000000283000001D12D928D88479E7F83.png){width="17cm" height="12.293cm"}
\newpage

# Command: dsk-util

### Disk image utility

## SYNOPSYS
+ dsk-util -f|-s file.dsk
+ dsk-util -h

## EXAMPLES
+ dsk-util -f ftdos.dsk
+ dsk-util -s sedoric3.dsk

## DESCRIPTION
**dsk-util** display the directory of a disk image file.

## OPTIONS
*  -h
                show this help message and exit
*  -f
                FTDOS disk image
*  -s
                Sedoric disk image

## SOURCE
https://github.com/orix-software/dsk-util

\newpage

# echo

## Introduction

Display a message

## SYNOPSYS

+ #echo hello

## DESCRIPTION

Display a message

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/echo.asm
\newpage

# env

## Introduction

Displays env variables

## SYNOPSYS

+ #env

## DESCRIPTION

Displays env variables. It can't be used in command line or shell script for instance

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/env.asm
\newpage

# Command: forth

Launch forth for Orix

## SYNOPSYS
+ forth

## DESCRIPTION

**Forth** is a language based on teleforth (telestrat). You can type **VLIST** to list all words. If you need to switch to hires, you can type **GRAFX** and **HIRES**. If you need to switch to text: **GRAFX** and **TEXT**


You can use forth language. It works the same ways than Tele forth (it's
teleforth but it write file on sdcard/usbdrive).

You can download Teleforth langage in order to see how to program in
forth.

When you type « forth » forth starts with the current folder directory.

If you were in /, forth will load and save file in this folder.

In others cases, you can create a forth folder in home and goes into it
in forth for example :

* mkdir home
* #cd home
* #mkdir forth
* forth

if you type « cd forth» in forth environnement, all files actions will
be perform in « /*home/*forth »

## SOURCE

https://github.com/assinie/Tele-Forth
\newpage

# Ftdos

## Introduction

ftdos command starts ftdos .dsk file without jasmin floppy disc controler. It's a beta version.

## Usage

To start a .dsk file

/#ftdos mydsk

To display the ftdos command version :

/#ftdos -v

ftdos disks must be present in /home/basic11/dsk/

## Informations

* Write on .dsk file is not supported
* refers to ftdos manual for usages
* you need to switch off/on the oric when you reset into ftdos mode, because there is a bug when we reset during ftdos mode. Ftdos does not load and reboot into Orix
\newpage

# Command: grep

### grep utility

## SYNOPSYS
+ grep [-ncisw] string filename
+ grep -h

## DESCRIPTION
**grep** display all lines of a text file that contain a string.

## OPTIONS
*  -h^GDisplay command syntax
*  -n^GShow line numbers
*  -c^GCount only the matching lines
*  -i^GIgnore case
*  -w^GString can use wildcards *, ?, ^ and $
*  -s^GSilent mode

## EXAMPLES
+ grep error menu.sub
+ grep -n "level 1" menu.sub
+ grep -i ERROR menu.sub
+ grep -ni 'level 2' menu.sub
+ grep -w '\*lev?? 2\*'menu.sub
+ grep -w '^if' menu.sub
+ grep -w 'error$' menu.sub
+ grep -w 'if*level ??' menu.sub

## SOURCE
https://github.com/orix-software/grep

\newpage

# help

## Introduction

Display commands

## SYNOPSYS

+ help

## DESCRIPTION

- No parameter : Displays all internals shell command
- bX parameter : Displays all internals commands in bank X

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/help.asm
\newpage

# Command: hexdump

### hexdump utility

## SYNOPSYS
+ hexdump file

## EXAMPLES
+ hexdump /bin/hexdump

## DESCRIPTION
Display file contents in hexadecimal.
You can use [SPACE] to pause the display ou [CTRL]+C to abort.

## SOURCE
https://github.com/orix-software/hexdump

![](.//Pictures/1000020100000280000001D2140A361B5ADFEDE0.png){width="7.685cm" height="5.595cm"}
\newpage

# ioports

## Introduction

Display I/O Ports of the board

## SYNOPSYS

+ #ioports

## DESCRIPTION

Displays I/O ports.

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/ioports.asm
\newpage

# ls

## Display catalog

List all the file in the current folder. Token are supported (*,?) ex : « ls ?e.tap » will list all files with a ‘e ’ in the
second letter

## SYNOPSYS

list all the files in the current folder

+ ls

List all *.tap files

+ ls *.tap

List size and datetime of the file
+ ls -l

## DESCRIPTION

Directories are in ^FBLUE^G color. It  manages '-l' and Pattern works in different ways : ls *.tap

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/ls.asm
\newpage

# lscpu

## Introduction

Displays cpu info. It detects : 6502, 65c02 and 65816

## SYNOPSYS

+ #lscpu

## DESCRIPTION

Displays cpu info

## EXAMPLES

+ lscpu

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/lscpu.asm
\newpage

# lsmem

## Introduction

 Displays malloc table

## SYNOPSYS

+ #lsmem

## DESCRIPTION

Displays malloc table. Free chunks and busy chuncks are displayed with ranges.

## EXAMPLES

+ lsmem

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/lsmem.asm
\newpage

# man

## Introduction

display manual pages

## SYNOPSYS

+ man lsmem

## DESCRIPTION

Displays manual. All .hlp files are located in /usr/share/man/. It manages multiples text screen (if .hlp is bigger than a screen when space is pressed, it switch to next page).

## Keys

* SPACE to switch to next page

* ESC to exit

## EXAMPLES

+ man ls

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/man.asm
\newpage

# mkdir

## Introduction

Create a folder

## SYNOPSYS

+ /#mkdir PATH

## DESCRIPTION

Create a folder. -p (recursive mode) option is not available

## EXAMPLES

+ mkdir /opt

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/mkdir.asm
\newpage

# mount

## Introduction

Displays mounts

## SYNOPSYS

+ #mount

## DESCRIPTION

Displays mount (usb key or sdcard)

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/mount.asm
![](.//Pictures/1000020100000280000001CFC6CDA413ADDF6624.png){width="7.685cm" height="5.595cm"}
\newpage

# otimer

## Introduction

Display timer since the Oric is power on

## SYNOPSYS

+ otimer

## NOTES

Each time Oric reboots, this timer is reset

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/otimer.asm
\newpage

# pwd

## Introduction

 Display the current path

## SYNOPSYS

+ pwd

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/pwd.asm
\newpage

# ps

## Introduction

Displays process list

## SYNOPSYS

+ #ps

## DESCRIPTION

Displays process list

## EXAMPLES

+ ps

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/ps.asm
\newpage

404: Not Found\newpage

# reboot

## Introduction

 reboot machine

## SYNOPSYS

+ reboot

## DESCRIPTION

Reboot the machine: it call NMI VECTORS and flush page 2 and page 0

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/reboot.asm
\newpage

# rm

## Introduction

remove file

## SYNOPSYS

+ /# rm /myfile

## DESCRIPTION

rm file or directory. For instance, rm can only remove file in root folder, relative arg does not work yet

## EXAMPLES

+ rm /myffile

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/rm.asm
\newpage

# sh

## Introduction

When kernel has finished to initialize at boot time, sh command is started in interactive mode

## Interactive mode

*Esc-b* : move cursor at the beginning of the previous word

*Esc-f* : move cursor at the end of the next word

*Esc-l* : switch current word into lowercase, and put cursor at the end of the word

*Esc-u* : switch current word into uppercase, and put cursor at the end of the word

*Ctrl-a* : move cursor at the beginning of the line

*Ctrl-e* : move cursor at the end of the line

*Ctrl-c* : cancel current line

*Ctrl-k* : delete the end of the line

*Ctrl-l* : clear screen, and displays the line, the cursors keeps his position

*Ctrl-u* : clear the line and put cursor at the beginning of the line

*Ctrl-t* : swap char under the cursor with the previous one, and shift the cursor to the right

*Ctrl-o* : Switch into replacement or insertion mode

## Shortcuts for tools

*Funct+T* : Start Twilighte setup

*Funct+L* : Start Loader

*Funct+B* : Start Basic11

*Funct+G* : Start basic11 gui

## Available commands

The command line is limited in characters (37). If you reach this limit, you won’t be able to type the complete command line Known bugs

* « ./ » can not be used to launch a binar
\newpage

# twil

## Introduction

Twil command can displays the current firmware of twilighte card, and
can swap root folder to usbkey or sdcard.

## SYNOPSYS

+ /#twil -f  : displays Twilighte board firmware
+ /#twil -u  : switch default device : usbdrive
+ /#twil -s  : swap default device to : sdcard

## DESCRIPTION

## SOURCE

https://github.com/orix-software/shell/blob/master/src/commands/twil.asm
\newpage

[]{#anchor-65}MONITOR
=====================

[]{#anchor-66}Usage
-------------------

Monitor is a rom which can displays a monitor. It's teleass without
assembler part.

\newpage

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

![](.//Pictures/10000000000004A9000002B630F032C016A16F4A.png){width="17cm" height="9.888cm"}

If on your Oric screen, it's not the same value, you can update it. The
sequence of the Orix release is Year.X. There is 4 releases a year, and
each one must be done until you reach the final one, in order to avoid
some case. If your version is v2020.3 and the last available version is
v2021.4. You need to update to v2020.4, then v2021.1, v2021.2, v2021.3,
v2021.4, v2022.1, v2022.4

It's maybe possible to jump to version v2022.3, but it's at your own
risk because there is a « chance » that some kernel calls changed, and
orixcfg could do wrong step.

[]{#anchor-69} Update kernel, shell
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

\newpage


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

\newpage

[]{#anchor-77}PWD
=================

[]{#anchor-78}Introduction
--------------------------

Displays current PWD

\newpage

[]{#anchor-79}SHA1
==================

[]{#anchor-80}Usage
-------------------

Sha1 is a tool to displays a string into sha1 encoding

\newpage

[]{#anchor-81}STORMLORD
=======================

[]{#anchor-82}Introduction
--------------------------

Stormlord is Stormlord game port to Orix. You can use joysticks to plays
to this game.

[]{#anchor-83}Only one joystick port is working on this version
===============================================================

\newpage

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
\newpage

# Command: submit

### submit utility

## SYNOPSYS
+ submit file [arg...]

## EXAMPLES
+ submit help.sub

## DESCRIPTION
**submit** is a command language interpreter that executes commands read from a file.

## OPTIONS
*  no options

## SOURCE
https://github.com/orix-software/submit

\newpage

# Command: untar

### untar utility

## SYNOPSYS
+ untar -t[v]f tarfile
+ untar -x[v]f tarfile

## EXAMPLES
+ untar -tf /home/test.tar

## DESCRIPTION
**untar** list and extract files in a TAR archive

## OPTIONS
*  -h ^Bshow this help message and exit
*  -t ^Blist files
*  -x ^Bextract files
*  -v ^Bverbose mode

## SOURCE
https://github.com/orix-software/untar

\newpage

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

\newpage

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


[]{#anchor-200}Garbage on basic screen
---------------------------------------------------------------------------------------------------------------------------------------

When you start altered charset on screen when you start basic11 command (or funct+T), download again basic.tgz here : http://repo.orix.oric.org/dists/official/tgz/6502/

untar and unzip it on your device, it should fix this : the charset.chs file had been altered

\newpage

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

\newpage

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

Upgrade from v2022.1 to v2022.3
---------------------------------------------

If your orix version is below v2022.1 version, please go to annexes part at the
end of this document, before you try to upgrade to v2022.3

-   Download
    <http://repo.orix.oric.org/dists/official/tgz/6502/sdcard.tgz>
-   untar/gunzip sdcard.tgz (use 7zip under windows) on your device usb
    or sdcard : It could require some time to copy because there is a
    lot of small files (tap, hlp etc)
-   you can start orix on real machine, and type :

    /\#cd usr\
    /usr\#cd share\
    /*usr/share\#cd carts\
    /usr/share/carts\#cd 2022.3*

    If you want to usr usb drive for default device :

    */usr/share/carts/2022.3\#orixcfg -r -s 4 kernelus.r64*

    If you want to use sdcard for default device :

    /usr/share/carts/2022.3\#orixcfg -r -s 4 kernelsd.r64

-   press 'y', and **wait until Orix reboots **

    (Don't switch off the Oric at this step)


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


[]{#anchor-123}Upgrade from v2021.1 to v2021.2

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

[]{#anchor-125}From 2020.4 to 2021.1

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



[]{#anchor-200}Optionnal step for upgrade
-----------------------------------------

Now bank displays all banks from l to 64. It means that you should have
some strange bank signature for eeprom. Now an empty set is provided in
*/usr/share/carts/2021.3* folder. With Orixcfg you can initialize your
set with this cart. Don't use « -s 4 » flag for orixcfg when you want to
load emptyset.