# XFREE

## Description

Free memory

## Input

* A&Y : ptr

## Output

## Samples

### Example

```ca65
    lda     ptr
    ldy     ptr+1
    BRK_KERNEL XFREE
```

!!! tip "See [mfree](../../../developer_manual/orixsdk/mfree) macro from orix-sdk to use it"

!!! fail "XFREE still have bugs for versions before kernel v2022.2"
