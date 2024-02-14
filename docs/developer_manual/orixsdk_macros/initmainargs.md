
# initmainargs

## Description

Initialize struct of the mainargs from current process

## Usage

### Parameters already prepared

initmainargs ptr, nb_of_paramter, 0

### Copy only command line to ptr buffer

initmainargs ptr, nb_of_paramter, 1

## Example

```ca65
  .include "telestrat.inc"
  .include "../orix-sdk/macros/SDK_mainargs.mac"

  argv            := userzp   ; 2 bytes -> ptr
  argc            := userzp+2 ; 1 byte -> value

  initmainargs argv, argc, 0
  ...

  mfree(argv) ; Free argv copy
  rts
```

!!! warning "initmainargs calls XMAINARGS kernel routine. It will returns in argv a ptr with a malloc performs by the kernel. It means that it must be free after the use of the mainargs (if there is no others uses after)"

Call [XMAINARGS](../../../developer_manual/kernel/primitives/xmainargs) function.

!!! warning "Since cc65 last version (2024 release), XMAINARGS and XGETARGV did not need to declare anymore"
