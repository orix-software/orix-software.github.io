# XPUTCWD (chdir)

## Description

Change current process directory

## Input

A & Y the 16 bits values (string with \0)

## Output

N/A

## Example

```ca65
    .include "telestrat.inc"

    lda        #<str
    ldy        #>str
    BRK_TELEMON XPUTCWD
    rts
str:
    .asciiz "/etc"
```

!!! tip "See [chdir](../../../orixsdk_macros/chdir) macro from orix-sdk to use it"
