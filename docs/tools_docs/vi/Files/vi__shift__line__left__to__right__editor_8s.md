---
title: vi_shift_line_left_to_right_editor.s

---

# vi_shift_line_left_to_right_editor.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_shift_line_left_to_right_editor](Files/vi__shift__line__left__to__right__editor_8s.md#Routine-vi-shift-line-left-to-right-editor)** |


## Routine documentation

### Routine vi_shift_line_left_to_right_editor

```ca65
vi_shift_line_left_to_right_editor
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
