# XMKDIR (mkdir)

ID primitive : $4B

## Description

Create a folder. But it does not support absolute path for instance. It can only create path in the current path.

## Input

A and Y : ptr of the string

## Output

Return #ENODEV if the device can't be mount

## Usage

```ca65
    .include "telestrat.inc"
    lda #<str
    ldy #>str
    ldx #$00
    BRK_TELEMON XMKDIR
    rts
str:
    .asciiz "myfolder"
```

!!! tip "See [mkdir](../../../developer_manual/orixsdk/mkdir) macro from orix-sdk to use it"
