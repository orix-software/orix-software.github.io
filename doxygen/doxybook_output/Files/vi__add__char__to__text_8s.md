---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_add_char_to_text.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_add_char_to_text.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_add_char_to_text](Files/vi__add__char__to__text_8s.md#function-vi-add-char-to-text)**() |


## Functions Documentation

### function vi_add_char_to_text

```cpp
vi_add_char_to_text()
```




## Source code

```cpp
.proc vi_add_char_to_text
    ; Ajoute un caractère dans le texte
    pha
    jsr     vi_ptr_last_char_plus_plus
    jsr     vi_shift_file_from_memory_one_char ; shift one char the text file in the memory
    ldy     #$00
    pla
    sta     (vi_ptr_file_used),y ; store \n
    jsr     vi_ptr_file_used_plus_plus
    jsr     vi_length_file_plus_plus
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
