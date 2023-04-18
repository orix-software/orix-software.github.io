---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_last_char_sub_sub.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_last_char_sub_sub.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_last_char_sub_sub](Files/vi__ptr__last__char__sub__sub_8s.md#function-vi-ptr-last-char-sub-sub)**() |


## Functions Documentation

### function vi_ptr_last_char_sub_sub

```cpp
vi_ptr_last_char_sub_sub()
```




## Source code

```cpp
.proc vi_ptr_last_char_sub_sub
    ldy     #vi_struct_data::ptr_last_char_file
    iny
    lda     (vi_struct),y
    bne     @dec
    sec
    sbc     #$01
    sta     (vi_struct),y

@dec:
    dey
    lda     (vi_struct),y
    sec
    sbc     #$01
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
