# Print macro

## Description

print string in text mode

## usage

print #byte [,SAVE]
print (pointer) [,SAVE]
print address [,SAVE]

Option:

- NOSAVE : does not preserve A,X,Y registers

## Example

```ca65

  .include "../orix-sdk/macros/SDK_print.mac"
  .include "telestrat.inc"

  print helloworld_str
  crlf ; Return line
  rts

helloworld_str:
  .asciiz "Hello world!"
```

Call [XWSTR0](../../../kernel/primitives/xwstr0.md) function.
