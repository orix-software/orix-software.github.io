# XFSEEK

Available since kernel 2022.2

## Description

Seek into file or can send the length of a file or the position into the file (With a 0 position for XFSEEK).

It's not possible to send negative position to XFSEEK. It's always a long unsigned

## Input

* X whence
* AY : position 0 to 15 bits (word) unsigned
* RESB : position 16 to 32 bits(word) unsied
* RES : fd (but only I byte is managed)

## Modify

* RES5 (2 bytes) $0A & $0B
* TR0
* TR4
* TR7

## Output

Since kernel 2025.3

* Return A X RES and RES + 1 = $FF if whence is not recognize or 'fd' is not recognized
* Return A X RES and RES + 1 >= 0 if seek has been performed

Before kernel 2025.3

* Return A=EINVAL if whence is not recognize
* Return A=EOK if seek has been performed
* Return A=$FF if something is wrong when seek has performed

## Example

``` ca65
; Move to $20 bytes in the file from the current position

; [IN] X whence
; [IN] AY position 0 to 15
; [IN] RESB position 0 to 31
; [IN] RES fd

    .include "telestrat.inc"
    .include "stdio.inc"

    ldy   #$10
    lda   #$00
    tax
    sta   RESB
    sta   RESB + 1

    lda   fp
    ldx   #SEEK_CUR
    BRK_TELEMON XFSEEK
    ; Output since kernel 2025.3
    ;  A and X contains new position (0 to 15 bits)
    ;  RES (2 bytes) returns (16 to 31 bits, eg RES contains 16 to 23 bits and RES+1 contains 23 to 31 bits)
    ;  Or if something is wrong A, X and RES and RES + 1 contains $FF (-1)
    ; Before kernel 2025.3
    ;  A returns EOK if it's OK or #FF if something goes wrong.
    rts

```

!!! info "XFSEEK closes previous file usb controler, and opens new file if it switches between 2 files. It's the same behavior for XWRITE/XFREAD. If BYTE_LOCATE from usb controler failed, it will always returns -1"

!!! warning "XFSEEK now returns fp current position in AX and RES, it now never returns any error as EBADF or EINVAL, it returns -1 (#FFFFFFFF in AX and RES) since kernel v2026.1"

!!! warning "XFSEEK is available since kernel v2022.2"

!!! bug "XFSEEK have bugs for SEEK_CUR in 2022.4.1 (fixed in kernel 2023.1)"

!!! bug "XFSEEK does not manage SEEK_END"
