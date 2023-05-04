# cputc

## Description

Displays a char

## usage

  cputc
  cputc n
  cputc 'c'

note:
- no parameter: use the value of A register

Alias for: [print](print) #'c'

## example

```ca65
	.include "telstrat.inc"
    cputc char
    rts
```

Call [XWR0](../../kernel/primitives/XWR0/) kernel function.
