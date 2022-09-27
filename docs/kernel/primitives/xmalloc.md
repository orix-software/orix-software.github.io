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
    lda #<4000
    ldy #>4000

    BRK_TELEMON XMALLOC
    ; A & Y contains a ptr
    rts
```

!!! warning "Number of malloc are limited in kernel side"