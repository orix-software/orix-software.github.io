# XMALLOC (malloc)

## Description

Allocate memory. Use orix-sdk with macro to handle XMALLOC. Kernel uses for malloc : TR6 & TR7

## Input

A and Y : number of bytes

## Modify

*    TR6
*    TR7

## Output

A&Y = $0000 : OOM or others errors
else
A&Y : ptr

## Example

``` ca65
    .include "telestrat.inc"

    lda #<4000
    ldy #>4000

    BRK_TELEMON XMALLOC
    ; A & Y contains a ptr
    rts
```

!!! tip "See [malloc](../../../orixsdk_macros/malloc) macro from orix-sdk to use it easily "

!!! warning "Number of malloc are limited in kernel side for all running programs"

!!! info "Since kernel 2026.1, malloc tried to use 'free slot' when the requested size is equal or less than a available free slot"
