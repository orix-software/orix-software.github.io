---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_scroll_to_left.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_scroll_to_left.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_scroll_to_left](Files/vi__scroll__to__left_8s.md#function-vi-scroll-to-left)**() |


## Functions Documentation

### function vi_scroll_to_left

```cpp
vi_scroll_to_left()
```




## Source code

```cpp
.proc vi_scroll_to_left
    pha

    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    tay
@L3:
    lda     (vi_ptr_screen),y
    dey
    sta     (vi_ptr_screen),y
    iny
    iny
    cpy     #39
    bne     @L3
    pla
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
