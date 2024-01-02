---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_strlen_current_line.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_strlen_current_line.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_strlen_current_line](Files/vi__strlen__current__line_8s.md#function-vi-strlen-current-line)**() |


## Functions Documentation

### function vi_strlen_current_line

```cpp
vi_strlen_current_line()
```




## Source code

```cpp
.proc vi_strlen_current_line

    ; Returns in A and Y the ptr of the beginning of the line
    ; Returns in X the length of the line

    sta     vi_ptr2
    sty     vi_ptr2+1

    ; Looking for the beginning of the line

    ldy     #$00
    lda     (vi_ptr2),y
    cmp     #CR
    bne     @search_beginning_of_the_line

    lda     vi_ptr2 ; 98
    bne     @out_compare2
    dec     vi_ptr2+1
@out_compare2:
    dec     vi_ptr2


@search_beginning_of_the_line:
    ; Check beginning

    lda     vi_ptr2
    cmp     vi_ptr_file
    bne     @not_beginning

    lda     vi_ptr2+1
    cmp     vi_ptr_file+1
    bne     @not_beginning

    lda     vi_ptr2
    ldy     vi_ptr2+1
    ldx     #$00

    rts

@not_beginning:
    ldy     #$00
    lda     (vi_ptr2),y
    cmp     #LF
    beq     @found_beginning
    cmp     #CR
    beq     @found_beginning

    lda     vi_ptr2 ; 98
    bne     @out_compare
    dec     vi_ptr2+1
@out_compare:
    dec     vi_ptr2
    jmp     @search_beginning_of_the_line

@found_beginning:
    inc     vi_ptr2
    bne     @no_inc
    inc     vi_ptr2+1
@no_inc:
    ; At this step we are at the beginning of the line
    ; search now the end of the line


    ldx     #$00

    ldy     #$00
@search_eol:

    lda     (vi_ptr2),y
    cmp     #CR
    beq     @found_eol


    iny

    bne     @search_eol

@found_eol:
    tya
    tax
    lda     vi_ptr2
    ldy     vi_ptr2+1

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
