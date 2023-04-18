---
title: vi_vi_ptr_file_used_plus_plus.s

---

# vi_vi_ptr_file_used_plus_plus.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_vi_ptr_file_used_plus_plus](Files/vi__vi__ptr__file__used__plus__plus_8s.md#Routine-vi-vi-ptr-file-used-plus-plus)** |


## Routine documentation

### Routine vi_vi_ptr_file_used_plus_plus

```ca65
vi_vi_ptr_file_used_plus_plus
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
