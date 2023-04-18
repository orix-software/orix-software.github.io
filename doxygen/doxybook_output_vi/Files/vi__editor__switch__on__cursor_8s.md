---
title: /Routines/vi_editor_switch_on_cursor.s

---

# /Routines/vi_editor_switch_on_cursor.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_editor_switch_on_cursor](Files/vi__editor__switch__on__cursor_8s.md#Routine-vi-editor-switch-on-cursor)** |


## Routine documentation

### Routine vi_editor_switch_on_cursor

```ca65
vi_editor_switch_on_cursor
```




## Source code

```ca65

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

Updated on 2022-12-15 at 14:20:17 +0100
