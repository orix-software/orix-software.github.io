---
title: vi_init_vi_struct.s

---

# vi_init_vi_struct.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_init_vi_struct](Files/vi__init__vi__struct_8s.md#Routine-vi-init-vi-struct)** |


## Routine documentation

### Routine vi_init_vi_struct

```ca65
vi_init_vi_struct
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
