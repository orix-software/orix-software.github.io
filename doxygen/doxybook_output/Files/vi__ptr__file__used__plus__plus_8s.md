---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_file_used_plus_plus.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_ptr_file_used_plus_plus.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_ptr_file_used_plus_plus](Files/vi__ptr__file__used__plus__plus_8s.md#function-vi-ptr-file-used-plus-plus)**() |


## Functions Documentation

### function vi_ptr_file_used_plus_plus

```cpp
vi_ptr_file_used_plus_plus()
```




## Source code

```cpp
.proc  vi_ptr_file_used_plus_plus
    inc     vi_ptr_file_used
    bne     @out
    inc     vi_ptr_file_used+1
@out:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
