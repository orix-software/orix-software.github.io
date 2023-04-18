---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_search_previous_line_beginning.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_search_previous_line_beginning.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_search_previous_line_beginning](Files/vi__search__previous__line__beginning_8s.md#function-vi-search-previous-line-beginning)**() |


## Functions Documentation

### function vi_search_previous_line_beginning

```cpp
vi_search_previous_line_beginning()
```




## Source code

```cpp
.proc vi_search_previous_line_beginning
    ; A = 1 found $0D
    ; A = 0 find beginning
    ; X contains the number of char parsed
    ldx     #$00

@L1:
    jsr     vi_ptr_file_used_sub_sub
    cmp     #IS_BEGINNING_OF_THE_FILE
    beq     @beginning_of_file

    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #CR
    beq     @found_0D
    cmp     #LF
    beq     @dex
    inx
    bne     @L1

@dex:
    jmp     @L1

@found_0D:
    lda     #$01
    rts

@beginning_of_file:
    lda     #$00
    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
