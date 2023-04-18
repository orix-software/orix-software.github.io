---
title: vi_xpos_screen_plus_plus.s

---

# vi_xpos_screen_plus_plus.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_xpos_screen_plus_plus](Files/vi__xpos__screen__plus__plus_8s.md#Routine-vi-xpos-screen-plus-plus)** |


## Routine documentation

### Routine vi_xpos_screen_plus_plus

```ca65
vi_xpos_screen_plus_plus
```




## Source code

```ca65
; Returns in A=1 if we reached the eol

.proc vi_xpos_screen_plus_plus
    ; ypos_screen=ypos_screen+1
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    cmp     #VI_EDITOR_MAX_COLUMN
    beq     @no_add
    clc
    adc     #$01
    sta     (vi_struct),y
    lda     #$00
    rts

@no_add:
    lda     #$01
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
