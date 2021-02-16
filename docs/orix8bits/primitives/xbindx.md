# XBINX

## Description

convert A & Y number into decimal

## Input

A & Y the 16 bits values
TR5 the pointer of the address to put decimal number
DEFAFF : space before the number
X : xxx

## Output

A & TR5

## Example

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
    BRK_KERNEL XBINX
```

