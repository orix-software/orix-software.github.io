---
title: vi_display_char.s

---

# vi_display_char.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_display_char](Files/vi__display__char_8s.md#Routine-vi-display-char)** |


## Routine documentation

### Routine vi_display_char

```ca65
vi_display_char
```




## Source code

```ca65
.proc vi_display_char
    sta     vi_tmp2

    ; Avoid to display a line greater than 80 chars ?

    lda     vi_ptr_file_used
    ldy     vi_ptr_file_used+1
    jsr     vi_strlen_current_line

    cpx     #80-1
    bcc     @add_char
    rts
@add_char:
@not_eol:
    jsr     vi_editor_switch_off_cursor

    jsr     vi_check_eof

    cmp     #IS_EOF ; Is eof ?
    beq     @not_eof


    jsr     vi_shift_file_from_memory_one_char
    ; Scroll now
    ; if posx==VI_EDITOR_MAX_COLUMN then skip scroll

    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    cmp     #VI_EDITOR_MAX_COLUMN
    bne     @scroll

    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    tay
    lda     vi_tmp2 ; get char
    sta     (vi_ptr_screen),y

    ldy     #$00
    sta     (vi_ptr_file_used),y ; Insert into file
    jsr     vi_vi_ptr_file_used_plus_plus

    jsr     vi_set_xpos_0

    jsr     vi_ypos_screen_plus_plus

    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    cmp     #VI_LAST_LINE_EDITOR
    beq     @scroll_last_line
    tax
    scroll down,,26 ; Because the second empty arg is provided

@scroll_last_line:
    ; FIXME

    rts

@scroll:
    jsr     vi_scroll_from_left_to_right_full_line




@not_eof:
    ; Check if we need to scroll

    jsr     vi_check_inserted_char_overflow_the_max_column

    cmp     #$03
    beq     @scroll_screen
    cmp     #$01
    beq     @L100
    bne     @line_not_full

@scroll_screen:

    ; jsr     vi_ypos_screen_plus_plus
    ; cmp     #$01 ; We are on the last line
    ; bne     @not_last_line
    ; ; Code for lastline

@not_last_line:
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    tax
    inx

    scroll down, , 26            ; Yes scroll

@L100:

    ; scroll the next line
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    clc
    adc     #$01
    pha
    jsr     vi_shift_line_left_to_right_editor
    pla
    tay
    lda     TABLE_LOW_TEXT,y
    sta     vi_ptr1
    lda     TABLE_HIGH_TEXT,y
    sta     vi_ptr1+1


    ldy     #vi_struct_data::xpos_screen
    lda     #VI_EDITOR_MAX_COLUMN+1
    sec
    sbc     (vi_struct),y


    tay
    lda     (vi_ptr_file_used),y
    ldy     #$00
    sta     (vi_ptr1),y





@line_not_full:
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    tay
    lda     vi_tmp2 ; get char
    sta     (vi_ptr_screen),y

    sty     vi_tmp1

    ldy     #$00
    sta     (vi_ptr_file_used),y ; Insert into file

    jsr     vi_vi_ptr_file_used_plus_plus
    jsr     vi_ptr_last_char_plus_plus
    jsr     vi_length_file_plus_plus


;     ; end_insert char on screen


    jsr     vi_xpos_screen_plus_plus
    cmp     #$01    ; Are we on the end of line ?
    bne     @exit

    jsr     vi_ypos_screen_plus_plus

    ; x=0
    lda     #$00
    ldy     #vi_struct_data::xpos_screen
    sta     (vi_struct),y
@exit:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
