# Setscreen

## Description

Switch to text or hires

## Usage

setscreen [text|hires]

Call XTEXT/XHIRES functions

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_display.mac"

    setscreen hires
    rts
```

Call [XTEXT](../../../developer_manual/kernel/primitives/xtext) routine or [XHIRES](../../../developer_manual/kernel/primitives/xhires)
