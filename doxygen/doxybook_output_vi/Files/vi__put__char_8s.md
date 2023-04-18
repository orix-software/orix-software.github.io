---
title: /Routines/vi_put_char.s

---

# /Routines/vi_put_char.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_put_char](Files/vi__put__char_8s.md#Routine-vi-put-char)** |


## Routine documentation

### Routine vi_put_char

```ca65
vi_put_char
```




## Source code

```ca65
.proc vi_put_char

    cmp     #$0A
    beq     exit

    cmp     #$0D
    beq     @return_line

    pha

    jsr     vi_compute_video_adress


    ldy     #vi_struct_data::xpos_screen
    lda     (vi_struct),y
    cmp     #40
    bne     @not_eol_onscreen

    jsr     vi_ypos_screen_plus_plus
    jsr     vi_compute_video_adress
    ldy     #vi_struct_data::xpos_screen
    lda     #$00
    sta     (vi_struct),y


@not_eol_onscreen:
    tay
    pla

    sta     (vi_ptr_screen),y
    iny
    bne     @do_not_inc_y

@do_not_inc_y:
    tya
    ldy     #vi_struct_data::xpos_screen
    sta     (vi_struct),y

    rts

@return_line:
    lda     #$00
    ldy     #vi_struct_data::xpos_screen
    sta     (vi_struct),y

    ldy     #vi_struct_data::file_number_of_line
    lda     (vi_struct),y
    clc
    adc     #$01
    sta     (vi_struct),y


    jsr     vi_ypos_screen_plus_plus

    rts
exit:

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
