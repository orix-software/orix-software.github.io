# FREAD macro

## description

Read byte from file

## usage

fread ptr, size, count, fp

note:
ptr may be : (ptr), address
size may be: (ptr), address
fp may be  : address, #value, {address,y}


## Output

A & X returns length in 16 bits

## Example

```ca65
    .include "telestrat.inc"

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
    fread (myptr), 1080, 1, MAN_FP ; myptr is from a malloc for example
    fclose(MAN_FP)
    rts
```

See [XFREAD](../kernel/primitives/xfread) kernel primitive.
