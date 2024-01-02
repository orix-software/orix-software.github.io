---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_length_file_sub_sub.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_length_file_sub_sub.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_length_file_sub_sub](Files/vi__length__file__sub__sub_8s.md#function-vi-length-file-sub-sub)**() |


## Functions Documentation

### function vi_length_file_sub_sub

```cpp
vi_length_file_sub_sub()
```




## Source code

```cpp
.proc vi_length_file_sub_sub
    ; add length_file=length_file--
    lda     vi_length_file
    bne     @out
    dec     vi_length_file+1

@out:
    dec     vi_length_file
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
