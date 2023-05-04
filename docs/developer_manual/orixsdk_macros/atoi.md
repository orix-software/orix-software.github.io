# atoi macro

## Description

Convert a string to a 16 bits number

## Usage

atoi [ptr]

ptr may be: (ptr), address

## Output

AY: value
X: number of digits (ie 10^X)

## Example

```ca65
    .include "telestrat.inc"
    .include "SDK_misc.mac"

    atoi mystrnumber
    rts
mystrnumber:
    .asciiz "12"
```

Call [XDECAY](../../kernel/primitives/xdecay/) kernel function.
