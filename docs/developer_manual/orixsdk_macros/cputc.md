# cputc

## Description

Displays a char

## usage

- cputc
- cputc n
- cputc 'c'

note:

- no parameter: use the value of A register

Alias for: [print](print.md) #'c'

## example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_conio.mac"

    cputc char
    rts
```

Call [XWR0](../../../developer_manual/kernel/primitives/XWR0) kernel function.
