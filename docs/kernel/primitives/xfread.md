# XFREAD

## Description

Read byte from files

## Input

* AY contains the length to read
* PTR_READ_DEST must be set because it's the ptr_dest
* X contains the fd id

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
    rts
```

!!! tip "See [fread](../../../developer_manual/orixsdk_macros/fread) macro from orix-sdk to use it"

!!! tip "XFREAD returns the size in A & Y since kernel 2023.2"

!!! fail "XFREAD does not manage multiples opened files before kernel 2022.4 "
