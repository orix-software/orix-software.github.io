---
title: vi_scroll_to_left.s

---

# vi_scroll_to_left.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_scroll_to_left](Files/vi__scroll__to__left_8s.md#Routine-vi-scroll-to-left)** |


## Routine documentation

### Routine vi_scroll_to_left

```ca65
vi_scroll_to_left
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
