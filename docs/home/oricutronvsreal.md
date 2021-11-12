# Oricutron VS real hardware

## Differencies and issues

* usb controller is not fully emulated, it means that a lot of commands does not work on the emulation (mainly low usb command)
* uppercase and lower case for filenames are not managed in oricutron. It means that a code could work on Oricutron but it won't work on real. Every access to sdcard or usbdrive with FAT fileformat must be done with filename and path in **uppercase** (eg : toto.txt must be sent to the controler like TOTO.TXT)