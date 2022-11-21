# XDECAY

Convert a string into number

A et Y contains the ptr of the string

XDECAY returns the value (16 bits) in AY and X contains the length of the decimal number provided in the input

``` ca65

lda		#<mystring
ldy		#>mystring
BRK_KERNEL XDECAY

; A and Y contains the 16 bits value
; X contains the length of chars in mystring
rts

mystring:
  .asciiz "125"

```

Page last revised on: {{ git_revision_date }}
