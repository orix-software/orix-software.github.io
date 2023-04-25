# Command: strerr

### strerr utility

## SYNOPSYS
+ strerr -h|-v|-a
* strerr [-q] start[,end]
* strerr [-a[q]] [start]

## EXAMPLES
+ strerr 1
* strerr 1,4
* strerr ,18
* strerr -a 3

## DESCRIPTION
**strerr** return string describing error number

## OPTIONS
*  -h
   display command syntax
*  -v
   display program version
*  -a
   display all message from start
*  -q
   quiet mode
* start
   message number (def: 0)
* end
   last message number (def: 0)

## SOURCE
https://github.com/orix-software/strerr

