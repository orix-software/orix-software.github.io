---
title: vi_strlen_current_line.s

---

# vi_strlen_current_line.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_strlen_current_line](Files/vi__strlen__current__line_8s.md#Routine-vi-strlen-current-line)** |


## Routine documentation

### Routine vi_strlen_current_line

```ca65
vi_strlen_current_line
```




## Source code

```ca65
;; strlen of a line
;
;@param  A&Y : ptr of the position
;@return X : the length of the line
;@return A & Y : the ptr reached
;@see     vi_struct
;
;@example This routine compute ...
;@page strlen
;;

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

Updated on 2022-12-15 at 14:20:17 +0100
