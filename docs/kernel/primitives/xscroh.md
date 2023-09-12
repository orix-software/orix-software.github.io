# XSCROH (Scrollup text mode)

## Descroption

Scroll all lines from bottom to the top

## Examples

```ca65
    .include "telestrat.inc"
    ldx     #$01 ; First line to scroll
    ldy     #26  ; Last line to scroll
    BRK_TELEMON XSCROH
    rts
```

!!! tip "See [scroll](../../../developer_manual/orixsdk_macros/scroll) macro from orix-sdk to use it"
