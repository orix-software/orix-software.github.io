# UNLINK macro

## Description

Remove a file

## Usage

unlink address

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_file.mac"

    unlink myfile
    rts
myfile:
    .asciiz "toto.txt"
```

Call [XRM](../../../kernel/primitives/xrm/) kernel function.
