# XSCROB (Scroll down)

## Description

Scroll all lines from the top to the bottom

## Example

```ca65
    .include "telestrat.inc"

    ldx     #$01 ; First line to scroll
    ldy     #25  ; Last line to scroll
    BRK_KERNEL XSCROB
    rts
```

!!! tip "See [scroll](../../../developer_manual/orixsdk_macros/scroll) macro from orix-sdk to use it"
