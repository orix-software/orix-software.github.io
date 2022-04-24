# Summary

Kernel calls are done with brk VALUE.

Some parameter are set into A,X,Y and some others ones needs to be set in Kernel zp memory.

Orix-sdk must be used in order to manage in the right way kernel calls

## Args from commandline

* [XMAINARGS](xmainargs) : get command line and build argv/argc
* [XGETARGV](xgetargv) : get an argv from xmainargs struct

## Numbers

* [XBINDX](xbindx) : convert a number to decimal
* [XDECIM](xdecim) : display a number to the output

## Memory

* [XMALLOC](xmalloc) : allocate memory from main memory
* [XFREE](xfree) : free memory

## Files

* [XOPEN](xopen) : Open a file
* [XWRITE](xwrite) : Write bytes to file
* [XFREAD](xfread) : read bytes from file
* [XCLOSE](xclose) : Close file
* [XFSEEK](xfseek) : Seek into files
* [XMKDIR](xmkdir) : Create a folder
* [XGETCWD](xgetcwd) : get current path
* [XPUTCWD](xputcwd) : change current path

## Text mode

* [XSCROB](xscrob) : scroll from bottom to top
* [XSCROH](xscrob) : scroll from top to bottom

## Execute

* [EXEC](xexec) : Execute binary
