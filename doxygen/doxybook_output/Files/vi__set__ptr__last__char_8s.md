---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_set_ptr_last_char.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_set_ptr_last_char.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_ptr_last_char](Files/vi__set__ptr__last__char_8s.md#function-vi-set-ptr-last-char)**() |


## Functions Documentation

### function vi_set_ptr_last_char

```cpp
vi_set_ptr_last_char()
```




## Source code

```cpp
.proc vi_set_ptr_last_char
    ; A and X contains the last char ptr

    ldy     #vi_struct_data::ptr_last_char_file
    sta     (vi_struct),y
    txa
    iny
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
