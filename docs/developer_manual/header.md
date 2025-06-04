# Header

Definition of Orix binary and dynamic library "Link Library Object (llo)" header

## Orix binary

### Orix binary v4 format (relocated : bitfield table, available since Kernel 2022.4, and dynamic lib link since Kernel 2025.2)

``` ca65
  .byt $01,$00            ; non-C64 marker like o65 format
  .byt "o", "r", "i"      ; "ori" MAGIC number like o65 format
  .byt $04                ; version of this header
cpu_mode:
  .byt $00                ; CPU see below for description
;7
  .byt <SIZE_BITFIELD, >SIZE_BITFIELD    ; size of the bitfield map low
;9 and 10
  .byt <DYNLIB_MAPPING_TABLE, >DYNLIB_MAPPING_TABLE
;11
  .byt $00                ; reserved
;12
  .byt <OFFSET_BITFIELD, >OFFSET_BITFIELD ; offset of the bitfield
;14
  .byt <start_adress, >start_adress  ; loading adress
;16
  .byt <endofmemory, >EndOfMemory    ; end of loading adress
; 18
  .byt <start_adress, >start_adress  ; Execution adress
; end of header
start_adress:
  lda  $00
  rts
EndOfMemory:
```

### Orix binary v2 format (relocated : bitfield table, available since Kernel 2022.4)

``` ca65
  .byt $01,$00            ; non-C64 marker like o65 format
  .byt "o", "r", "i"      ; "ori" MAGIC number like o65 format
  .byt $02                ; version of this header
cpu_mode:
  .byt $00                ; CPU see below for description
;7
  .byt <SIZE_BITFIELD,>SIZE_BITFIELD    ; size of the bitfield map low
;9
  .byt $00                ; reserved
;10
  .byt $00                ; reserved
;11
  .byt $00                ; reserved
;12
  .byt <OFFSET_BITFIELD, >OFFSET_BITFIELD ; offset of the bitfield
;14
  .byt <start_adress, >start_adress  ; loading adress
;16
  .byt <endofmemory, >EndOfMemory    ; end of loading adress
; 18
  .byt <start_adress, >start_adress  ; Execution adress
; end of header
start_adress:
  lda  $00
  rts
EndOfMemory:
```

### Orix binary v1 format (Deprecated)

Orix binary v1 is not a relocated format. The binary must be never under $800. Relocation format (Format 2 see below) is now provided in kernel v2022.4

You don't need to know this format except if you use others assembler than ca65 (or cc65 with C). Orix-sdk provide .cfg file to add header to your code in assembly

``` ca65
        .byt $01,$00            ; non-C64 marker like o65 format
        .byt "o", "r", "i"      ; "ori" MAGIC number :$6f, $36, $35 like o65 format
        .byt $01                ; version of this header (can not be relocated)
cpu_mode:
        .byt $00                ; CPU see below for description
        .byt $00                ; reserved
        .byt $00                ; reserved
        .byt $00                ; reserved
        .byt $00                ; reserved
        .byt $00                ; reserved
        .byt $00                ; reserved
        .byt $00                ; reserved
        .byt <start_adress, >start_adress ; loading adress
        .byt <endofmemory, >EndOfMemory   ; end of loading adress
        .byt <start_adress, >start_adress ; starting adress

start_adress:
  *=$1000
  lda #$41
  sta $bb80
  rts
EndOfMemory:
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

## Orix dynamic lib format  "Link Library Object (llo)"

### Orix dynamic lib v1 format

This header defines the header for v1 dynamic lib, it's a relocated format. See how to build a dynamic lib (llo)

``` ca65
  .byt $01,$00            ; non-C64 marker like o65 format
  .byt "o", "r", "i"      ; "ori" MAGIC number like o65 format
  .byt 128 + $01          ; 128 means that it's a llo file (bit 7 = 1)
cpu_mode:
  .byt $00                ; CPU see below for description
;7
  .byt <SIZE_BITFIELD,>SIZE_BITFIELD    ; size of the bitfield map low
;9
  .byt $00                ; reserved
;10
  .byt $00                ; reserved
;11
  .byt $00                ; reserved
;12
  .byt <OFFSET_BITFIELD, >OFFSET_BITFIELD ; offset of the bitfield
;14
  .byt <start_adress, >start_adress  ; loading adress
;16
  .byt <endofmemory, >EndOfMemory    ; end of loading adress
; 18
  .byt <start_adress, >start_adress  ; Execution adress
; end of header
start_adress:
  lda  $00
  rts
EndOfMemory:
```
