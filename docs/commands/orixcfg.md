---
comments: true
---
# orixcfg

## Introduction

Update kernel, shell: orixcfg

When a new released is done, you can update the eeprom with the new kernel and new roms.

If you want to know if you need to update the kernel, you can compare your current version, and the last release version. You can go to [http://orix.oric.org](http://orix.oric.org/)

The sequence of the Orix release is 'YYYY.X' (Year + release in the year). There is 4 releases a year, and each one must be done until you reach the final one, in order to avoid some case. If your version is v2020.3 and the last available version is v2023.1. You need to update to v2020.4, then v2021.1, v2021.2, v2021.3, v2021.4, v2022.1, v2022.4 and v2023.1.

It's maybe possible to jump to version v2022.3, but it's at your own risk because there is a "chance" that some kernel calls changed, and orixcfg could do wrong step.

When you need to update kernel, you can update it with orixcfg. You just need to define set 4 on the command line. This step is very **dangerous** if you don't load the right file. There is no verification and any file on the command line will be load in the kernel set.

Usually, kernel set file is named kernxxxx.r64.

If you did something wrong on this step, you won't be able to start orix again. It means that you will need to remove eeprom from the card and program it with a eeprom programmer.

This next command will load kernel.r64 to kernel set. Please wait until Orix reboots. If you have a kernel 2020.3 and you need to load a kernel 2021,1, you will need to load previous kernel set before the update of 2021.1.

.r64 extension means that it's a 64KB set. It's usually used to define that the file contains 4 roms of 16KB.

Please note that we provide 2 kernels version. One named "kernelsd.r64" which means that the default device will be sdcard, and the other one "kernelus.r64" which means that default device will be "usb" (usbkey). If you load the wrong kernel at this step, you can use twil command to switch to the right device, and you can start again kernel update with the right file (kernelsd.r64 or kernelus.r64 depending of your configuration).

## Update kernel

```code
orixcfg -k kernelsd.r64
```

"orixcfg -r -s 4 file.r64" is no longer supported for kernel update. -k flag only will manage kernel .r64 files. -k flag verify if file pased on command line is correct or not for kernel.

## Load a ROM into a ram slot

Space between values and switches are not optionnal, orixcfg needs theses spaces.

```code
orixcfg -b XX -l myrom.rom
```

This command will load myrom.rom (in the current path), in RAM bank XX.

Older usage as : orixcfg -r -s X -b Y myrom.rom is no longer included in orixcfg since orixcfg v2021.3

## Load a set of ROM into ROM slot

```code
orixcfg -r -s 0 myrom.r64
```

This command will load myrom.r64 (in the current path), in set 0. For instance, you can not load one bank, you need to load 64KB set.

## Clear bank ram or initialize it

Ram bank are not initialized when the board is tested. If you have garbage on screen when you uses bank (after you used twil -w). You have to clear all ram bank (ram bank are battery saved).

If you want to clear bank 4 of the set 0, you can do this command. You need to do this command for each bank of each set. For instance, there is no switch to clear all the ram with one command.

```code
orixcfg -w -s 0 -b 4 -c
```

## Flush all ram bank

```code
orixcfg -w -f
```

## Supported functions

```code
| Device  | Banks | Write one bank |
| SRAM    | 33-64 | Yes            |
| 29F040  | 1-32  | No             |
| 39SF040 | 1-32  | Yes            |
```

## SYNOPSYS

+ orixcfg

Load a .rom into RAM (in the example, set 0, bank 4)

+ orixcfg -w -s 0 -b 4 myrom.rom

Clear a ram bank (in the example, set 0, bank 4)

+ orixcfg -w -s 0 -b 4 -c

Load an eeprom set (in the example, set 0), only 64KB set

+ orixcfg -r -s 0 myset.r64

Update kernel

+ orixcfg -r -s 4 kernelus.r64

## DESCRIPTION

Manage twilighte board configuration
