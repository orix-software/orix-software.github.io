---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_fill_screen_with_empty_line.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_fill_screen_with_empty_line.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_fill_screen_with_empty_line](Files/vi__fill__screen__with__empty__line_8s.md#function-vi-fill-screen-with-empty-line)**() |


## Functions Documentation

### function vi_fill_screen_with_empty_line

```cpp
vi_fill_screen_with_empty_line()
```




## Source code

```cpp
.proc vi_fill_screen_with_empty_line
  ; X the first line

    cpy     #$00
    beq     @out

    stx     vi_tmp1
    ldx     #VI_LAST_LINE_EDITOR

    ldy     #$00

@loop:
    lda     TABLE_LOW_TEXT,x
    sta     vi_ptr1
    lda     TABLE_HIGH_TEXT,x
    sta     vi_ptr1+1

@skip:
    lda     #VI_EDITOR_CHAR_LIMITS_EMPTY

    sta     (vi_ptr1),y

    dex
    cpx     vi_tmp1
    bpl     @loop
@out:
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
