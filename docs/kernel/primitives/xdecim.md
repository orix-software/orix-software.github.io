# XDECIM

Displays an integer into the the screen

```ca65

    .include "telestrat.inc"

    ldy     #$00
    ldx     #$20 ;
    stx     DEFAFF
    ldx     #$00
    BRK_KERNEL XDECIM
    rts
```
