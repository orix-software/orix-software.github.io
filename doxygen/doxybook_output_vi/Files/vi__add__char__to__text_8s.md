---
title: vi_add_char_to_text.s

---

# vi_add_char_to_text.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_add_char_to_text](Files/vi__add__char__to__text_8s.md#Routine-vi-add-char-to-text)** |


## Routine documentation

### Routine vi_add_char_to_text

```ca65
vi_add_char_to_text
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
