# Memmove macro

## Description

Move memory

## Usage

memmove ptr_dst, src_start, src_len

exit:
    - X: unused
    - AY: ptr_dst (A=LSB)

note:
    ptr may be: (ptr), address

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_memory.mac"

    memmove $c080,$c000, 10

    rts
```

Call [XDECAL](../../../developer_manual/kernel/primitives/xdecal) kernel function.
