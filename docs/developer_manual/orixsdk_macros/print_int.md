# Print_int

## Description

Displays integer

## Usage

print_int [ptr], [len], [char]

note:
ptr may be: (ptr), address, <empty>
len: value
char: value (DEFAFF is not restored)

## Example 1

The value is from mynumber offset

```ca65
  .include "telestrat.inc"
  .include "../orix-sdk/macros/SDK_print.mac"

  print_int mynumber, 2, 2
  rts

mynumber:
  .byt 12
```

## Example 2

The value is from registers

```ca65
  .include "telestrat.inc"
  .include "../orix-sdk/macros/SDK_print.mac"

  lda     #12 ; 12
  ldy     #00 ; 0 because the number is 12 (from A)
  print_int  ,2, 2 ; an arg is skipped because the number is from register
  rts


```


Call [XDECIM](../../../developer_manual/kernel/primitives/xdecim) xdecim
