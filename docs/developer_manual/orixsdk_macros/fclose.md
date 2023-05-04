
# FCLOSE macro

## Description

Close an opened file

## usage

  fclose (fp)

## Example

```ca65
    .include "telestrat.inc"
    .include "SDK_file.mac" ; From orixsdk


    fclose (ptr) ; Ptr contains the FD (from fopen macro)
    rts
```

Call [XCLOSE](../../kernel/primitives/XCLOSE/) kernel function.
