# XWSTR0

Displays a string

```ca65
    .include "telestrat.inc"
    lda     #<str
    ldy     #>str
    BRK_KERNEL XWSTR0
    rts
str:
    .asciiz "Hello world"
```

!!! tip "See [print](../../developer_manual/orixsdk_macros/print/) macro from orix-sdk to use it easily "
