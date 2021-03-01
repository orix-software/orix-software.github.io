# XGETARGV 

## Description

Get argv. X register contains the number of the arg search

## Input 

A & Y the ptr of struct from XMAINARGS

X the number of arg to get

## Output

A & Y contains argv ptr from xmainargs struct. It returns a copy of the command line with args parsed

## Example

``` ca65
    XMAINARGS = $2C
    XGETARGV = $2E
    BRK_KERNEL XMAINARGS
    sta   debug_mainargs_ptr
    sty   debug_mainargs_ptr+1

    ldx   #$02 ; get arg 2
    lda   debug_mainargs_ptr
    ldy   debug_mainargs_ptr+1

    BRK_KERNEL XGETARGV

    ; A & Y contains ptr
```


