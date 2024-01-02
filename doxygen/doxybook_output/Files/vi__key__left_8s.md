---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_left.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_key_left.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_key_left](Files/vi__key__left_8s.md#function-vi-key-left)**() |


## Functions Documentation

### function vi_key_left

```cpp
vi_key_left()
```




## Source code

```cpp
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

Updated on 2022-12-15 at 11:48:27 +0100
