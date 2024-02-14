# XGETCWD (getcwd)

## Description

Return current directory of the process

## Input

## Output

A and Y returns a ptr of the string

## Example

``` ca65
    .include "telestrat.inc"

    BRK_TELEMON XGETCWD

    ; Displays
    BRK_TELEMON XWSTR0
    rts
```

## Memory usage

## zeropage

* RESB

!!! tip "See [getcwd](../../../developer_manual/orixsdk_macros/getcwd) macro from orix-sdk to use it"
