# Print_int

## Description

Displays integer

## Usage

print_int [ptr], [len], [char]

note:
ptr may be: (ptr), address, <empty>
len: value
char: value (DEFAFF is not restored)

## Example

```ca65
  .include "telestrat.inc"
  .include "../orix-sdk/macros/SDK_print.mac"

  print_int mynumber, 3, 2
  rts

mynumber:
  .byt 12
```

Call [XDECIM](../../../kernel/primitives/xdecim/) xdecim
