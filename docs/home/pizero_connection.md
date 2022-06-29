# Pi zero connection

You can also develop on the oric, if you have it next you and you have a pi zero with usb storage gadget configured

Mount under windows a drive which is pi zero with samba binary. Then when build your code, you just need to copy the binary to the right letter.

 For example : copy mycode /s/bin/

 /s/bin is pi zero folder, and you just need to type mycode at command line.

You need to execute in crontab a shell script. It flushs linux cache to disk. The problem with gadget is that it keeps action in memory, and in facts, samba does not show you the binary because, it's not written on disk.

## How to install

* Download img http://repo.orix.oric.org/orixpi.img.gz

* 'gzip -d' it or use 7zip 

* Download and install Win32 disk imager : https://sourceforge.net/projects/win32diskimager/

* insert a sdcard into your PC, and write the orixpi.img on the sdcard with Win32 disk imager

* remove sdcard from the pc and insert it to pizero when Win32 disk imager had finished

* insert a usb cable in the *second*  usb port (it's really important), and insert usb cable into the PC

* Wait one minute, your Pc should detect a new storage device (it's the pi)

* in the new device, copy all files you need for Orix (sdcard.tgz content for example)

* with an editor file, edit on this new mass storage : /etc/pizero/wpa/wpa.cnf and insert the wifi network you use and the password

* unplug the zero pi and insert it in the usb twilighte board port

* switch on the oric with the board and wait 1 minutes

* If everything is ok, you should see your files with "ls" and the pizero should be in your wifi network, you can now access to the network folder of pizero from your pc (with the right IP)


