# XOPENDIR

## Description

Open a folder

## Input

A & X : string

## Output

A : fd

## Example 1 : Displays value AY (16 bits number) in $bb80 text mode

``` ca65
    ldx     #$00
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

