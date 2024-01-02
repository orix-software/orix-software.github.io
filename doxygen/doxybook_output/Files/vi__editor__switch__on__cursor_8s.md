---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_editor_switch_on_cursor.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_editor_switch_on_cursor.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_editor_switch_on_cursor](Files/vi__editor__switch__on__cursor_8s.md#function-vi-editor-switch-on-cursor)**() |


## Functions Documentation

### function vi_editor_switch_on_cursor

```cpp
vi_editor_switch_on_cursor()
```




## Source code

```cpp

.proc vi_editor_switch_on_cursor
    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    tay

    lda     (vi_ptr_screen),y
    ora     #$80
    sta     (vi_ptr_screen),y

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
