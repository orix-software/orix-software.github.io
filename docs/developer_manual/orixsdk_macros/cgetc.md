# cgetc

## usage

* cgetc
* cgetc var

note:
  Keycode in A register and var if provided

cgetc var

## example

```ca65
    .include "telestrat.inc"
    .include "SDK_conio.mac" ; From orixsdk

    cgetc
    ; A contains the key pressed
    rts

```

Call [XRD0](../../kernel/primitives/XRD0/) kernel function.
