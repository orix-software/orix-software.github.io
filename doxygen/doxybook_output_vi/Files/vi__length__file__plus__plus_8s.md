---
title: vi_length_file_plus_plus.s

---

# vi_length_file_plus_plus.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_length_file_plus_plus](Files/vi__length__file__plus__plus_8s.md#Routine-vi-length-file-plus-plus)** |


## Routine documentation

### Routine vi_length_file_plus_plus

```ca65
vi_length_file_plus_plus
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
