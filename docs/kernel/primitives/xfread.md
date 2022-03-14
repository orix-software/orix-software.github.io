# XFREAD

## Description

Read byte from files

## Input

AY contains the length to read
PTR_READ_DEST must be set because it's the ptr_dest
X contains the fd id

## Output

A & X contains the length

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
    BRK_KERNEL XFREAD
    rts

```

!!! fail "XFREAD does not multiple opened files "