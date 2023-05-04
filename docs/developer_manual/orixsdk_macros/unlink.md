# UNLINK macro

## Description

Remove  afile

## Usage

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_file.mac"

    unlink myfile
    rts
myfile:
    .asciiz "toto.txt"
```
