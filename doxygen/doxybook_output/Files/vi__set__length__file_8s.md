---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_set_length_file.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_set_length_file.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_length_file](Files/vi__set__length__file_8s.md#function-vi-set-length-file)**() |


## Functions Documentation

### function vi_set_length_file

```cpp
vi_set_length_file()
```




## Source code

```cpp

; A,X,Y RES contains the length

.proc vi_set_length_file
  ; set file length A and X contains the value

    pha
    jsr     populate_tmp0_16_with_ptr_length_file
    pla
    ldy     #$00
    sta     (tmp0_16),y
    txa
    iny
    sta     (tmp0_16),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
