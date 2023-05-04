# Mfree (free pointer)

## usage

mfree (ptr)

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_memory.mac"

    ; mymalloc is a 2 bytes zp ptr
    mfree (mymalloc)
    rts
```

Call [XFREE](../../../kernel/primitives/xfree/) function.
