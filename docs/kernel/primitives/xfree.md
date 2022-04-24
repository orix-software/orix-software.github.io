# XFREE

## Description

Free memory

## Input

* A&Y : ptr

## Output


## Samples

### Example

``` ca65
    lda     ptr
    ldy     ptr+1
    BRK_KERNEL XFREE
```
