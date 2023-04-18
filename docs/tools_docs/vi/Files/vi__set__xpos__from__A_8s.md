---
title: vi_set_xpos_from_A.s

---

# vi_set_xpos_from_A.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_xpos_from_A](Files/vi__set__xpos__from__A_8s.md#Routine-vi-set-xpos-from-a)** |


## Routine documentation

### Routine vi_set_xpos_from_A

```ca65
vi_set_xpos_from_A
```




## Source code

```ca65
.proc vi_set_xpos_from_A
    ldy     #vi_struct_data::xpos_screen
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
