---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_if_previous_line_was_truncated.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_if_previous_line_was_truncated.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_if_previous_line_was_truncated](Files/vi__check__if__previous__line__was__truncated_8s.md#function-vi-check-if-previous-line-was-truncated)**() |


## Functions Documentation

### function vi_check_if_previous_line_was_truncated

```cpp
vi_check_if_previous_line_was_truncated()
```




## Source code

```cpp

.proc vi_check_if_previous_line_was_truncated


    lda     vi_ptr_file_used
    sta     vi_ptr1

    lda     vi_ptr_file_used+1
    sta     vi_ptr1+1

    ;vi_dec16_zp vi_ptr1

    lda     vi_ptr1
    bne     @S1
    dec     vi_ptr1+1
@S1:
    dec     vi_ptr1

    ldy     #$00
    lda     (vi_ptr1),y
    cmp     #$0A
    beq     @exit
    jsr     vi_ptr_file_used_plus_plus
@exit:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
