# XRDW0

## Usage

Wait a key from the keyboard

## Example

```ca65
    .include "telestrat.inc"

    BRK_KERNEL XRDW0
    ; When a key is pressed, A contains the ascii of the value
    rts
```

!!! tip "See [cgetc](../../developer_manual/orixsdk_macros/cgetc) macro from orix-sdk to use it"
