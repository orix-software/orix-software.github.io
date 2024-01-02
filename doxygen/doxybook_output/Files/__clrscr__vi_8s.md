---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/_clrscr_vi.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/_clrscr_vi.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[_clrscr_vi](Files/__clrscr__vi_8s.md#function--clrscr-vi)**() |


## Functions Documentation

### function _clrscr_vi

```cpp
_clrscr_vi()
```




## Source code

```cpp
.proc _clrscr_vi
    ; Switch to text mode
    BRK_TELEMON(XTEXT)

    lda     #<SCREEN                                ; Get position screen
    ldy     #>SCREEN
    sta     RES
    sty     RES+1

    ldy     #<(SCREEN+SCREEN_XSIZE*SCREEN_YSIZE)
    ldx     #>(SCREEN+SCREEN_XSIZE*SCREEN_YSIZE)
    lda     #' '
    BRK_TELEMON XFILLM                              ; Calls XFILLM : it fills A value from RES address and size of X and Y value
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
