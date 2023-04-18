---
title: vi_key_left.s

---

# vi_key_left.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_key_left](Files/vi__key__left_8s.md#Routine-vi-key-left)** |


## Routine documentation

### Routine vi_key_left

```ca65
vi_key_left
```




## Source code

```ca65
.proc vi_key_left
    jsr     vi_editor_switch_off_cursor

    jsr     vi_xpos_screen_sub_sub
    cmp     #IS_BEGINNING_OF_THE_LINE
    beq     @exit_and_check ; x_equal_to_zero

    jsr     vi_ptr_file_used_sub_sub

@exit:
    rts

@exit_and_check:

    ; At this step we are on the column 0 (xpos=0)

    jsr     vi_check_beginning_of_file
    cmp     #$00
    beq     @exit

    ; Check if the previous char is a crlf


    ; if posfile[vi_ptr_file_used]=$0A goto @exit_add
    jsr     vi_ptr_file_used_sub_sub
    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #LF
    beq     @exit_add   ; LF exit

    ; if posfile[vi_ptr_file_used]=$0D goto @exit_add
    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @exit_add ; CR ?exit

    jsr     vi_ypos_screen_sub_sub

    ldy     #vi_struct_data::xpos_screen
    lda     #VI_EDITOR_MAX_COLUMN
    sta     (vi_struct),y

    rts
@exit_add:
    jsr     vi_ptr_file_used_plus_plus
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
