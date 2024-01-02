---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_compute_last_text_line.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_compute_last_text_line.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_compute_last_text_line](Files/vi__compute__last__text__line_8s.md#function-vi-compute-last-text-line)**() |


## Functions Documentation

### function vi_compute_last_text_line

```cpp
vi_compute_last_text_line()
```




## Source code

```cpp
.proc vi_compute_last_text_line
    ; A & Y the current ptr
    ; X the id of the text line ?
    sta     vi_ptr2
    sty     vi_ptr2+1

    stx     vi_tmp2

    lda     #VI_LAST_LINE_EDITOR
    sec
    sbc     vi_tmp2
    sta     vi_tmp2


@L1:


    jsr     check_eof_vi_ptr2
    cmp     #IS_EOF
    beq     @exit
    ldy     #$00
    lda     (vi_ptr2),y
    cmp     #CR
    beq     @found

@continue:
    inc     vi_ptr2
    bne     @out_compare
    inc     vi_ptr2+1
@out_compare:
    jmp     @L1

@found:

    inc     vi_ptr2
    bne     @out_compare2
    inc     vi_ptr2+1
@out_compare2:

    jsr     check_eof_vi_ptr2
    cmp     #IS_EOF
    beq     @exit

    lda     (vi_ptr2),y
    cmp     #LF
    bne     @S1

    inc     vi_ptr2
    bne     @out_compare3
    inc     vi_ptr2+1
@out_compare3:

    jsr     check_eof_vi_ptr2
    cmp     #IS_EOF
    beq     @exit


@S1:
    dec     vi_tmp2
    bne     @continue
@exit:
    lda     vi_ptr2
    ldy     vi_ptr2+1

    rts


check_eof_vi_ptr2:
    ldy     #vi_struct_data::ptr_last_char_file
    lda     (vi_struct),y
    sta     vi_tmp1

    lda     vi_ptr2
    cmp     vi_tmp1
    bne     @not_eof

    ldy     #vi_struct_data::ptr_last_char_file+1
    lda     (vi_struct),y
    sta     vi_tmp1

    lda     vi_ptr2+1
    cmp     vi_tmp1
    bne     @not_eof

    lda     #IS_EOF
    rts

@not_eof:
    lda     #$01
    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
