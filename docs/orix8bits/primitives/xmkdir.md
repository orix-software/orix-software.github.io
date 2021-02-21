# XMKDIR

ID primitive : $4B

## Description

Create a folder. But it does not support absolute path for instance. It can only create path in the current path.

## Input

A and Y : ptr of the string

## Output

Return #ENODEV if the device can't be mount

## Usage

``` ca65
    lda #<str
    ldy #>str

    BRK_TELEMON XMKDIR
    rts
str:
    .asciiz "myfolder"
``` 

