# Pi zero connection

You can also develop on the oric, if you have it next you and you have a pi zero with usb storage gadget configured

Mount under windows a drive which is pi zero with samba binary. Then when build your code, you just need to copy the binary to the right letter.

 For example : copy mycode /s/bin/

 /s/bin is pi zero folder, and you just need to type mycode at command line.

You need to execute in crontab a shell script. It flushs linux cache to disk. The problem with gadget is that it keeps action in memory, and in facts, samba does not show you the binary because, it's not written on disk.
