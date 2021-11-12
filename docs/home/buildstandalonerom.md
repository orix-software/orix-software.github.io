# Build a standalone ROM

## Prerequisites

Before starting :

* Read [Oricutron VS Real hardware](oricutronvsreal.md)

## Guidelines

A standalone ROM is a ROM which does not need the kernel and manage the fully main memory.

It's not the main choice when a ROM is built, but it's used to handle easily compatibility for "Legacy roms" as Atmos Rom, Oric-1 and others customs roms released.

It means that all code to manage files, joysticks, text I/O, Hires I/O must be inserted in this rom.

This mode must avoided because it won't handle evolution handled in the kernel and the Twilighte board

## Access to sdcard and usbdrive

Orix and kernel handles devices : usbdrive (Usbkey) and sdcard. When a standalone rom is built, it must keep default device, in that case, it requires to ask to the kernel which is the default device before flushing main memory.

## Launching a standalone ROM

If you are on Oricutron, you can put in bank 7, your rom and start Oricutron in twilighte board mode.
On real computer, you need to

* copy your ROM into a folder (ex : /usr/share/myroms/myrom.rom)
* Modify /etc/systemd/banks.cnf to add a new rom entry
* Type funct + L and you will be able to start your standalone ROM
