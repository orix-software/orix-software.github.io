---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_set_xpos_from_A.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_set_xpos_from_A.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_xpos_from_A](Files/vi__set__xpos__from__A_8s.md#function-vi-set-xpos-from-a)**() |


## Functions Documentation

### function vi_set_xpos_from_A

```cpp
vi_set_xpos_from_A()
```




## Source code

```cpp
.proc vi_set_xpos_from_A
    ldy     #vi_struct_data::xpos_screen
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
