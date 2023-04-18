---
title: vi_fill_last_line.s

---

# vi_fill_last_line.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_fill_last_line](Files/vi__fill__last__line_8s.md#Routine-vi-fill-last-line)** |


## Routine documentation

### Routine vi_fill_last_line

```ca65
vi_fill_last_line
```




## Source code

```ca65
.proc vi_fill_last_line

    ; A and Y contains the ptr on the file to display on the last line
    sta     vi_ptr1
    sty     vi_ptr1+1

    ldx     #$00
@compute_empty_line_loop:
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
    ; reached the end of the file
    rts

@not_eof:
    inc     vi_ptr1
    bne     @S40
    inc     vi_ptr1+1

@S40:
    ldy     #$00
    lda     (vi_ptr1),y
    cmp     #CR
    beq     @exit
    cmp     #LF
    beq     @compute_empty_line_loop
    sta     VI_EDITION_LAST_VIDEO_ADRESS,x
    inx
    cpx     #VI_EDITOR_MAX_COLUMN+1
    beq     @exit
    jmp     @compute_empty_line_loop

@exit:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
