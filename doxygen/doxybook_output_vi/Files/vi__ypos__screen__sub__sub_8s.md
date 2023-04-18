---
title: vi_ypos_screen_sub_sub.s

---

# vi_ypos_screen_sub_sub.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_ypos_screen_sub_sub](Files/vi__ypos__screen__sub__sub_8s.md#Routine-vi-ypos-screen-sub-sub)**<br>Decrement ypos.  |


## Routine documentation

### Routine vi_ypos_screen_sub_sub

```ca65
vi_ypos_screen_sub_sub
```

Decrement ypos. 

**See**: [vi_struct](Files/vi_8s.md#variable-vi-struct)

**Return**: A : returns 1 if y=0 or A returns 0 if y!=0 



## Source code

```ca65
;; Decrement ypos
;
;@return A : returns 1 if y=0 or A returns 0 if y!=0
;@see     vi_struct
;
;;
.proc vi_ypos_screen_sub_sub
    ; ypos_screen=ypos_screen-1
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    beq     @no_substract
    sec
    sbc     #$01

    sta     (vi_struct),y
    lda     #$00
    rts
@no_substract:
    lda     #$01
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
