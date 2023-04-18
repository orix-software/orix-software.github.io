---
title: /Routines/vi_set_length_file.s

---

# /Routines/vi_set_length_file.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_set_length_file](Files/vi__set__length__file_8s.md#Routine-vi-set-length-file)** |


## Routine documentation

### Routine vi_set_length_file

```ca65
vi_set_length_file
```




## Source code

```ca65

; A,X,Y RES contains the length

.proc vi_set_length_file
  ; set file length A and X contains the value

    pha
    jsr     populate_tmp0_16_with_ptr_length_file
    pla
    ldy     #$00
    sta     (tmp0_16),y
    txa
    iny
    sta     (tmp0_16),y
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
