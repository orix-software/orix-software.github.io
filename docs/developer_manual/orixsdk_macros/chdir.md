# CHDIR macro

## Description

Change currrent folder

## usage

chdir ptr

note:

* ptr may be: (ptr), address
* Call XPUTCWD function

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_dir.mac"

    chdir myfolder
    rts
myfolder:
    .asciiz "home"
```

Call [XPUTCWD](../../../developer_manual/kernel/primitives/xputcwd.md) kernel function.
