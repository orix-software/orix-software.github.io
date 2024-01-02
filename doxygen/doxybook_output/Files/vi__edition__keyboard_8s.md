---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_edition_keyboard.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_edition_keyboard.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_edition_keyboard](Files/vi__edition__keyboard_8s.md#function-vi-edition-keyboard)**() |


## Functions Documentation

### function vi_edition_keyboard

```cpp
vi_edition_keyboard()
```




## Source code

```cpp
.proc vi_edition_keyboard
    jsr     vi_clear_command_line
    jsr     vi_displays_info


@loop:
    cgetc ; read keyboard

    cmp     #'i'
    beq     switch_to_edition_mode
    cmp     #':'
    bne     @loop

    jsr     vi_command_edition
    cmp     #$00 ; A is equal to 0 ? Yes restart keyboard
    beq     @loop
    jsr     _clrscr_vi
    lda     #$01    ; Exit vi
    rts

switch_to_edition_mode:

    jsr     vi_clear_command_line
    ldx     #$00
  @loop:
    lda     msg_insert,x
    beq     @out
    sta     VI_COMMANDLINE_VIDEO_ADRESS,x
    inx
  .IFPC02
  .pc02
    bra     @loop
  .p02
  .else
    jmp     @loop
  .endif
@out:
    txa
    tay
    sty    vi_pos_debug
    jsr    displays_debug

    jsr    vi_switch_to_edition_mode
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
