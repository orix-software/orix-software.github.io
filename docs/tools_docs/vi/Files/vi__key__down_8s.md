---
title: vi_key_down.s

---

# vi_key_down.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_key_down](Files/vi__key__down_8s.md#Routine-vi-key-down)**<br>Key down management.  |


## Routine documentation

### Routine vi_key_down

```ca65
vi_key_down
```

Key down management. 

[vi_strlen_current_line]




## Source code

```ca65
;; Key down management
;
;@link
;vi_strlen_current_line
;@endlink
;;

.proc vi_key_down
    jsr     vi_editor_switch_off_cursor
    ; Checking if we can go below

    ; if eof then goto eof
    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

    ; x=0
    jsr     vi_set_xpos_0

    ; y++
    jsr     vi_ypos_screen_plus_plus
    ; Last line ?
    cmp     #IS_LAST_LINE_OF_SCREEN_TEXT
    bne     @continue_down

    scroll up, 0, 26            ; Yes scroll



@search_eof:
    ldx     #$00
@L100:
    ; ptr_file++

    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @display_line

    jsr     vi_vi_ptr_file_used_plus_plus
    inx
    cpx     #VI_EDITOR_MAX_COLUMN
    beq     @display_line
    jmp     @L100

@eof:

    rts

@display_line:

@start_display_line:
    iny
    jsr     vi_check_0A

    lda     vi_ptr_file_used
    ldy     vi_ptr_file_used+1

    jsr     vi_fill_last_line   ; And displays the line

    jsr     vi_check_0A

    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

    jsr     vi_check_if_previous_line_was_truncated

    rts
@exit_display_line:

@exit_near:
    rts

@continue_down:
    ldx     #$00
@L1:
    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @found_0D

@not_eof2:
    inx
    cpx     #VI_EDITOR_MAX_COLUMN+1
    bne     @not_eol
    jsr     vi_set_xpos_0

    ; y++
    jsr     vi_ypos_screen_plus_plus
    ldx     #$00

@not_eol:
    jsr     vi_vi_ptr_file_used_plus_plus
    jmp     @L1

    ; Checking if eof

@found_0D:
    jsr     vi_vi_ptr_file_used_plus_plus

    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #LF
    bne     @S20
    jsr     vi_vi_ptr_file_used_plus_plus

@S20:
    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #LF
    bne     @not_eof

    jsr     vi_vi_ptr_file_used_plus_plus

    jmp     @S20

@not_eof:
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    cmp     #$00
    beq     @no_compute
    tax
@add:
    jsr     vi_vi_ptr_file_used_plus_plus
    dex
    bne     @add

@no_compute:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
