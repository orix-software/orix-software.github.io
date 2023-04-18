---
title: vi_shift_file_from_memory_one_char.s

---

# vi_shift_file_from_memory_one_char.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_shift_file_from_memory_one_char](Files/vi__shift__file__from__memory__one__char_8s.md#Routine-vi-shift-file-from-memory-one-char)** |


## Routine documentation

### Routine vi_shift_file_from_memory_one_char

```ca65
vi_shift_file_from_memory_one_char
```




## Source code

```ca65
.proc vi_shift_file_from_memory_one_char

    ldy     #vi_struct_data::ptr_last_char_file
    lda     (vi_struct),y
    sta     vi_ptr1 ; A4 A0 39
    iny
    lda     (vi_struct),y
    sta     vi_ptr1+1 ; 3A 3A 08

@copy_char_routine:
    ldy     #$00

    lda     (vi_ptr1),y
    iny
    sta     (vi_ptr1),y

    lda     vi_ptr1
    bne     @S1
    dec     vi_ptr1+1
@S1:
    dec     vi_ptr1


@L1:
    lda     vi_ptr1
    cmp     vi_ptr_file_used
    bne     @copy_char_routine

    lda     vi_ptr1+1
    cmp     vi_ptr_file_used+1
    bne     @copy_char_routine

    ldy     #$00

    lda     (vi_ptr1),y
    iny
    sta     (vi_ptr1),y

    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
