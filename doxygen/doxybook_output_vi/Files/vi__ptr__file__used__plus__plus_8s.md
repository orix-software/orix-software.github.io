---
title: vi_ptr_file_used_plus_plus.s

---

# vi_ptr_file_used_plus_plus.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_file_used_plus_plus](Files/vi__ptr__file__used__plus__plus_8s.md#Routine-vi-ptr-file-used-plus-plus)** |


## Routine documentation

### Routine vi_ptr_file_used_plus_plus

```ca65
vi_ptr_file_used_plus_plus
```




## Source code

```ca65
.proc  vi_ptr_file_used_plus_plus
    inc     vi_ptr_file_used
    bne     @out
    inc     vi_ptr_file_used+1
@out:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
