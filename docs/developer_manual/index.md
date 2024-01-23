# Installation for developpers

There is two ways to develop : Oricutron and cross dev with test on real computer

## Step 1 : Download the oricutron archive with all things set

Build from source code oricutron : [https://github.com/pete-gordon/oricutron](https://github.com/pete-gordon/oricutron) or download last windows binaries : [https://raxiss.com/article/id/25-Oricutron-For-Developers](https://raxiss.com/article/id/25-Oricutron-For-Developers)

## Step 2 : get main rom (kernel and shell)

* Download kernel : [http://repo.orix.oric.org/dists/official/tgz/6502/kernel.tgz]([http://repo.orix.oric.org/dists/official/tgz/6502/kernel.tgz]) and store it in "roms/" oricutron folder
* Download shell : [http://repo.orix.oric.org/dists/official/tgz/6502/shell.tgz]([http://repo.orix.oric.org/dists/official/tgz/6502/shell.tgz]) and store it in "roms/" oricutron folder
* Download basic rom: [http://repo.orix.oric.org/dists/official/tgz/6502/shell.tgz]([http://repo.orix.oric.org/dists/official/tgz/6502/basic.tgz]) and store it in "roms/" oricutron folder

## Step 3 : Configure oricutron with twilighte board activated

In oricutron.cfg, you have just to set the right parameter to start oric with the board emulated

``` ca65
ch376 = yes
twilighte_board = yes
```

in "plugins/twilighte_board/twilighte.cfg", the minimal rom must be set as :

```bash
twilbankrom07='roms/kernel'
twilbankrom06='roms/basicsd2'
twilbankrom05='roms/shell'
```

## Step 4 : start oricutron

Starts oricutron, if everything is OK, Orix starts, if you have missing rom at boot, modify plugins/twilighte_board/twilighte.cfg in order to replace wrong ROM.

there is 2 folders on oricutron: sdcard and usbdrive, in orix type "/#mount", if usb is shown, then "usbdrive/" folder is the main folder.

Under Linux, all filenames must be uppercases (folder and files), it's mainly because emulation rescpect FAT32 specs in the sdcard/usbdrive chip

!!! info "SDCARD folder in oricutron is the root of the storage, under linux, all binary must be in uppercase!"

## Step 5 : Download/build cc65

Build it from cc65. You can build your first program in C with cc65 and telestrat target. It builds an Orix binary. This binary can be put in bin/ folder of the device (for oricutron : usbdrive or sdcard folder)

## Step 5 : Download SDK  (mainly for assembly)

Clone [https://github.com/assinie/orix-sdk](https://github.com/assinie/orix-sdk) in your project folder

## Step 6 : Develop a binary

This link is a template project to start a binary in assembly : [https://github.com/assinie/new-project](https://github.com/assinie/new-project)
