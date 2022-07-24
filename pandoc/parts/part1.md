---
title: Orix/Twilighte Manual
author: v2022.4
date: (rev 20/07/2022)
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

[]{#anchor-1}What is new (v2022.3) ? 
-------------------------------------

FIXME

[]{#anchor-4}General informations
---------------------------------

This documentation must be use when you have installed orix version
**2021.4** (see at the top of the banner on the oric at boot).

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

-   -   Joysticks support for a lot of games on atmos mode
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

![](.//Pictures/1000020100000280000001CFC6CDA413ADDF6624.png){width="10.659cm" height="7.712cm"}[]{#anchor-12}First boot : Initialize the storage
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

[]{#anchor-13}Upgrade from v2022.1 to v2022.3
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


[]{#anchor-14}Optionnal step for upgrade
----------------------------------------

Now bank displays all banks from l to 64. It means that you should have
some strange bank signature for eeprom. Now an empty set is provided in
*/usr/share/carts/2021.3 *folder. With Orixcfg you can initialize your
set with this cart. Don't use « -s 4 » flag for orixcfg when you want to
load emptyset.

[]{#anchor-15}First step : type a command
-----------------------------------------

You can access to available command from many ways :

-   From /bin folders, there is binary available on current device, 'ls'
    will show you available commands
-   From banks : type « help -b5 » you will see available commands


\newpage

[]{#anchor-16}BANK
==================

[]{#anchor-17}Usage 
--------------------

Bank command is command line tool to see which bank are loaded into
EEPROM bank and RAM bank. Each bank has a « signature ». Bank allows to
see theses banks.

Bank can also starts a ROM with his id. In that case, you don't need to
have a rom « orix friendly » and you can start it from command line. In
the current bank version, there is restriction to launch a command.

[]{#anchor-18}List all bank (when ROM signature is valid)
---------------------------------------------------------

/\#bank

Bank 1 to 32 is eeprom bank and bank 33 to 64 are ram bank

[]{#anchor-19}Displays all signature even when ROM is not valid
---------------------------------------------------------------

/\#bank

[]{#anchor-20}List all commands from a bank 
--------------------------------------------

/\#help -b5

[]{#anchor-21}Start a specific bank
-----------------------------------

/\#bank 1

If you need to load a rom into a bank, you need to have a look to
orixcfg binary.

\newpage

[]{#anchor-22}SHELL
===================

[]{#anchor-23}Flush the current command line 
---------------------------------------------

Ctrl+c

[]{#anchor-24}Available commands
--------------------------------

You can see available commands with this command :

/\#help -b5

The command line is limited in characters. If you reach this limit, you
won't be able to type the complete command line

[]{#anchor-25}Known bugs
------------------------

*  « ./ » can not be used to launch a binary

\newpage

[]{#anchor-26}BASIC11
=====================

Launch
------

You can type basic11 or press FUNCT+B to start

[]{#anchor-27}Load a personal .tap file
---------------------------------------

When you starts basic11 commands, the default path is
*« /home/basic11/ ». Each action on the basic11 mode will be done in
this folder (cload/csave). If you cload a tape file, it must be in
« /home/basic11 » folder.*

![](.//Pictures/1000000000000280000001CEBA336B5CD12B9A19.png){width="7.544cm"
height="5.447cm"}You have downloaded a .tap file, and want to use it.
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

![](.//Pictures/1000000000000280000001D0A6B6EC50CAE741F0.png){width="7.304cm"
height="5.398cm"}[]{#anchor-31}Basic11 has also many.tap files inserted
in sdcard.tgz

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

![](.//Pictures/1000020100000280000001CF0A8D4A0E098A9D66.png){width="7.384cm"
height="5.341cm"}If you type « basic11 -g » on command line or FUNCT+G,
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

[]{#anchor-40}Software update changelog
---------------------------------------

You need to download software.tgz in the official repo for :

-   Mr wimpy added to the archive (takes effect 20/01/2021)
-   Airfox added to the archive (takes effect 20/01/2021)
-   Atlantid added to the archive (takes effect 20/01/2021)
-   Centrale nucléaire added to the archive (takes effect 20/01/2021)
-   Cobra invaders added to the archive (takes effect 20/01/2021)
-   Coctail Recipies added to the archive (takes effect 20/01/2021)
-   Crusher added to the archive (takes effect 20/01/2021)
-   Death Driver added to the archive (takes effect 20/01/2021)
-   Challenge voile added to the archive (takes effect 20/01/2021)
-   Breakout 1K added to the archive (takes effect 20/01/2021)
-   DAO added to the archive (takes effect 20/01/2021)
-   echecs asn
-   dialogue

« added to the archive » means that you need to download softwares.tgz
from the repo after the displayed date to get it in the archive

\newpage

[]{#anchor-41}BOOTFD
====================

[]{#anchor-42}Introduction
--------------------------

bootfd is a tool to boot the boot sector when a drive is connected.
Insert a disk and type :

/\#bootfd

The binary is located to bin folder. It will load microdisc rom and
start it. If the binary displays that it does not found microdis.rom,
then place microdis.rom file in the right folder.

If you have firmware 1, you will be able to load « blake's 7 ». If you
have firmware 2, all sedoric .dsk should start.

For instance, only Space99 does not work, it stops after intro.

\newpage

[]{#anchor-43}CKSUM
===================

![](.//Pictures/1000020100000281000001CFDD8EF28C17D2A206.png){width="8.334cm" height="6.02cm"}[]{#anchor-44}Usage
-----------------------------------------------------------------------------------------------------------------

Cksum is a tool to compute a checksum of a file and displays its size.

\newpage

[]{#anchor-45}DF
================

[]{#anchor-46}Usage
-------------------

It displays available blocks on current device

![](.//Pictures/1000000000000283000001D12D928D88479E7F83.png){width="17cm"
height="12.293cm"}

\newpage

[]{#anchor-47}DSK-UTIL
======================

[]{#anchor-48}Introduction
--------------------------

This tool is useful to extract files from dsk file. You can extract it,
and uses command line tool to use it. For example, if you extract a
basic program (.bas in FTDOS .dsk file), you can see it with « list »
binary. If it's a .hrs/.hir file, you can read it with viewhrs file.

You can create a «/*home/sedoric/ » *folder and adds .dsk sedoric files
in this folder

Some .dsk files are imported in sdcard.tgz. For sedoric, you can have a
look to «/usr/share/sedoric/ » and for ftdos : « */usr/share/ftdos »*

[]{#anchor-49}List files from .dsk (sedoric)
--------------------------------------------

/home/sedoric\# dsk-util -s ls sed.dsk

[]{#anchor-50}Extract a file from sedoric .dsk file
---------------------------------------------------

/home/sedoric\# dsk-util -s e sed.dsk myfile.hrs

[]{#anchor-51}Extract only .hrs files from sedoric .dsk file
------------------------------------------------------------

/home/sedoric\# dsk-util -s e sed.dsk \*.hrs

\newpage

[]{#anchor-52}FORTH
===================

[]{#anchor-53}Use forth
-----------------------

You can use forth language. It works the same ways than Tele forth (it's
teleforth but it write file on sdcard/usbdrive).

You can download Teleforth langage in order to see how to program in
forth.

When you type « forth » forth starts with the current folder directory.

If you were in /, forth will load and save file in this folder.

In others cases, you can create a forth folder in home and goes into it
in forth for example :

/\#mkdir home\
/\#cd home\
/\#mkdir forth\
/\#forth

if you type « cd forth» in forth environnement, all files actions will
be perform in « /*home/*forth »
