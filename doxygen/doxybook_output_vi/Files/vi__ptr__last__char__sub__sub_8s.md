---
title: vi_ptr_last_char_sub_sub.s

---

# vi_ptr_last_char_sub_sub.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_last_char_sub_sub](Files/vi__ptr__last__char__sub__sub_8s.md#Routine-vi-ptr-last-char-sub-sub)** |


## Routine documentation

### Routine vi_ptr_last_char_sub_sub

```ca65
vi_ptr_last_char_sub_sub
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
