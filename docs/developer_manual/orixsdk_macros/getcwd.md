# getcwd

usage:
getcwd ptr

 note:
ptr may be: ptr, address

Call XGETCWD function

```ca65
    .include "telestrat.inc"
    .include "SDK_dir.mac"

    pwd            := userzp ; 2 byte

    getcwd pwd
```

Call [XGETCWD](../..//orixsdk_macros/kernel/primitives/XGETCWD/) kernel function.
