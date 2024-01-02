---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_inserted_char_overflow_the_max_column.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_inserted_char_overflow_the_max_column.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_inserted_char_overflow_the_max_column](Files/vi__check__inserted__char__overflow__the__max__column_8s.md#function-vi-check-inserted-char-overflow-the-max-column)**() |


## Functions Documentation

### function vi_check_inserted_char_overflow_the_max_column

```cpp
vi_check_inserted_char_overflow_the_max_column()
```




## Source code

```cpp

.proc vi_check_inserted_char_overflow_the_max_column
    ; Pas d'arg en entrée
    ; Cette routine renvoie dans
    ; A=0 si on a un texte qui ne dépasse pas 40 colonnes
    ; A=1 si on a une ligne texte qui dépasse la ligne de 40 colonnes et X contient le nb de lignes sur l'éditeur de cette ligne texte
    ; A=2 si on a une ligne de plus de 256 chars : overflow
    ; A=3 si cela la ligne fait exactement 1 ligne, il faudra donc scroller

    lda     #$00
    sta     vi_tmp1

    lda     vi_ptr_file_used
    sta     vi_ptr1

    lda     vi_ptr_file_used+1
    sta     vi_ptr1+1

    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    tax
    dex
    stx     vi_tmp3

    ldy     #$00
@L1:
    lda     (vi_ptr1),y
    cmp     #CR
    beq     @exit
    inx
    cpx     #VI_EDITOR_MAX_COLUMN+1
    bne     @continue

    inc     vi_tmp1
    ldx     #$00

@continue:
    inc     vi_tmp3
    iny
    bne     @L1
    lda     #$02 ; Overflow
    rts

@exit:
    lda     vi_tmp3
    cmp     #VI_EDITOR_MAX_COLUMN+1
    beq     @exactly_a_new_line

    ldx     vi_tmp1
    beq     @no_line_editor_overflow
    lda     #$01
    rts

@no_line_editor_overflow:
    lda     #$00
    rts

@exactly_a_new_line:
    lda     #$03
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
