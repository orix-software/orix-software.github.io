---
title: vi_ptr_last_char_plus_plus.s

---

# vi_ptr_last_char_plus_plus.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_last_char_plus_plus](Files/vi__ptr__last__char__plus__plus_8s.md#Routine-vi-ptr-last-char-plus-plus)** |


## Routine documentation

### Routine vi_ptr_last_char_plus_plus

```ca65
vi_ptr_last_char_plus_plus
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
