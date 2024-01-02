---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_beginning_of_file.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_beginning_of_file.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_beginning_of_file](Files/vi__check__beginning__of__file_8s.md#function-vi-check-beginning-of-file)**() |


## Functions Documentation

### function vi_check_beginning_of_file

```cpp
vi_check_beginning_of_file()
```




## Source code

```cpp
; A returns 00 if beginning of the file, 01 if not

.proc vi_check_beginning_of_file
    lda     vi_ptr_file_used
    cmp     vi_ptr_file
    bne     @not_beginning

    lda     vi_ptr_file_used+1
    cmp     vi_ptr_file+1
    bne     @not_beginning

    lda     #IS_BEGINNING_OF_THE_FILE ; Beginninng of the file
    rts

@not_beginning:
    lda     #$01 ; Not the Beginninng of the file
    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
