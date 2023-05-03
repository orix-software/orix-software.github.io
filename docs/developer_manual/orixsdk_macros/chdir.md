# CHDIR macro

usage:
chdir ptr

note:

* ptr may be: (ptr), address
* Call XPUTCWD function

```ca65
    .include "telestrat.inc"
    .include "SDK_dir.mac" ; From orixsdk

    chdir myfolder
    rts
myfolder:
    .asciiz "home"
```

Call [XPUTCWD](../..//orixsdk_macros/kernel/primitives/XPUTCWD/) kernel function.
