---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_xpos_screen_plus_plus.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_xpos_screen_plus_plus.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_xpos_screen_plus_plus](Files/vi__xpos__screen__plus__plus_8s.md#function-vi-xpos-screen-plus-plus)**() |


## Functions Documentation

### function vi_xpos_screen_plus_plus

```cpp
vi_xpos_screen_plus_plus()
```




## Source code

```cpp
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

Updated on 2022-12-15 at 11:48:27 +0100
