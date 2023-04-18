---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_up.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_up.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_key_up](Files/vi__key__up_8s.md#function-vi-key-up)**() |


## Functions Documentation

### function vi_key_up

```cpp
vi_key_up()
```




## Source code

```cpp
.proc vi_key_up
    ; Debut du fichier ? On sort
    jsr     vi_check_beginning_of_file
    cmp     #IS_BEGINNING_OF_THE_FILE
    beq     @stop_shorter

    ; On eteint le curseur
    jsr     vi_editor_switch_off_cursor

    ; On force à revenir à la position X=0 de la ligne précécente : FIXME
    jsr     vi_set_xpos_0

@continue_up:
    ; Checking if previous char is not $0A or $0D if it's not the case, it's on a truncated line

    ; On va voir si la prédente ligne c'est une fin de ligne ou pas
    lda     vi_ptr_file_used
    sta     vi_ptr1

    lda     vi_ptr_file_used+1
    sta     vi_ptr1+1

    lda     vi_ptr1 ; 98     ; On décrémente la copie de ptr_file_used pour lire le caractère précédent
    bne     @out_compare
    dec     vi_ptr1+1
@out_compare:
    dec     vi_ptr1

    ldy     #$00
    lda     (vi_ptr1),y
    cmp     #LF
    beq     @search_previous_line

    ;ldy     #$00
    lda     (vi_ptr1),y
    cmp     #CR
    beq     @search_previous_line

    lda     vi_ptr1 ; 98
    bne     @out_compare2
    dec     vi_ptr1+1
@out_compare2:
    dec     vi_ptr1

    ldy     #$00
    lda     (vi_ptr1),y
    cmp     #CR
    beq     @search_previous_line

    ; Check if the

    jsr     vi_ypos_screen_sub_sub


    jsr     vi_search_previous_line_beginning ; Looking for previous line ($0D detection)


    jsr     vi_ptr_file_used_sub_sub            ; Skip $0D

    cpx     #VI_EDITOR_MAX_COLUMN+1
    bcc     @skip_y_plusplus

    jsr     vi_ypos_screen_sub_sub

@skip_y_plusplus:

    jsr     vi_search_previous_line_beginning ; Looking for previous line ($0D detection)

    jsr     vi_ptr_file_used_plus_plus

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #LF
    bne     @S10
    jsr     vi_ptr_file_used_plus_plus
@S10:


@stop_shorter:
    rts


@search_previous_line:
    jsr     vi_search_previous_line_beginning ; Looking for previous line ($0D detection)
    cmp     #$00
    beq     @exit

    jsr     vi_search_previous_line_beginning
    cmp     #$00
    beq     @exit

    cpx     #VI_EDITOR_MAX_COLUMN
    bcc     @no_line_greater_than_39_chars


    jsr     vi_ptr_file_used_plus_plus

    ldx     #$00
@looking_for_truncated_line:
    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @finished
    cmp     #LF
    beq     @skip_inx
    inx
@skip_inx:
    jsr     vi_ptr_file_used_plus_plus

    cpx     #VI_EDITOR_MAX_COLUMN+1
    bne     @looking_for_truncated_line
    ldx     #$00
    beq     @looking_for_truncated_line

@finished:
    jsr     vi_ypos_screen_sub_sub

    txa
    jsr     vi_set_xpos_from_A
    rts

@no_line_greater_than_39_chars:
    jsr     vi_ptr_file_used_plus_plus

    ldy     #$00
    jsr     vi_check_0A

@exit:
    ; Check if posx=0 and not the beginning of the file
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    bne     @stop

    scroll down, 0, 26

    ldx     #$01
    stx     vi_savex

    ldx     vi_savex
    cpx     #$00
    beq     @stop

    ldy     #$00
@L1:
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @stop
    sta     VI_EDITION_VIDEO_ADRESS,y
    iny
    cpy     #VI_EDITOR_MAX_COLUMN
    beq     @stop
    bne     @L1

@stop:
    jsr     vi_ypos_screen_sub_sub
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
