# scroll macro

## Description

Perfoms a scroll text

## Usage

scroll [Direction],firstline, last_line_to_scroll

## Example 1

```ca65
    .include "telestrat.inc"
    ; Scroll all lines from bottom to the first line : it erases the first line with the second and so open0
    scroll up, 0, 26
    scroll down, 0, 26
    rts
```

## Example 2

the first line to scroll is computed and is in X register

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_display.mac"

    ; The second arg is empty because we notice to the macro that it's provided by X register
    ldx #3
    scroll up,, 26
    rts
```

!!! tip "This only work with X register"

Call [XSCROB](../../../kernel/primitives/xscrob/) routine or [XSCROH](../../../kernel/primitives/xscroh/)
