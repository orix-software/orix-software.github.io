---
title: vi_length_file_sub_sub.s

---

# vi_length_file_sub_sub.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_length_file_sub_sub](Files/vi__length__file__sub__sub_8s.md#Routine-vi-length-file-sub-sub)** |


## Routine documentation

### Routine vi_length_file_sub_sub

```ca65
vi_length_file_sub_sub
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
