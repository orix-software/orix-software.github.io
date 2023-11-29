# FWRITE macro

## Description

Write bytes into file

## Usage

fwrite ptr, size, count, fp

note:

* ptr may be : (ptr), address
* size may be: (ptr), address
* fp may be  : address, #value, {address,y}

Returns in A and X the length written

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_file.mac"

    [...]
    fwrite (myptr), 1080, 1, MAN_FP ; myptr is from a malloc for example
    ; A and X contains the length writteng
    fclose(MAN_FP)
    rts
```

See [XFWRITE](../../../kernel/primitives/xwrite/) kernel primitive
