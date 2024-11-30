# XDECAY

## Usage

Convert a string into number

A et Y contains the ptr of the string

XDECAY returns the value (16 bits) in AY and X contains the length of the decimal number provided in the input

## Example

```ca65

  .include "telestrat.inc"

  lda #<mystring
  ldy #>mystring
  BRK_TELEMON XDECAY

  ; A and Y contains the 16 bits value
  ; X contains the length of chars in mystring
  rts

  mystring:
    .asciiz "125"
```

!!! tip "See [atoi](../../../developer_manual/orixsdk_macros/atoi) macro from orix-sdk to use it"
