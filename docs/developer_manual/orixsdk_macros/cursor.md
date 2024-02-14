# Cursor

## Description

Switch on or switch off the cursor

## Usage

cursor ON|OFF

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_display.mac"

    cursor ON
    rts
```

Call [XCSSCR](../../../developer_manual/kernel/primitives/xcsscr) or [XCOSCR](../../../developer_manual/kernel/primitives/xcoscr) kernel function.

