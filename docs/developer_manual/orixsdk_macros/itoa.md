# itoa macro

## Description

convert a number into string

## Usage

itoa [ptr], [len], [char]

ptr may be: (ptr), address

## Output

N/A

## Example

```ca65
    .include "telestrat.inc"
    .include "SDK_misc.mac"

    itoa mynumber,2,2
    rts
mynumber:
    .byte 12
```

Call [XBINDX](../../kernel/primitives/xbindx/) kernel function.
