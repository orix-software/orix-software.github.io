# XFREAD

## Description

Read byte from files. Kernel uses RES, PTR_READ_DEST, TR0 memory

## Input

* AY contains the length to read
* PTR_READ_DEST must be set because it's the ptr_dest
* X contains the fd id

## Modify

RES, PTR_READ_DEST, TR0, HRS1, HRS3 + 1

## Output

A & X contains the length read

## Example

```ca65
    .include "telestrat.inc"


    lda #<$A000
    sta PTR_READ_DEST
    lda #>$A000
    sta PTR_READ_DEST+1

    lda #<12 ; Read 12 bytes
    ldy #>12 ; REad 12 bytes
    ldx fp
    BRK_KERNEL XFREAD
    ; A & X contains the length (since Kernel 2023.2)
    ; Carry is set, if the fp is not found (since kernel 2022.4)
    rts
```

!!! warning "XFREADS changes carry. If asl/lsr/sec/clc (etc) are used after XFREAD call, theses opcodes should have differents behaviors. To avoid any problem, php/plp can be used for example before and after XFREAD call (or sec/clc depending of the code.)"

!!! tip "XFREAD can write 4GB file but only with 64KB block for each read, it's a software limit because A & Y are used to read 16 bits length"

!!! tip "See [fread](../../../orixsdk_macros/fread) macro from orix-sdk to use it"

!!! tip "XFREAD returns the size in A & X since kernel 2023.2, previous versions the length must be compute from "

!!! fail "XFREAD does not manage two opened files before kernel 2022.4."
