---
title: /Routines/_clrscr_vi.s

---

# /Routines/_clrscr_vi.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[_clrscr_vi](Files/__clrscr__vi_8s.md#Routine--clrscr-vi)** |


## Routine documentation

### Routine _clrscr_vi

```ca65
_clrscr_vi
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
