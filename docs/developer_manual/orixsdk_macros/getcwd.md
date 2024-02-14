# Getcwd

## Description

Get cwd

## Usage

getcwd ptr

note:
ptr may be: ptr, address

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_dir.mac"

    pwd            := userzp ; 2 bytes

    getcwd pwd
    rts
```

Call [XGETCWD](../../../developer_manual/kernel/primitives/xgetcwd) kernel function.
