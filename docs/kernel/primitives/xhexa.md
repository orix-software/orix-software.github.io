# XHEXA

Convert a number in A and returns hexadecimal to AY

## Samples

### Example

``` ca65
    lda #$FF
    BRK_KERNEL XHEXA
    ; A = 'F'
    ; Y = 'F'
    rts
```

Page last revised on: {{ git_revision_date }}
