# XWR0

Print a char to the screen

```ca65
    .include "telestrat.inc"
    lda #'A'
    BRK_TELEMON XWR0
    rts
```

!!! tip "See [print](../../../orixsdk_macros/print/) macro from orix-sdk to use it easily (with print #VALUE) or [cputc](../../orixsdk_macros/cputc/) macro from orix-sdk to use it easily"
