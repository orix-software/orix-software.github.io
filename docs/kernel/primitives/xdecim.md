# XDECIM

``` ca65
    ldy     #$00
    ldx     #$20 ;
    stx     DEFAFF
    ldx     #$00
    BRK_KERNEL XDECIM
    rts
```

Page last revised on: {{ git_revision_date }}
