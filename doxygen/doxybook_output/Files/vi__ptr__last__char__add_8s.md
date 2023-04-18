---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_last_char_add.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_last_char_add.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_last_char_add](Files/vi__ptr__last__char__add_8s.md#function-vi-ptr-last-char-add)**() |


## Functions Documentation

### function vi_ptr_last_char_add

```cpp
vi_ptr_last_char_add()
```




## Source code

```cpp
.proc vi_ptr_last_char_add

    ; A and X the value to add
    pha
    txa
    ldy     #vi_struct_data::ptr_last_char_file+1 ; 3737
    clc
    adc     (vi_struct),y
    sta     (vi_struct),y
    pla

    ldy     #vi_struct_data::ptr_last_char_file

    sec
    sbc     #$01

    clc
    adc     (vi_struct),y

    bcc     @do_not_inc_ptr_last_char
    pha
    iny
    lda     (vi_struct),y
    clc
    adc     #$01
    sta     (vi_struct),y
    dey
    pla

@do_not_inc_ptr_last_char:
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
