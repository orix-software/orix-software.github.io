# tohex macro

## Description

convert a 8 bit number hexadecimal

## Usage

tohex ptr

ptr may be: address

## Output

A and Y contains the ascii hexa value

## Example 1

```ca65
    .include "telestrat.inc"
    .include "SDK_misc.mac"

    tohex mynumber
    rts
mynumber:
    .byte 12
```

## Example 2

```ca65
    .include "telestrat.inc"
    .include "SDK_misc.mac"

    lda     #12
    tohex
    rts
```

Call [XHEXA](../../../kernel/primitives/xhexa.md) kernel function.
