---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_copy_arg1_to_name_file_open.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_copy_arg1_to_name_file_open.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_copy_arg1_to_name_file_open](Files/vi__copy__arg1__to__name__file__open_8s.md#function-vi-copy-arg1-to-name-file-open)**() |


## Functions Documentation

### function vi_copy_arg1_to_name_file_open

```cpp
vi_copy_arg1_to_name_file_open()
```




## Source code

```cpp
.proc   vi_copy_arg1_to_name_file_open
    ldy     #$00
    sty     vi_tmp1

    ldy     #vi_struct_data::name_file_open
    sty     vi_tmp2

@loop_copy_filename:
    ldy     vi_tmp1
    lda     (vi_arg1),y
    beq     @exit_copy_filename
    iny
    sty     vi_tmp1
    ldy     vi_tmp2
    sta     (vi_struct),y
    iny
    sty     vi_tmp2
    cpy     #VI_MAX_LENGTH_FILENAME+vi_struct_data::name_file_open
    bne     @loop_copy_filename

    lda     #$00  ; EOS if overflow
@exit_copy_filename:

    ldy     vi_tmp2
    sta     (vi_struct),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
