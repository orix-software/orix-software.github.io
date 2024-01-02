---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_eof.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_eof.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_eof](Files/vi__check__eof_8s.md#function-vi-check-eof)**() |


## Functions Documentation

### function vi_check_eof

```cpp
vi_check_eof()
```




## Source code

```cpp
.proc vi_check_eof
    ; return in A 00 if eof
    ; returns in A 01 if not eof

   ; Do we reached eof ?
    ldy     #vi_struct_data::ptr_last_char_file
    lda     (vi_struct),y
    sta     vi_tmp1

    lda     vi_ptr_file_used
    cmp     vi_tmp1
    bne     @not_eof

    ldy     #vi_struct_data::ptr_last_char_file+1
    lda     (vi_struct),y
    sta     vi_tmp1

    lda     vi_ptr_file_used+1
    cmp     vi_tmp1
    bne     @not_eof
@is_eof:
    lda     #IS_EOF ; EOF
    rts

@is_eof_before:
    jsr     vi_ptr_file_used_plus_plus
    jmp     @is_eof

@not_eof:

@not_last_line:
    lda     #$01 ; Not eof
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
