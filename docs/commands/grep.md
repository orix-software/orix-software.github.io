# Command: grep

### grep utility

## SYNOPSYS
+ grep [-ncisw] string filename
+ grep -h

## DESCRIPTION
**grep** display all lines of a text file that contain a string.

## OPTIONS
*  -h^GDisplay command syntax
*  -n^GShow line numbers
*  -c^GCount only the matching lines
*  -i^GIgnore case
*  -w^GString can use wildcards *, ?, ^ and $
*  -s^GSilent mode

## EXAMPLES
+ grep error menu.sub
+ grep -n "level 1" menu.sub
+ grep -i ERROR menu.sub
+ grep -ni 'level 2' menu.sub
+ grep -w '\*lev?? 2\*'menu.sub
+ grep -w '^if' menu.sub
+ grep -w 'error$' menu.sub
+ grep -w 'if*level ??' menu.sub

## SOURCE
https://github.com/orix-software/grep

