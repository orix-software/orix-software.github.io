---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_last_char_plus_plus.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_last_char_plus_plus.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_last_char_plus_plus](Files/vi__ptr__last__char__plus__plus_8s.md#function-vi-ptr-last-char-plus-plus)**() |


## Functions Documentation

### function vi_ptr_last_char_plus_plus

```cpp
vi_ptr_last_char_plus_plus()
```




## Source code

```cpp
.proc vi_ptr_last_char_plus_plus

    ldy     #vi_struct_data::ptr_last_char_file
    lda     (vi_struct),y
    clc
    adc     #$01
    bcc     @S1
    pha
    iny
    lda     (vi_struct),y
    clc
    adc     #$01
    sta     (vi_struct),y
    dey
    pla
@S1:
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
