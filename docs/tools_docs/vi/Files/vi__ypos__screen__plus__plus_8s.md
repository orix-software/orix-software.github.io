---
title: vi_ypos_screen_plus_plus.s

---

# vi_ypos_screen_plus_plus.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_ypos_screen_plus_plus](Files/vi__ypos__screen__plus__plus_8s.md#Routine-vi-ypos-screen-plus-plus)**<br>Increment ypos and returns IS_LAST_LINE_OF_SCREEN_TEXT.  |


## Routine documentation

### Routine vi_ypos_screen_plus_plus

```ca65
vi_ypos_screen_plus_plus
```

Increment ypos and returns IS_LAST_LINE_OF_SCREEN_TEXT. 

**See**: [vi_struct](Files/vi_8s.md#variable-vi-struct)

**Return**: A : IS_LAST_LINE_OF_SCREEN_TEXT if we are on the last line of the screen else $00 



## Source code

```ca65
;; Increment ypos and returns IS_LAST_LINE_OF_SCREEN_TEXT
;
;@return A : IS_LAST_LINE_OF_SCREEN_TEXT if we are on the last line of the screen else $00
;@see     vi_struct
;;
.proc vi_ypos_screen_plus_plus
    ; ypos_screen=ypos_screen+1
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    cmp     #VI_LAST_LINE_EDITOR
    beq     @no_add
    clc
    adc     #$01
    sta     (vi_struct),y
    lda     #$00
    rts
@no_add:
    ;
    lda     #IS_LAST_LINE_OF_SCREEN_TEXT
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
