# XOPEN

## Description

open a file

## Input

Y : flag open mode
A&X : path filename

This routine use :
       RES, A X Y, XOPEN_SAVE XOPEN_FLAGS, XOPEN_RES_SAVE, XOPEN_SAVEA
and with XMALLOC :
TR7 (malloc)

## Output

 AX contains $FF if it does not exists
 A : FD id if file is found

## Changelog

### Since kernel 2022.2

Flag     | File exists | behaviour
O_WRONLY |    No       | return Null
O_WRONLY |    Yes      | open and return FD
O_RDONLY |    Yes      | open and return FD
O_WRONLY |    No       | return Null
O_CREAT  |    No       | Create file and open and return FD
O_CREAT  |    Yes      | open and return FD

## Usage

``` ca65
    lda #<str
    ldx #>str
    ldy #O_CREAT

    BRK_TELEMON XOPEN
    rts
str:
    .asciiz "myfolder"
```
