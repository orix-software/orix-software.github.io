---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_vi_ptr_file_used_plus_plus.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_vi_ptr_file_used_plus_plus.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_vi_ptr_file_used_plus_plus](Files/vi__vi__ptr__file__used__plus__plus_8s.md#function-vi-vi-ptr-file-used-plus-plus)**() |


## Functions Documentation

### function vi_vi_ptr_file_used_plus_plus

```cpp
vi_vi_ptr_file_used_plus_plus()
```




## Source code

```cpp
.proc vi_vi_ptr_file_used_plus_plus
    ; A the char to add
    ; Insert into file (memory) char
    inc     vi_ptr_file_used
    bne     @no_inc
    inc     vi_ptr_file_used+1
@no_inc:

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
