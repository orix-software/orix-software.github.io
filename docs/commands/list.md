# Command: list

### LIST utility

## SYNOPSYS
+ list [-c] [+offset] file

## EXAMPLES
+ list /home/basic11/prog.bas
+ list +19 scuba.tap

## DESCRIPTION
Similar to LIST instruction of the BASIC ROM but for files.
With +nnn you can go past the tape header of a tape file.
You can use [SPACE] to pause the display ou [CTRL]+C to abort.

## OPTIONS
*  -h
                show help message and exit
*  -c
                Color
* +nnn
		skip nnn bytes before starting the listing

## SOURCE
https://github.com/orix-software/list

---
comments: true
---
