# XPUTCWD (chdir)

## Description

Change current process directory

## Input

A & Y the 16 bits values (string with \0)

## Output

N/A

## Example

``` ca65
	lda        #<str
	ldy        #>str
    BRK_KERNEL XPUTCWD
    rts
str:
    .asciiz "/etc"

```
