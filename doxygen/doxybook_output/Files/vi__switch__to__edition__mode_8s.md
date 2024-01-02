---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_switch_to_edition_mode.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_switch_to_edition_mode.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_switch_to_edition_mode](Files/vi__switch__to__edition__mode_8s.md#function-vi-switch-to-edition-mode)**() |


## Functions Documentation

### function vi_switch_to_edition_mode

```cpp
vi_switch_to_edition_mode()
```




## Source code

```cpp
.proc vi_switch_to_edition_mode

@loop:
    ; Display debug
    ldy    vi_pos_debug
    jsr    displays_debug
    ; end display debug

    jsr     vi_compute_video_adress
    jsr     vi_editor_switch_on_cursor
    cgetc

    cmp     #KEY_ESC
    beq     @exit

    cmp     #KEY_UP
    beq     @key_up

    cmp     #KEY_DEL
    beq     @key_del

    cmp     #KEY_RETURN
    beq     @key_enter

    cmp     #KEY_DOWN
    beq     @key_down

    cmp     #KEY_RIGHT
    beq     @key_right

    cmp     #KEY_LEFT
    beq     @key_left

    jsr     @display_char
    jmp     @loop

@exit:
    rts

@key_right:
    jsr     vi_key_right
    jmp     @loop

@key_left:
    jsr     vi_key_left
    jmp     @loop

@key_up:
    jsr     vi_key_up
    jmp     @loop

@key_del:
    jsr     vi_manage_del
    jmp     @loop

@key_enter:
    jsr     vi_key_enter
    jmp     @loop

@key_down:
    jsr     vi_key_down
    jmp     @loop

@display_char:
    jsr     vi_display_char

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
