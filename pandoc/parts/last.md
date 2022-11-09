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