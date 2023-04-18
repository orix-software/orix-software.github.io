---
title: vi_set_ptr_last_char.s

---

# vi_set_ptr_last_char.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_ptr_last_char](Files/vi__set__ptr__last__char_8s.md#Routine-vi-set-ptr-last-char)** |


## Routine documentation

### Routine vi_set_ptr_last_char

```ca65
vi_set_ptr_last_char
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
