# MKDIR macro

## Usage

mkdir ptr

note:
 ptr may be: (ptr), address

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_dir.mac"

    mkdir myfolder
    rts
myfolder:
    .asciiz "here"
```

Call [XMKDIR](../../kernel/primitives/xmkdir/) function.
