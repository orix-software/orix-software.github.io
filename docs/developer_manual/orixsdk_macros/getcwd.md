# getcwd

## usage

getcwd ptr

note:
ptr may be: ptr, address

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_dir.mac"

    pwd            := userzp ; 2 byte

    getcwd pwd
```

Call [XGETCWD](../../../kernel/primitives/XGETCWD/) kernel function.
