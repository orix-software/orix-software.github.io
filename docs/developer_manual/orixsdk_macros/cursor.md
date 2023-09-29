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

Call [XCSSCR](../../../kernel/primitives/xcsscr.md) or [XCOSCR](../../../kernel/primitives/xcoscr.md) kernel function.

