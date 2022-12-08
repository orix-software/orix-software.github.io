# scroll macro

scroll [Direction],firstline, last_line_to_scroll

## General case

``` ca65
scroll up, 0, 26 ; Scroll all lines from bottom to the first line : it erases the first line with the second and so open

scroll down, 0, 26
```

## the first line to scroll is computed and is in X register

``` ca65
ldx #3
scroll up,, 26 ; The second arg is empty because we notice to the macro that it's provided by X register
```

!!! tip "This only work with X register"
