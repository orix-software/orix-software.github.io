# Install

## Step 1 : Configure and start oricutron with twilighte board

Build from source code oricutron : [https://github.com/pete-gordon/oricutron](https://github.com/pete-gordon/oricutron)

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

Build it from cc65. You can build your first program in C with cc65 and telestrat target. It builds an Orix binary. This binary can be put in bin/ folder of the device (for oricutron : usbdrive or sdcard folder)

## Step 4 : Download SDK  (mainly for assembly)

Clone [https://github.com/assinie/orix-sdk](https://github.com/assinie/orix-sdk) in your project folder
