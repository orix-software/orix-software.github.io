---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_file_used_sub_sub.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_file_used_sub_sub.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_file_used_sub_sub](Files/vi__ptr__file__used__sub__sub_8s.md#function-vi-ptr-file-used-sub-sub)**() |


## Functions Documentation

### function vi_ptr_file_used_sub_sub

```cpp
vi_ptr_file_used_sub_sub()
```




## Source code

```cpp
.proc  vi_ptr_file_used_sub_sub

    jsr     vi_check_beginning_of_file
    cmp     #IS_BEGINNING_OF_THE_FILE
    beq     @beginning_of_file

    lda     vi_ptr_file_used ; 98
    bne     @out
    dec     vi_ptr_file_used+1
@out:
    dec     vi_ptr_file_used
    lda     #$01
    rts

@beginning_of_file:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
