# XFREE

## Description

Free memory

## Input

* A&Y : ptr

## Output


## Example

```ca65
    .include "telestrat.inc"

    lda     ptr
    ldy     ptr+1
    BRK_TELEMON XFREE
    rts
```

!!! tip "See [mfree](../../../developer_manual/orixsdk_macros/mfree) macro from orix-sdk to use it"

!!! fail "XFREE still have bugs for versions before kernel v2022.2"
