# XHEXA

Convert a number in A and returns hexadecimal to AY

## Samples

### Example

``` ca65
    .include "telestrat.inc"
    lda #$FF
    BRK_KERNEL XHEXA
    ; A = 'F'
    ; Y = 'F'
    rts
```
