---
title: vi_scroll_from_left_to_right_full_line.s

---

# vi_scroll_from_left_to_right_full_line.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_scroll_from_left_to_right_full_line](Files/vi__scroll__from__left__to__right__full__line_8s.md#Routine-vi-scroll-from-left-to-right-full-line)** |


## Routine documentation

### Routine vi_scroll_from_left_to_right_full_line

```ca65
vi_scroll_from_left_to_right_full_line
```




## Source code

```ca65
.proc vi_scroll_from_left_to_right_full_line
    ; Scroll une ligne Y
    ; insert copy on screen
    ldy     #vi_struct_data::xpos_screen    ; Get X position
    lda     (vi_struct),y                   ; get value
    sec
    sbc     #$01
    sta     vi_tmp1                         ; Save It

    lda     vi_ptr_file_used
    sta     vi_ptr1

    lda     vi_ptr_file_used+1
    sta     vi_ptr1+1

    ; Compute number of char to scroll


    ldy     #$00
    ldx     #$00
@compute:
    lda     (vi_ptr1),y
    cmp     #CR
    beq     @end_compute

    inc     vi_ptr1
    bne     @S2
    inc     vi_ptr1+1
@S2:
    inc     vi_ptr1
    inx
    bne     @compute

@end_compute:
    txa
    tay

    ldy     #38
@L2:
    lda     (vi_ptr_screen),y
    iny
    sta     (vi_ptr_screen),y
    dey
    dey
    cpy     vi_tmp1
    bne     @L2
    rts

.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
