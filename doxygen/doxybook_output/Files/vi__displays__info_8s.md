---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_displays_info.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_displays_info.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_displays_info](Files/vi__displays__info_8s.md#function-vi-displays-info)**() |
| | **[displays_debug](Files/vi__displays__info_8s.md#function-displays-debug)**() |


## Functions Documentation

### function vi_displays_info

```cpp
vi_displays_info()
```


### function displays_debug

```cpp
displays_debug()
```




## Source code

```cpp
.proc vi_displays_info

    lda     vi_fileopened

    beq     @is_new_file


    ; Displays filename at the bottom
    lda     #$22 ; " char
    sta     VI_COMMANDLINE_VIDEO_ADRESS

    ldy     #$00
    ldx     #$01
@L1:
    lda     (vi_arg1),y
    beq     @end_display_filename
    sta     VI_COMMANDLINE_VIDEO_ADRESS,x
    inx
    iny
    bne     @L1
@end_display_filename:
    lda     #$22 ; " char
    sta     VI_COMMANDLINE_VIDEO_ADRESS,x
    rts

@is_new_file:
    ldy     #$00

@L10:
    lda     msg_nofile,y
    beq     @end_display_msg_nofile
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny
    bne     @L10

@end_display_msg_nofile:
    sty     vi_pos_debug
    jsr     displays_debug

    rts
.endproc


.proc displays_debug
    lda     #$02
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    ; y
    iny
    ; Display ptr_last_char_file offset
    sty     RES
    ldy     #vi_struct_data::ptr_last_char_file+1 ; last char file
    lda     (vi_struct),y
    BRK_TELEMON XHEXA
    ; A and Y
    sty     vi_tmp1
    ldy     RES
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny
    lda     vi_tmp1
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny

    sty     RES
    ldy     #vi_struct_data::ptr_last_char_file
    lda     (vi_struct),y
    BRK_TELEMON XHEXA
    ; A and Y
    sty     vi_tmp1
    ldy     RES
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny
    lda     vi_tmp1
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny

    lda     #$02
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y

    iny
    sty     RES
    ;  pos_file_addr



    lda     vi_ptr_file_used+1
    BRK_TELEMON XHEXA
    ; A and Y
    sty     vi_tmp1
    ldy     RES
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny
    lda     vi_tmp1
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y

    iny
    sty     RES
    ;  pos_file_addr

    lda     vi_ptr_file_used
    BRK_TELEMON XHEXA
    ; A and Y
    sty     vi_tmp1
    ldy     RES
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y
    iny
    lda     vi_tmp1
    sta     VI_COMMANDLINE_VIDEO_ADRESS,y


    ; Display length
    lda     #$06
    sta     VI_COMMANDLINE_VIDEO_ADRESS+22

    lda     #<($bb80+40*27+23)
    sta     TR5
    lda     #>($bb80+40*27+23)
    sta     TR5+1

    lda     #$20
    sta     DEFAFF

    ldx     #$01
    ldy     vi_length_file+1
    lda     vi_length_file
    BRK_TELEMON XBINDX

    lda     #$05
    sta     VI_COMMANDLINE_VIDEO_ADRESS+28

    ; Display char under the cursor
    ldy     #$00
    lda     (vi_ptr_file_used),y
    cmp     #$0D
    bne     @notcrlf
    lda     #'$'
@notcrlf:
    sta     $bb80+40*27+29

    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
