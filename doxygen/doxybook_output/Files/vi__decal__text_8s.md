---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_decal_text.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_decal_text.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_decal_text](Files/vi__decal__text_8s.md#function-vi-decal-text)**() |


## Functions Documentation

### function vi_decal_text

```cpp
vi_decal_text()
```




## Source code

```cpp
.proc vi_decal_text
    ; A & X address dest to copy

    sta     DECCIB
    stx     DECCIB+1

    lda     vi_ptr_file_used ; address first char
    ldy     vi_ptr_file_used+1
    sta     DECDEB
    sty     DECDEB+1

    ldy     #vi_struct_data::ptr_last_char_file
    lda     (vi_struct),y
    sta     DECFIN
    iny
    lda     (vi_struct),y
    sta     DECFIN+1

    BRK_TELEMON XDECAL

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
