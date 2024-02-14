# XDECIM

## Usage

Displays an integer into the the screen

## Example

```ca65

    .include "telestrat.inc"

    ldy     #$00
    ldx     #$20 ;
    stx     DEFAFF
    ldx     #$00
    BRK_TELEMON XDECIM
    rts
```

!!! tip "See [print_int](/developer_manual/orixsdk_macros/print_int) macro from orix-sdk to use it"
