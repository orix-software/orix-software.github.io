# XFWRITE

## Description

Write bytes to file

## Input

* AY contains the length to write
* PTR_READ_DEST must be set (ptr where data are read)
* X contains the fd id

## Output

A & X contains the written length

## Modification

## Example

```ca65
    lda #<$A000
    sta PTR_READ_DEST
    lda #>$A000
    sta PTR_READ_DEST+1

    lda #<12 ; Write 12 bytes
    ldy #>12
    ldx fp
    BRK_KERNEL XFWRITE
    ; Carry is set, if the fp is not found (since kernel 2022.4)
    rts
```

!!! tip "XFWRITE can write 4GB file but only with 64KB block for each write, it's a software limit because A & Y are used to write 16 bits length"

!!! tip "See [fwrite](/developer_manual/orixsdk_macros/fwrite) macro from orix-sdk to use it easily"

!!! fail "XFWRITE does not manage multiples opened files : before kernel 2022.2"
