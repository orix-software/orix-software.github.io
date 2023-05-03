# XGETCWD (getcwd)

## Description

Return current directory of the process

## Input

## Output

A andY returns a ptr of the string

## Example

``` ca65
    .include "telestrat.inc"
    BRK_KERNEL XGETCWD
    BRK_KERNEL XWSTR0
    rts
```

## Memory usage

### zeropage

* RESB

!!! tip "See [getcwd](../../../developer_manual/orixsdk/getcwd) macro from orix-sdk to use it"
