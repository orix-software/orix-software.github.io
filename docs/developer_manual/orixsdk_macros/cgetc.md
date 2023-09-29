# cgetc

## Description

Read the keyboard

## usage

* cgetc
* cgetc var

note:
  Keycode in A register and var if provided

cgetc var

## example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_conio.mac"

    cgetc
    ; A contains the key pressed
    rts

```

Call [XRD0](../../../kernel/primitives/XRD0.md) kernel function.
