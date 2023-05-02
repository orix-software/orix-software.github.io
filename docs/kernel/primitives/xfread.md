# XCLOSE

## Description

Read byte from files

## Input

* AY contains the length to read
* PTR_READ_DEST must be set because it's the ptr_dest
* X contains the fd id

## Output

A & X contains the length read

## Samples

### Example

```ca65
    lda #<$A000
    sta PTR_READ_DEST
    lda #>$A000
    sta PTR_READ_DEST+1

    lda #<12 ; Read 12 bytes
    ldy #>12 ; REad 12 bytes
    ldx fp
    BRK_KERNEL XFREAD
    rts
```

!!! tip "See [fread](../../../developper_manual/orixsdk) macro from orix-sdk to use it "

!!! fail "XFREAD does not manage multiples opened files before kernel 2022.4 "
