---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_set_xpos_0.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_set_xpos_0.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_xpos_0](Files/vi__set__xpos__0_8s.md#function-vi-set-xpos-0)**() |


## Functions Documentation

### function vi_set_xpos_0

```cpp
vi_set_xpos_0()
```




## Source code

```cpp
.proc vi_set_xpos_0
    ldy     #vi_struct_data::xpos_screen
    lda     #$00
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
