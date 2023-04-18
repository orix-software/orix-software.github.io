---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_enter.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_enter.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_key_enter](Files/vi__key__enter_8s.md#function-vi-key-enter)**() |


## Functions Documentation

### function vi_key_enter

```cpp
vi_key_enter()
```




## Source code

```cpp
.proc vi_key_enter

    jsr     vi_editor_switch_off_cursor

    lda     #CR
    jsr     vi_add_char_to_text

    lda     #LF
    jsr     vi_add_char_to_text

    ; Are we on the last
    ; if xpos==0 then goto @check_others_cases
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    bne     @check_others_cases

    ; if ypos==VI_LAST_LINE_EDITOR then goto @scroll_last_line
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    cmp     #VI_LAST_LINE_EDITOR
    beq     @scroll_last_line
    tax
    scroll down,,26 ; Because the second empty arg is provided
    jsr     vi_ypos_screen_plus_plus
    rts
@scroll_last_line:
    scroll up,0,25 ; Because the second empty arg is provided
    rts

@check_others_cases:
    ; if ypos < VI_LAST_LINE_EDITOR then goto @scroll_for_insert
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    cmp     #VI_LAST_LINE_EDITOR
    bne     @scroll_for_insert

    ; else scrollup(0,26);
    scroll up,0,26

    jmp     @continue

@scroll_for_insert:

    sta     vi_tmp1
    ; if posx=0 then goto @we_are_at_pos_0 (scroll)
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    bne     @we_are_at_pos_0

    ; first_line_to_scroll++;
    inc     vi_tmp1

    ; if (ypos>26) then goto @last_line_case_scroll
    jsr     vi_ypos_screen_plus_plus
    cmp     #$00
    bne     @last_line_case_scroll
    jsr     vi_set_xpos_0
    rts
@we_are_at_pos_0:
    ; scrolldown(first_line_to_scroll,26)
    ldx     vi_tmp1
    inx
    scroll down,,26 ; Because the second empty arg is provided
    ; Now copy the current line
    jsr     vi_ypos_screen_plus_plus
    jsr     vi_compute_video_adress

    lda     vi_ptr_file_used
    sta     vi_ptr1

    lda     vi_ptr_file_used+1
    sta     vi_ptr1+1

@L1:
    ldy     #$00
    lda     (vi_ptr1),y
    cmp     #CR
    beq     @exit
    sta     (vi_ptr_screen),y

    sty     vi_tmp2

    inc     vi_ptr_screen ; 98
    bne     @out_compare
    inc     vi_ptr_screen+1
@out_compare:


    inc     vi_ptr1 ; 98
    bne     @out_compare2
    inc     vi_ptr1+1
@out_compare2:


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
    beq     @eof

@not_eof:

    jmp     @L1

@eof:
@exit:
    ;       Now we erase the char on the previous line

    jsr     vi_ypos_screen_sub_sub

    jsr     vi_compute_video_adress

    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    tay

    lda     #$00
@L2:
    sta     (vi_ptr_screen),y
    iny
    cpy     #VI_EDITOR_MAX_COLUMN
    bne     @L2

    jsr     vi_ypos_screen_plus_plus

    jsr     vi_set_xpos_0
    rts

@continue:
    jsr     vi_set_xpos_0
    jsr     vi_ypos_screen_plus_plus
    rts
@last_line_case_scroll:
    ;FIXME
    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
