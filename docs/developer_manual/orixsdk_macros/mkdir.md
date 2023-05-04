# MKDIR macro

## usage

mkdir ptr

note:
 ptr may be: (ptr), address

## Example

```ca65
    .include "telestrat.inc"

    mkdir myfolder
    rts
myfolder:
    .asciiz "here"
```

Call [XMKDIR](../../kernel/primitives/xmkdir/) function.
