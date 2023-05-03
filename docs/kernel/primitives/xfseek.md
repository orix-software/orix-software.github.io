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

; [IN] X whence
; [IN] AY position 0 to 15
; [IN] RESB position 0 to 31
; [IN] RES fd

    .include "telestrat.inc"

    ldy   #$10
    lda   #$00
    tax
    sta   RESB
    sta   RESB+1

    lda   fp
    ldx   #SEEK_CUR
    BRK_TELEMON XFSEEK
    rts

```

!!! warning "XFSEEK is available since kernel v2022.2"

!!! bug  "XFSEEK have bugs for SEEK_CUR in 2022.4.1 (fixed in kernel 2023.1)"

!!! bug  "XFSEEK does not manage SEEK_END"
