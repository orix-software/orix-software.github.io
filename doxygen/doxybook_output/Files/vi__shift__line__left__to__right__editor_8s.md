---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_shift_line_left_to_right_editor.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_shift_line_left_to_right_editor.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_shift_line_left_to_right_editor](Files/vi__shift__line__left__to__right__editor_8s.md#function-vi-shift-line-left-to-right-editor)**() |


## Functions Documentation

### function vi_shift_line_left_to_right_editor

```cpp
vi_shift_line_left_to_right_editor()
```




## Source code

```cpp
.proc vi_shift_line_left_to_right_editor
    ; A the line to scroll

    tay
    lda     TABLE_LOW_TEXT,y
    sta     vi_ptr1
    lda     TABLE_HIGH_TEXT,y
    sta     vi_ptr1+1


    ldy     #38
@L1:
    lda     (vi_ptr1),y
    iny
    sta     (vi_ptr1),y
    dey
    dey
    bpl     @L1

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
