# Memdecal macro

## Description

move memory

## Usage

memdecal ptr_dst, src_start, src_end

exit:
    - X: unused
    - AY: ptr_dst (A=LSB)

note:
    ptr may be: (ptr), address

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_memory.mac"

    memdecal $c040, $c000, $c080
    rts
```

Call [XDECAL](../../../developer_manual/kernel/primitives/xdecal.md) kernel function.
