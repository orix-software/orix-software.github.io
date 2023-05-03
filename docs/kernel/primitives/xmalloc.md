# XMALLOC (malloc)

## Description

Allocate memory. Use orix-sdk with macro to handle XMALLOC

## Input

A and Y : number of bytes

## Output

A&Y = $0000 : OOM or others errors
else
A&Y : ptr

## Usage

``` ca65
    .include "telestrat.inc"

    lda #<4000
    ldy #>4000

    BRK_TELEMON XMALLOC
    ; A & Y contains a ptr
    rts
```

!!! tip "See [malloc](../../../developer_manual/orixsdk_macros/malloc) macro from orix-sdk to use it easily "

!!! warning "Number of malloc are limited in kernel side for all programs running"
