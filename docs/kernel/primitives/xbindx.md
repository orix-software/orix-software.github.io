# XBINDX (16 bit number to decimal)

## Description

convert A & Y number into decimal string

## Input

A & Y the 16 bits value

TR5 the pointer of the address to put decimal number (String)

DEFAFF : space before the number

## Output

A, TR4, TR5

## Example 1 : Displays value AY (16 bits number) in $bb80 text mode

``` ca65
	lda        #<$bb80
	sta        TR5
	lda        #>$bb80
	sta        TR5+1

	lda        #$20
	sta        DEFAFF

	ldx		   #$01
	ldy        #$00
	lda        #$10
    BRK_KERNEL XBINDX
	rts
```