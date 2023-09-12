# XWR0

Print a char to the screen

```ca65
    .include "telestrat.inc"
    lda #'A'
    BRK_TELEMON XWR0
    rts
```

!!! tip "See [print](../../../developer_manual/orixsdk_macros/print/) macro from orix-sdk to use it easily (with print #VALUE) or [cputc](../../developer_manual/orixsdk_macros/cputc/) macro from orix-sdk to use it easily"
