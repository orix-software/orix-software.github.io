# FCLOSE macro

## Description

Close an opened file

## usage

  fclose (fp)

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_file.mac"


    fclose (ptr) ; Ptr contains the FD (from fopen macro)
    rts
```

Call [XCLOSE](../../../developer_manual/kernel/primitives/xclose.md) kernel function.
