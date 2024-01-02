---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ypos_screen_plus_plus.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ypos_screen_plus_plus.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_ypos_screen_plus_plus](Files/vi__ypos__screen__plus__plus_8s.md#function-vi-ypos-screen-plus-plus)**() |


## Functions Documentation

### function vi_ypos_screen_plus_plus

```cpp
vi_ypos_screen_plus_plus()
```




## Source code

```cpp
.proc vi_ypos_screen_plus_plus
    ; ypos_screen=ypos_screen+1
    ; Returns 01 in A if we reached the last line
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    cmp     #VI_LAST_LINE_EDITOR
    beq     @no_add
    clc
    adc     #$01
    sta     (vi_struct),y
    lda     #$00
    rts
@no_add:
    ;
    lda     #IS_LAST_LINE_OF_SCREEN_TEXT
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
