# FREAD macro

## description

Read byte from file

## Usage

fread ptr, size, count, fp

note:
* ptr may be : (ptr), address
* size may be: (ptr), address
* fp may be  : address, #value, {address,y}

## Output

A & X returns length in 16 bits

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_file.mac"

    fopen (MAN_SAVE_MALLOC_PTR), O_RDONLY
    cpx     #$FF
    bne     next

    cmp     #$FF
    bne     next
    ; Not found
    rts

next:
    ; Save FP
    sta     MAN_FP
    stx     MAN_FP+1
    fread (myptr), #1080, 1, MAN_FP ; myptr is from a malloc for example
    ; A and X contains number of bytes
    fclose(MAN_FP)
    rts
```

!!! tip "XFREAD returns the size in A & Y since kernel 2023.2"

See [XFREAD](../../../kernel/primitives/xfread) kernel primitive.
