---
title: vi_check_beginning_of_file.s

---

# vi_check_beginning_of_file.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_beginning_of_file](Files/vi__check__beginning__of__file_8s.md#Routine-vi-check-beginning-of-file)** |


## Routine documentation

### Routine vi_check_beginning_of_file

```ca65
vi_check_beginning_of_file
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
