---
title: vi_xpos_screen_sub_sub.s

---

# vi_xpos_screen_sub_sub.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_xpos_screen_sub_sub](Files/vi__xpos__screen__sub__sub_8s.md#Routine-vi-xpos-screen-sub-sub)** |


## Routine documentation

### Routine vi_xpos_screen_sub_sub

```ca65
vi_xpos_screen_sub_sub
```




## Source code

```ca65
.proc vi_xpos_screen_sub_sub
    ;; vi_xpos_screen_sub_sub
    ;; Return 00 if we are on the first line
    ;; xpos_screen=ypos_screen+1
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    beq     @no_substract
    sec
    sbc     #$01
    sta     (vi_struct),y
    lda     #$01
    rts
@no_substract:
    lda     #IS_BEGINNING_OF_THE_LINE
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
