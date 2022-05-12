# XFSEEK

Available in kernel 2022.2

## Description

Seek into file

## Input

* X whence
* AY : position 0 to 15 bits (word)
* RESB : position 16 to 32 bits(word)
* RES : fd (but only I byte is managed)

## Output

* Return A=EINVAL if whence is not recognize
* Return A=EOK if seek has been performed
* Return A=$FF if something is wrong when seek has performed

## Code

## Example

``` ca65
; Move to $20 bytes in the file from the current position
ldx   #SEEK_CUR

ldy   #$10
lda   #$00
tax
sta   RESB
sta   RESB+1
ldx   fp
BRK_TELEMON XFSEEK
 

```
!!! warning "XFSEEK is available since kernel v2022.2"

