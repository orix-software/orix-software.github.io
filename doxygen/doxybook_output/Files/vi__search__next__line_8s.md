---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_search_next_line.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_search_next_line.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_search_next_line](Files/vi__search__next__line_8s.md#function-vi-search-next-line)**() |


## Functions Documentation

### function vi_search_next_line

```cpp
vi_search_next_line()
```




## Source code

```cpp
.proc vi_search_next_line
    ; vi_ptr_file_used is on $0D
    ; and the exit of the subroutine must be :
    ; -last char

    lda     #$00
    sta     vi_tmp2     ; Contains the number of line when max number of_column has reached


    ; jsr     vi_check_eof
    ; cmp     #IS_EOF
    ; beq     @eof

    ; ; The current line is empty               : *$0D*, $0A, 'T',$0D, 0A
    ; ; The current line is chars               : *$0D*, $0A, 'T',$0D, 0A
    ; ; The current line is the end of the file : *$0D*, $0A
    ; ; The current line is the end of the file : *'T'*
    ; jsr     vi_ptr_file_used_plus_plus

    ; ; The current line is empty               : $0D, *$0A*, 'T',$0D, 0A
    ; ; The current line is chars               : $0D, *$0A*, 'T',$0D, 0A
    ; ; The current line is the end of the file : $0D, *$0A*
    ; ; The current line is the end of the file : 'T' ** err

    ; jsr     vi_check_eof
    ; cmp     #IS_EOF
    ; beq     @eof


    ; ldy     #$00
    ; lda     (vi_ptr_file_used),y
    ; cmp     #LF
    ; bne     @continue

    ; jsr     vi_ptr_file_used_plus_plus

    ; jsr     vi_check_eof
    ; cmp     #IS_EOF
    ; beq     @eof

    ldx     #$00
@continue:
    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @first_char_found

    jsr     vi_ptr_file_used_plus_plus
    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof
    inx
    cpx     #VI_EDITOR_MAX_COLUMN
    bne     @continue
    inc     vi_tmp2
    ldx     #$00

    jmp     @continue


@eof:
    ; A=IS_EOF
    rts
@first_char_found:
    jsr     vi_ptr_file_used_plus_plus
    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #LF
    bne     @exit

    jsr     vi_ptr_file_used_plus_plus
    jsr     vi_check_eof
    cmp     #IS_EOF
    beq     @eof

@exit:
    lda     #$01
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
