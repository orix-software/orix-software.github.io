---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_editor_switch_off_cursor.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_editor_switch_off_cursor.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_editor_switch_off_cursor](Files/vi__editor__switch__off__cursor_8s.md#function-vi-editor-switch-off-cursor)**() |


## Functions Documentation

### function vi_editor_switch_off_cursor

```cpp
vi_editor_switch_off_cursor()
```




## Source code

```cpp
.proc vi_editor_switch_off_cursor
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    tay
    lda     (vi_ptr_screen),y ; display cursor
    and     #%01111111
    sta     (vi_ptr_screen),y ; display cursor

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
