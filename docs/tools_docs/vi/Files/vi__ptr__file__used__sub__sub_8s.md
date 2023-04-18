---
title: vi_ptr_file_used_sub_sub.s

---

# vi_ptr_file_used_sub_sub.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_file_used_sub_sub](Files/vi__ptr__file__used__sub__sub_8s.md#Routine-vi-ptr-file-used-sub-sub)** |


## Routine documentation

### Routine vi_ptr_file_used_sub_sub

```ca65
vi_ptr_file_used_sub_sub
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
