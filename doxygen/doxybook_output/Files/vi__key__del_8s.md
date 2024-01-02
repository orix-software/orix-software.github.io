---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_del.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_del.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_manage_del](Files/vi__key__del_8s.md#function-vi-manage-del)**() |
| | **[vi_remove_char_in_text_file](Files/vi__key__del_8s.md#function-vi-remove-char-in-text-file)**() |
| | **[vi_decal_text_left_to_right](Files/vi__key__del_8s.md#function-vi-decal-text-left-to-right)**() |


## Functions Documentation

### function vi_manage_del

```cpp
vi_manage_del()
```


### function vi_remove_char_in_text_file

```cpp
vi_remove_char_in_text_file()
```


### function vi_decal_text_left_to_right

```cpp
vi_decal_text_left_to_right()
```




## Source code

```cpp
.proc vi_manage_del
    ; Check if we are at the beginning of the file

    jsr     vi_check_beginning_of_file
    cmp     #IS_BEGINNING_OF_THE_FILE
    bne     @delete_char
    rts

@delete_char:
    jsr     vi_editor_switch_off_cursor

    ; if xpos==0 then goto @first_colomn else goto @not_first_column
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    cmp     #$00                ; First column ?
    bne     @not_first_column
    ; First column
@first_colomn:
    ; Does a $0D under the cursor (X=0 and current_char==0x0D ?) yes, scroll and remove the char
    ; if    file[posfile]=='\n' then goto


    ldy     #$01
    lda     (vi_ptr_file_used),y
    cmp     #LF
    bne     @remove_char_from_the_first_column
    ; remove 0A

    jsr     vi_remove_char_in_text_file

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    bne     @do_not_move_twice

    ; for $0A
    jsr     vi_remove_char_in_text_file

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    bne     @check_0A
    jsr     vi_ptr_file_used_plus_plus

@check_0A:

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #LF
    bne     @not_0A
    jsr     vi_ptr_file_used_plus_plus

@not_0A:


@do_not_move_twice:

    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    tax
    ;inx
    scroll up,,26 ; Because the second  arg is provided
    ;jsr     vi_ypos_screen_sub_sub


    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    tax
    inx
    lda     vi_ptr_file_used
    ldy     vi_ptr_file_used+1


    jsr     vi_compute_last_text_line
    jsr     vi_fill_last_line
    rts

@not_first_column:
    tay
    jsr     vi_scroll_to_left

    jsr     vi_xpos_screen_sub_sub

@dec_ptr_and_move_file:
    jsr     vi_remove_char_in_text_file

@out:
    rts


@remove_char_from_the_first_column:
    ; For 0A


    ; Editor management part

    ; search the last char of the previous line to concat

    lda     vi_ptr_file_used
    ldy     vi_ptr_file_used+1

    jsr     vi_search_previous_cr ; Search the previous \n

    ; Don't put anything here, a and Y are kept for next vi_search_previous_cr


    jsr     vi_search_previous_cr ; Search the first previous line \n

    stx     vi_tmp3 ; Save the number of char found

    jsr     vi_remove_char_in_text_file

    ; For 0D
    jsr     vi_remove_char_in_text_file

    jsr     vi_ypos_screen_sub_sub

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
    ldy     vi_tmp3

    sta     (vi_ptr_screen),y

    inc     vi_ptr_screen
    bne     @out_compare
    inc     vi_ptr_screen+1
@out_compare:


    inc     vi_ptr1 ; 98
    bne     @out_compare2
    inc     vi_ptr1+1
@out_compare2:

    jmp     @L1


@exit:
    lda     vi_tmp3
    jsr     vi_set_xpos_from_A

    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    tax
    inx
    scroll up,,26 ; Because the second empty arg is provided

    rts



    ; And of previous empty line management

@not_an_empty_line:
    jsr     vi_ypos_screen_sub_sub

    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    tax

    scroll up,,26 ; Because the second empty arg is provided

    rts


.endproc

.proc vi_remove_char_in_text_file
    ; Remove a char in the text file in the current position
    jsr     vi_ptr_file_used_sub_sub
    jsr     vi_ptr_last_char_sub_sub
    jsr     vi_decal_text_left_to_right
    jsr     vi_length_file_sub_sub
    rts
.endproc

.proc   vi_decal_text_left_to_right
    lda     vi_ptr_file_used
    sta     vi_ptr1
    lda     vi_ptr_file_used+1
    sta     vi_ptr1+1

@restart:
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

    ldy     #$01
    lda     (vi_ptr1),y
    dey
    sta     (vi_ptr1),y

    inc     vi_ptr1
    bne     @out2
    inc     vi_ptr1+1
@out2:

    rts


@not_eof:
    ldy     #$01
    lda     (vi_ptr1),y
    dey
    sta     (vi_ptr1),y

    inc     vi_ptr1
    bne     @out
    inc     vi_ptr1+1
@out:
    jmp     @restart


    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
