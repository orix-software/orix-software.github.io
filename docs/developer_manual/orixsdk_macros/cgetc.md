# cgetc

usage:
  cgetc
 cgetc var

note:
  Keycode in A register and var if provided

cgetc var

```ca65
    .include "telestrat.inc"
    .include "SDK_conio.mac" ; From orixsdk

    cget
    ; A contains the key pressed
    rts

```

Call [XRD0](../../kernel/primitives/XRD0/) kernel function.
