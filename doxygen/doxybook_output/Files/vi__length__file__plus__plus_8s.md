---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_length_file_plus_plus.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_length_file_plus_plus.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_length_file_plus_plus](Files/vi__length__file__plus__plus_8s.md#function-vi-length-file-plus-plus)**() |


## Functions Documentation

### function vi_length_file_plus_plus

```cpp
vi_length_file_plus_plus()
```




## Source code

```cpp
.proc vi_length_file_plus_plus
    ; add length_file=length_file+1
    inc     vi_length_file
    bne     @S1
    inc     vi_length_file+1

@S1:
    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
