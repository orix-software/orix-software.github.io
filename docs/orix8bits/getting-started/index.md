# Getting started

## Step 1 : Configure and start oricutron with twilighte board

Build from source code oricutron : https://github.com/pete-gordon/oricutron

In oricutron.cfg, you have just to set the right parameter to start oric with the board emulated

``` ca65
ch376 = yes
twilighte_board=yes
```

plugins/twilighte_board/twilighte.cfg you can put any rom you want.

## Step 2 : start oricutron

Starts oricutron, if everything is OK, Orix starts, if you have missing rom at boot, modify plugins/twilighte_board/twilighte.cfg in order to replace wrong ROM.

there is 2 folders on oricutron: sdcard and usbdrive, in orix type "/#mount", if usb is shown, then usbdrive/ folder is the main folder.

Under Linux, all filenames must be uppercases (folder and files), it's mainly because emulation rescpect FAT32 specs in the sdcard/usbdrive chip

## Step 3 : Download/build cc65

Build it from cc65

## Step 4 : Download SDK  (mainly for assembly)

Clone https://github.com/assinie/orix-sdk in your project folder 


## Some informations : Banking management

firmware version 1


$342 : twilighte board register

    b0,b1,b2 version number is equal to 1, but can be overwritten (There is not read only protection
	    b5 : if it's equal to 0 if we are on eeprom set, 1 if it's ram set

		There is a register on board with says if we show ram or eeprom on the oric. (b5).

		There is another register ($321)  with b0,b1, b2 which can select the id of the bank wanted.

		And there is another register to select bank set ($343).

		When you start, you have only 7 banks available :
		bank 7 : kernel
		bank 6 : basic11 (modified to work with sdcard or usb key)
		bank 5 : shell

		Theres banks can't be switches and are always shown.
		You have now :
		bank 4: what you want
		bank 3: what you want
		bank 2: what you want
		bank 1: what you want

		But theses banks can be switches to others set banking RAM or ROM

		If you want to switch to bank 4 (hardware) you have to do in main ram, but there is also vectors) :

		sei
		lda #$04
		sta $321
		cli
		; $C000 to $FFFF will be on bank 4 on eeprom bank because we did not set any others registers)

		if you want to switch to RAM bank :

		sei
		lda $342
		ora #%00100000 ; switch to ram set
		sta $342
		lda #$04 ; switch to bank set of ram bank
		sta $321
		cli

		if you want to switch to antoher set RAM bank :


		sei
		lda #$01 ; set 1 instead of current set at boot (0)
		sta $343
		lda $342
		ora #%00100000 ; switch to ram set
		sta $342
		lda #$04 ; switch to bank set of ram bank
		sta $321
		cli

		You can build oricutron from git and in oricutron.cfg, you have just to set the right parameter

		ch376 = yes
		twilighte_board=yes

		and in https://github.com/pete-gordon/oricutron/blob/master/plugins/twilighte_board/twilighte.cfg you can put any rom you want.
