# Header

## Introduction

Orix binary is not a relocated format. The binary must be never under $800. In the future, a relocated binary format could be used

You don't need to know this format except if you use others assembler than ca65 (or cc65 with C). Orix-sdk provide .cfg file to add header to your code in assembly

``` ca65
        *=$1000-20
; include header
        .byt $01,$00		; non-C64 marker like o65 format
        .byt "o", "r", "i"      ; "ori" MAGIC number :$6f, $36, $35 like o65 format
        .byt $01                ; version of this header
cpu_mode
        .byt $00                ; CPU see below for description
os_type
        ; 0 : Orix
        ; 1 : Sedoric
        ; 2 : Stratsed
        ; 3 : FTDOS
        .byt $00	        ; 
        .byt $00                ; reserved
 
        .byt $00		; reserved
        .byt $00	        ; operating system id for telemon $00 means telemon 3.0 version
        .byt $00	        ; reserved
        .byt $00                ; reserved
type_of_file
        ; bit 0 : basic
        ; bit 1 : machine langage
        .byt %00000000                   ; 
        .byt <start_adress,>start_adress ; loading adress
        .byt <endofmemory,>EndOfMemory   ; end of loading adress
        .byt <start_adress,>start_adress ; starting adress
 ```

``` ca65
start_adress:
 
	*=$1000
	lda #$41
	sta $bb80
	rts
EndOfMemory
```

## Description

cpu_mode

     For 6502 rockwell (oric version no illegals opcodes)

.byt %00000000 ; 6502 (bit 0 = 0)

    For 65C02 WDC

.byt %00000001 ; 65c02 (bit 0 = 1)

    For 65C816 WDC

.byt %00000010 ; 65C816 (bit 1 = 1)

    For 6502 with illegal opcodes (rockwell)

.byt %00000011 ; (bit 1 = 1 et bit0 =1)
language_type

On Telestrat (and Stratsed), Hyperbasic starts. When we load from Hyperbasic roms, roms contains routine to load hyperbasic file. This header adds a byte in order to start in the future the right program.

     %00000000 : Orix file
    %00000001 : Hyperbasic file, start hyperbasic interpreter
    %00000010 : Teleass file, start teleass interpreter
    %00000011 : Teleforth file, start teleforth interpreter
    other value will be used for others OS (sedoric, ftdos, xldos)

type_of_file

It used to keep compatibility with stratsed, ftdos, sedoric : Stratsed and sedoric keep in their header information the type of file.

This trick is done because if we implement cp from stratsed disk to sdcard, we will lost this information. That is why these byte is reserved to this.