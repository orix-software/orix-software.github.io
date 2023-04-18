---
title: vi_check_eof.s

---

# vi_check_eof.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_eof](Files/vi__check__eof_8s.md#Routine-vi-check-eof)** |


## Routine documentation

### Routine vi_check_eof

```ca65
vi_check_eof
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
