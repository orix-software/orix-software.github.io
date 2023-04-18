---
title: vi_search_previous_cr.s

---

# vi_search_previous_cr.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_search_previous_cr](Files/vi__search__previous__cr_8s.md#Routine-vi-search-previous-cr)** |


## Routine documentation

### Routine vi_search_previous_cr

```ca65
vi_search_previous_cr
```




## Source code

```ca65
.proc vi_search_previous_cr
    ; Cherche le précédent \n
    ; retourne dans A et Y la position en ptr
    ; Si on est en début de fichier A et Y = $0000
    ; retourne dans X le nombre de char trouvés entre le $0D et le 1er char de la ligne précédnte ligne

    sta     vi_ptr1
    sty     vi_ptr1+1

    ldx     #$00
@L1:
    ldy     #$00
    lda     (vi_ptr1),y
    cmp     #CR
    beq     @exit
    cmp     #LF
    beq     @no_inc

    inx

@no_inc:
    lda     vi_ptr1
    bne     @S1
    dec     vi_ptr1+1
@S1:
    dec     vi_ptr1

    lda     vi_ptr1
    cmp     vi_ptr_file
    bne     @not_beginning

    lda     vi_ptr1+1
    cmp     vi_ptr_file+1
    bne     @not_beginning

@exit_beginning_of_the_file_is_reached:
    inx
    lda     #$00
    ldy     #$00
    rts

@not_beginning:
    jmp     @L1

@exit:


    lda     vi_ptr1
    bne     @S2
    dec     vi_ptr1+1
@S2:
    dec     vi_ptr1

    lda     vi_ptr1
    cmp     vi_ptr_file
    bne     @not_beginning2

    lda     vi_ptr1+1
    cmp     vi_ptr_file+1
    bne     @not_beginning2
    beq     @exit_beginning_of_the_file_is_reached

@not_beginning2:
    lda     vi_ptr1
    ldy     vi_ptr1+1

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
