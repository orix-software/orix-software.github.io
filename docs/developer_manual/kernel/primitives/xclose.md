# XCLOSE

## Description

Close file

## Input

A : fd

## Output

## Modify

RESB

## Samples

### Example

```ca65
    .include "telestrat.inc"

    lda     MYFD ; MYFD contains the value of the fd (returns of fopen)
    BRK_KERNEL XCLOSE
    rts
```

!!! tip "See [fclose](../../../developer_manual/orixsdk_macros/fclose) macro from orix-sdk to use it"

!!! bug "Before kernel 2026.1, when a 2 files are opened, and the second file is closed by XCLOSE, the first file is closed instead. It's fixed since 2026.1"
