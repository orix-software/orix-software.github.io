# Summary

Kernel calls are done with brk VALUE.

Some parameter are set into A,X,Y and some others ones needs to be set in Kernel zp memory.

Orix-sdk must be used in order to manage in the right way kernel calls

## Args from commandline

* [XMAINARGS](xmainargs) : get command line and build argv/argc
* [XGETARGV](xgetargv) : get an argv from xmainargs struct

## Numbers

* [XBINDX](xbindx) : convert a number to decimal
* [XHEXA](xhexa) : convert a number to hexadecimal and printit
* [XDECIM](xdecim) : display a number to the output
* [XDECAY](xdecay) : Convert a string into a number (16 bits)

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
* [XOPENDIR](xopendir) : opendir
* [XREADDIR](xreaddir) : readdir (return a struct with the files)
* [XRM](xrm) : remove file

## Text mode

* [XSCROB](xscrob) : scroll from bottom to top
* [XSCROH](xscroh) : scroll from top to bottom

## Graphic mode

* [XHIRES](xhires) : start graphic mode

## Execute

* [XEXEC](xexec) : Execute binary

## Keyboard

* [XRDW0](xrdw0) : Get a char from keyboard (wait for a key)
* [XRD0](xrd0) : check if a char is typed on the keyboard (continue execution)

Page last revised on: {{ git_revision_date }}
