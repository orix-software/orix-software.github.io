---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ypos_screen_sub_sub.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ypos_screen_sub_sub.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_ypos_screen_sub_sub](Files/vi__ypos__screen__sub__sub_8s.md#function-vi-ypos-screen-sub-sub)**() |


## Functions Documentation

### function vi_ypos_screen_sub_sub

```cpp
vi_ypos_screen_sub_sub()
```




## Source code

```cpp
; A returns 1 if y=0
; A returns 0 if y!=0

.proc vi_ypos_screen_sub_sub
    ; ypos_screen=ypos_screen-1
    ldy     #vi_struct_data::ypos_screen

    lda     (vi_struct),y
    beq     @no_substract
    sec
    sbc     #$01

    sta     (vi_struct),y
    lda     #$00
    rts
@no_substract:
    lda     #$01
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
