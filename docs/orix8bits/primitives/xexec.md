# XEXEC

## Description

Start a binary (located in a ROM or on the current device)

## Input

A & Y the ptr of the string.

## Output

Returns an error if the binary is not found

## Example

``` ca65
    lda #<str
    ldy #>str
    BRK_KERNEL XEXEC
    rts
str:
    .asciiz "mybin"    
```
