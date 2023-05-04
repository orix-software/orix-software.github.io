# Print_int

## Description

Displays integer

## Usage

## Example

## Example

```ca65
  .include "telestrat.inc"
  .include "../orix-sdk/macros/SDK_print.mac"


  print helloworld_str
  crlf ; Return line
  rts

helloworld_str:
  .asciiz "Hello world!"
```

Call [XWSTR0](../../../kernel/primitives/xwstr0/) function.