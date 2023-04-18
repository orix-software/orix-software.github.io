---
title: vi_set_xpos_0.s

---

# vi_set_xpos_0.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_xpos_0](Files/vi__set__xpos__0_8s.md#Routine-vi-set-xpos-0)** |


## Routine documentation

### Routine vi_set_xpos_0

```ca65
vi_set_xpos_0
```




## Source code

```ca65
.proc vi_set_xpos_0
    ldy     #vi_struct_data::xpos_screen
    lda     #$00
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
