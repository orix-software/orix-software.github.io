# XSCROH (Scrollup text mode)

Scroll all lines from bottom to the top

## Examples

```ca65
    ldx     #$01 ; First line to scroll
    ldy     #26  ; Last line to scroll
    BRK_KERNEL XSCROH
```

!!! tip "See [scroll](../../../developper_manual/orixsdk_macros/scroll) macro from orix-sdk to use it "
