
# initmainargs

## Description

Initialize struct of the mainargs from current process

## Usage

initmainargs ptr, ptr1, 0

## Example

```ca65
  .include "telestrat.inc"
  .include "../orix-sdk/macros/SDK_mainargs.mac"

  XMAINARGS       = $2C
  XGETARGV        = $2E
  argv            := userzp   ; 2 bytes
  argc            := userzp+2 ; 1 byte

  initmainargs argv, argc, 0
  rts
```

Call [XMAINARGS](../../../kernel/primitives/xmainargs/) function.
