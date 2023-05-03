# XOPENDIR

## Description

Open a folder

## Input

A & X : string

## Output

A : fd

## Example 1 : Openfolder /bin

```ca65
    .include "telestrat.inc"
    ldx     #$00 ; XOPENDIR  Mode
    lda     #<opendir
    ldy     #>opendir
    BRK_TELEMON $2F
    cmp     #$FF
    bne     @ok
    cpx     #$FF
    bne     @ok

    print str_error

    rts
@ok:
    ; Save ptr
    rts
opendir:
    asciiz "/bin"
```

!!! fail "XOPENDIR is in beta mode and close current open file : it brokes any fopen files."
