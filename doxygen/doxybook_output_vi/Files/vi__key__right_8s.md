---
title: vi_key_right.s

---

# vi_key_right.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_key_right](Files/vi__key__right_8s.md#Routine-vi-key-right)** |


## Routine documentation

### Routine vi_key_right

```ca65
vi_key_right
```




## Source code

```ca65
.proc vi_key_right

    ; are we  on the end of the text file ?

    ; Compute if we need to erase ~
    jsr     vi_check_eof
    cmp     #IS_EOF
    bne     @not_eof
    rts

@not_eof:
    jsr     vi_editor_switch_off_cursor
    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @no_add_x
    cmp     #LF
    beq     @no_add_x

    jsr     vi_ptr_file_used_plus_plus
    jsr     vi_xpos_screen_plus_plus
    cmp     #$01
    bne     @no_add_x

    jsr     vi_set_xpos_0
    jsr     vi_ypos_screen_plus_plus
    cmp     #$01
    bne     @no_add_x

    scroll up, 0, 26            ; Yes scroll

    lda     vi_ptr_file_used
    sta     vi_ptr1

    lda     vi_ptr_file_used+1
    sta     vi_ptr1+1

    lda     vi_ptr1
    bne     @S1
    dec     vi_ptr1+1
@S1:
    dec     vi_ptr1


    lda     vi_ptr1
    ldy     vi_ptr1+1
    jsr     vi_fill_last_line
@no_add_x:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
