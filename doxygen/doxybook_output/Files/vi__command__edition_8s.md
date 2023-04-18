---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_command_edition.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_command_edition.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_command_edition](Files/vi__command__edition_8s.md#function-vi-command-edition)**() |


## Functions Documentation

### function vi_command_edition

```cpp
vi_command_edition()
```




## Source code

```cpp
.proc vi_command_edition

    jsr     vi_clear_command_line
    ldy     #vi_struct_data::xpos_command_line
    lda     #$01
    sta     (vi_struct),y

    lda     #':'
    sta     VI_COMMANDLINE_VIDEO_ADRESS

    ldy     #vi_struct_data::command_line_buffer
    sta     (vi_struct),y ; Insert :

@read_keyboard:
    cgetc
    cmp     #KEY_RIGHT
    beq     @read_keyboard
    cmp     #KEY_LEFT
    beq     @read_keyboard
    cmp     #KEY_UP
    beq     @read_keyboard
    cmp     #KEY_DOWN
    beq     @read_keyboard
    cmp     #KEY_ESC
    beq     @exit
    cmp     #KEY_DEL
    beq     @del
    cmp     #KEY_RETURN
    beq     @execute_command_line
    sta     vi_tmp1
    ldy     #vi_struct_data::xpos_command_line
    lda     (vi_struct),y
    cmp     #39 ; End of line ?
    beq     @read_keyboard
    tay
    lda     vi_tmp1
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y



    iny
    tya
    ldy     #vi_struct_data::xpos_command_line
    sta     (vi_struct),y

    jmp     @read_keyboard

@exit:
    jsr     vi_clear_command_line
    lda     #$00
    rts
@del:
    ldy     #vi_struct_data::xpos_command_line
    lda     (vi_struct),y
    cmp     #$01
    beq     @erase_char_and_exit
    ; Erase char on screen
    pha
    tay
    lda     #' '
    dey
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    pla

    ; Erase char into command_line_buffer
    pha
    clc
    adc     #vi_struct_data::command_line_buffer
    tay
    lda     #$00 ; EOS
    sta     (vi_struct),y ; Insert :
    pla

    ; dec pos
    tay
    dey
    tya
    ldy     #vi_struct_data::xpos_command_line
    sta     (vi_struct),y

    jmp     @read_keyboard

@erase_char_and_exit:
    lda     #' '
    sta     VI_COMMANDLINE_VIDEO_ADRESS
    lda     #$00
    rts


@execute_command_line:
    ldy     #$01
@read_commandline:
    sty     vi_tmp2
    lda     VI_COMMANDLINE_VIDEO_ADRESS,y
    cmp     #'q'
    beq     @exit_vi
    cmp     #'w'
    beq     @write_file
    cmp     #KEY_ESC
    beq     @key_esc
    lda     #$00
    rts
@key_esc:
    jsr     vi_clear_command_line
    lda     #$00
    rts
@exit_vi:
    lda     #$01
    rts
@write_file:
    sty     vi_tmp2

    ; Check if we have an arg (filename)

    iny

    lda     VI_COMMANDLINE_VIDEO_ADRESS,y
    cmp     #' '            ; If it's a space after w, then there is an arg
    beq     @filename_in_argument

@file_inserted:
    dey

    lda     vi_fileopened
    beq     @display_missing_filename


;     lda     vi_struct+1
;     sta     vi_arg1+1

;     lda     #vi_struct_data::name_file_open
;     clc
;     adc     vi_struct
;     bcc     @no_inc_arg1
;     inc     vi_arg1+1
; @no_inc_arg1:
;     sta     vi_arg1

    jsr     @vi_open_and_write_file


    ; Clear

    jsr     vi_clear_command_line

    ldy     #$00
@loop_written:
    lda     msg_written,y
    beq     @out

    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny
    jmp     @loop_written

@out:
    ldy     vi_tmp2
    iny
    jmp     @read_commandline

@filename_in_argument:
    iny     ; skip space
    tya
    tax

    lda     #$01
    sta     vi_fileopened

    ldy     #vi_struct_data::name_file_open
@loop_copy_filename:
    lda     VI_COMMANDLINE_VIDEO_ADRESS,x
    beq     @exit_copy_filename
    cmp     #' '
    beq     @exit_copy_filename
    sta     (vi_struct),y
    inx
    iny
    cpy     #VI_MAX_LENGTH_FILENAME+vi_struct_data::name_file_open
    bne     @loop_copy_filename


@exit_copy_filename:
    lda     #$00  ; EOS if overflow
    sta     (vi_struct),y

    txa
    tay

    jmp     @file_inserted



@display_missing_filename:


    ldy     #$00
@loop_written2:
    lda     msg_nofilename,y
    beq     @out2

    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny
    jmp     @loop_written2

@out2:
    rts


@vi_open_and_write_file:



    lda     vi_struct+1
    sta     vi_ptr1+1

    lda     #vi_struct_data::name_file_open
    clc
    adc     vi_struct
    bcc     @no_inc_vi_ptr1
    inc     vi_ptr1+1
@no_inc_vi_ptr1:
    sta     vi_ptr1



    fopen (vi_ptr1), O_CREAT|O_WRONLY,,vi_fp
    cpx     #$FF
    bne     @opened_file
    cmp     #$FF
    bne     @opened_file
    beq     @error_writing_file

@opened_file:
    ; get length file
   ; ldy     #vi_struct_data::length_file
;    lda     (vi_struct),y
    ;sta     vi_length_file
    ;iny
    ;lda     (vi_struct),y
    ;sta     vi_length_file+1
    ;dec     vi_length_file
; @me:
;     jmp     @me
    fwrite (vi_ptr_file), (vi_length_file), 1, vi_fp ; myptr is from a malloc for example

    fclose(vi_fp)
    rts

@error_writing_file:

    print str_error
    jmp     @error_writing_file
    rts

str_error:
    .asciiz "Error"

.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
