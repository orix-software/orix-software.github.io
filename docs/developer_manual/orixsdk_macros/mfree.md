# Mfree (free pointer)

usage:
    mfree (ptr)

```ca65
    .include "telestrat.inc"
    ; mymalloc is a 2 bytes zp ptr
    mfree (mymalloc)
    rts
```

Call [XFREE](../../kernel/primitives/xfree/) function.
