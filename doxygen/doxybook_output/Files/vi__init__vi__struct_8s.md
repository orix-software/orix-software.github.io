---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_init_vi_struct.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_init_vi_struct.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_init_vi_struct](Files/vi__init__vi__struct_8s.md#function-vi-init-vi-struct)**() |


## Functions Documentation

### function vi_init_vi_struct

```cpp
vi_init_vi_struct()
```




## Source code

```cpp
.proc vi_init_vi_struct

; init struct to 0
    jsr     vi_set_xpos_0

    ldy     #vi_struct_data::ypos_screen
    sta     (vi_struct),y

    ldy     #vi_struct_data::xpos_text
    sta     (vi_struct),y

    ldy     #vi_struct_data::ypos_text
    sta     (vi_struct),y

    ldy     #vi_struct_data::xpos_command_line
    sta     (vi_struct),y

    ldy     #vi_struct_data::pos_file_addr
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y

    ldy     #vi_struct_data::pos_file
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y

    ldy     #vi_struct_data::posx_command_line
    sta     (vi_struct),y

    ldy     #vi_struct_data::name_file_open
    sta     (vi_struct),y

    ldy     #vi_struct_data::length_file
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y

    ldy     #vi_struct_data::ptr_last_char_file
    lda     #$00
    sta     (vi_struct),y
    iny
    sta     (vi_struct),y

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
