# XFWRITE

## Description

Write bytes to file

## Input

AY contains the length to write
PTR_READ_DEST must be set (ptr where data are read)
X contains the fd id

## Output

A & X contains the written length

# Modification :

## Example

``` ca65
    lda #<$A000
    sta PTR_READ_DEST
    lda #>$A000
    sta PTR_READ_DEST+1

    lda #<12
    ldy #>12
    ldx fp
    BRK_KERNEL XFWRITE
    rts

```

!!! fail "XFREAD does not manage multiples opened files "