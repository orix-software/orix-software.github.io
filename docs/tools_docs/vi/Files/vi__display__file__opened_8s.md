---
title: vi_display_file_opened.s

---

# vi_display_file_opened.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_display_file_opened](Files/vi__display__file__opened_8s.md#Routine-vi-display-file-opened)** |


## Routine documentation

### Routine vi_display_file_opened

```ca65
vi_display_file_opened
```




## Source code

```ca65
.proc vi_display_file_opened

@loop:

    ; Do we reached eof ?
    ldy     #vi_struct_data::ptr_last_char_file
    lda     (vi_struct),y
    sta     vi_tmp1

    lda     vi_ptr1
    cmp     vi_tmp1
    bne     @not_eof

    ldy     #vi_struct_data::ptr_last_char_file+1
    lda     (vi_struct),y
    sta     vi_tmp1

    lda     vi_ptr1+1
    cmp     vi_tmp1
    bne     @not_eof

    rts

@not_eof:
    ldy     #$00
    lda     (vi_ptr1),y

    ldx     #VI_FILL_SCREEN_MODE_STOP_AT_THE_END_OF_LAST_LINE
    jsr     vi_put_char

    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    cmp     #VI_LAST_LINE_EDITOR
    beq     @compute_empty_line

    inc     vi_ptr1
    bne     @S30
    inc     vi_ptr1+1
@S30:

    jmp     @loop

@do_not_add_high_to_ptr:

     lda     vi_length_file_compute
     bne     @dec_low
     dec     vi_length_file_compute+1

@dec_low:
     dec     vi_length_file_compute
     bne     @loop
     lda     vi_length_file_compute+1
     bne     @loop


@compute_empty_line:
    ; display last line
    lda     vi_ptr1
    ldy     vi_ptr1+1
    jsr     vi_fill_last_line
    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
