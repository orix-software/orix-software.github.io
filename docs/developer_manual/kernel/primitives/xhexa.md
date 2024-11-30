# XHEXA

## Usage

Convert a number in A and returns hexadecimal to AY

## Example

```ca65
    .include "telestrat.inc"

    lda #$FF
    BRK_KERNEL XHEXA
    ; A = 'F'
    ; Y = 'F'
    rts
```

!!! tip "See [tohex](../../../developer_manual/orixsdk_macros/tohex) macro from orix-sdk to use it"
