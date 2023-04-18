---
title: /commands/vi.s

---

# /commands/vi.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[_vi](Files/vi_8s.md#Routine--vi)** |

## Attributes

|                | Name           |
| -------------- | -------------- |
| const char | **[CR](Files/vi_8s.md#variable-cr)**  |
| const char | **[LF](Files/vi_8s.md#variable-lf)**  |
| const char | **[IS_EOF](Files/vi_8s.md#variable-is-eof)**  |
| const char | **[IS_BEGINNING_OF_THE_FILE](Files/vi_8s.md#variable-is-beginning-of-the-file)**  |
| const char | **[IS_LAST_LINE_OF_SCREEN_TEXT](Files/vi_8s.md#variable-is-last-line-of-screen-text)**  |
| const char | **[IS_BEGINNING_OF_THE_LINE](Files/vi_8s.md#variable-is-beginning-of-the-line)**  |
| const char | **[VI_LAST_LINE_EDITOR](Files/vi_8s.md#variable-vi-last-line-editor)** <br>Last line used by the editor.  |
| const char | **[VI_FILL_SCREEN_MODE_STOP_AT_THE_END_OF_LAST_LINE](Files/vi_8s.md#variable-vi-fill-screen-mode-stop-at-the-end-of-last-line)**  |
| const char | **[VI_COMMANDLINE_MAX_CHAR](Files/vi_8s.md#variable-vi-commandline-max-char)**  |
| const char | **[VI_MAX_LENGTH_FILE](Files/vi_8s.md#variable-vi-max-length-file)**  |
| const char | **[VI_EDITOR_CHAR_LIMITS_EMPTY](Files/vi_8s.md#variable-vi-editor-char-limits-empty)**  |
| const char | **[VI_COMMANDLINE_VIDEO_ADRESS](Files/vi_8s.md#variable-vi-commandline-video-adress)**  |
| const char | **[VI_EDITION_LAST_VIDEO_ADRESS](Files/vi_8s.md#variable-vi-edition-last-video-adress)**  |
| const char | **[VI_EDITION_VIDEO_ADRESS](Files/vi_8s.md#variable-vi-edition-video-adress)**  |
| const char | **[VI_EDITOR_MAX_LENGTH_OF_A_LINE](Files/vi_8s.md#variable-vi-editor-max-length-of-a-line)**  |
| const char | **[VI_EDITOR_MAX_COLUMN](Files/vi_8s.md#variable-vi-editor-max-column)**  |
| const char | **[vi_struct](Files/vi_8s.md#variable-vi-struct)** <br>2 bytes  |
| const char | **[vi_ptr1](Files/vi_8s.md#variable-vi-ptr1)** <br>2 bytes  |
| const char | **[vi_argv](Files/vi_8s.md#variable-vi-argv)** <br>2 bytes  |
| const char | **[vi_argc](Files/vi_8s.md#variable-vi-argc)** <br>1 bytes  |
| const char | **[vi_arg1](Files/vi_8s.md#variable-vi-arg1)** <br>2 bytes  |
| const char | **[vi_fp](Files/vi_8s.md#variable-vi-fp)** <br>2 bytes  |
| const char | **[vi_ptr_file](Files/vi_8s.md#variable-vi-ptr-file)** <br>2 bytes  |
| const char | **[vi_tmp2](Files/vi_8s.md#variable-vi-tmp2)**  |
| const char | **[vi_ptr_screen](Files/vi_8s.md#variable-vi-ptr-screen)** <br>2 bytes  |
| const char | **[vi_length_file](Files/vi_8s.md#variable-vi-length-file)** <br>2 bytes  |
| const char | **[vi_length_file_compute](Files/vi_8s.md#variable-vi-length-file-compute)** <br>2 bytes  |
| const char | **[vi_tmp1](Files/vi_8s.md#variable-vi-tmp1)**  |
| const char | **[vi_fileopened](Files/vi_8s.md#variable-vi-fileopened)**  |
| const char | **[vi_ptr_file_used](Files/vi_8s.md#variable-vi-ptr-file-used)** <br>2 bytes  |
| const char | **[tmp0_16](Files/vi_8s.md#variable-tmp0-16)**  |
| const char | **[vi_no_opened_file](Files/vi_8s.md#variable-vi-no-opened-file)**  |
| const char | **[vi_pos_debug](Files/vi_8s.md#variable-vi-pos-debug)**  |
| const char | **[vi_ptr2](Files/vi_8s.md#variable-vi-ptr2)** <br>2 bytes  |
| const char | **[vi_savex](Files/vi_8s.md#variable-vi-savex)** <br>2 bytes  |
| const char | **[vi_ptr3](Files/vi_8s.md#variable-vi-ptr3)** <br>2 bytes  |
| const char | **[vi_tmp3](Files/vi_8s.md#variable-vi-tmp3)** <br>2 bytes  |

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[vi_dec16_zp](Files/vi_8s.md#define-vi-dec16-zp)**(addr)  |


## Routine documentation

### Routine _vi

```ca65
_vi
```



## Attributes Documentation

### variable CR

```ca65
const char CR = $0D;
```


### variable LF

```ca65
const char LF = $0A;
```


### variable IS_EOF

```ca65
const char IS_EOF = $00;
```


### variable IS_BEGINNING_OF_THE_FILE

```ca65
const char IS_BEGINNING_OF_THE_FILE = $00;
```


### variable IS_LAST_LINE_OF_SCREEN_TEXT

```ca65
const char IS_LAST_LINE_OF_SCREEN_TEXT = $01;
```


### variable IS_BEGINNING_OF_THE_LINE

```ca65
const char IS_BEGINNING_OF_THE_LINE = $00;
```


### variable VI_LAST_LINE_EDITOR

```ca65
const char VI_LAST_LINE_EDITOR = 26;
```

Last line used by the editor. 

### variable VI_FILL_SCREEN_MODE_STOP_AT_THE_END_OF_LAST_LINE

```ca65
const char VI_FILL_SCREEN_MODE_STOP_AT_THE_END_OF_LAST_LINE = 0;
```


### variable VI_COMMANDLINE_MAX_CHAR

```ca65
const char VI_COMMANDLINE_MAX_CHAR = 8;
```


### variable VI_MAX_LENGTH_FILE

```ca65
const char VI_MAX_LENGTH_FILE = 2000;
```


### variable VI_EDITOR_CHAR_LIMITS_EMPTY

```ca65
const char VI_EDITOR_CHAR_LIMITS_EMPTY = '~';
```


### variable VI_COMMANDLINE_VIDEO_ADRESS

```ca65
const char VI_COMMANDLINE_VIDEO_ADRESS = $bb80+40*27;
```


### variable VI_EDITION_LAST_VIDEO_ADRESS

```ca65
const char VI_EDITION_LAST_VIDEO_ADRESS = $bb80+40*26;
```


### variable VI_EDITION_VIDEO_ADRESS

```ca65
const char VI_EDITION_VIDEO_ADRESS = $bb80;
```


### variable VI_EDITOR_MAX_LENGTH_OF_A_LINE

```ca65
const char VI_EDITOR_MAX_LENGTH_OF_A_LINE = 255;
```


### variable VI_EDITOR_MAX_COLUMN

```ca65
const char VI_EDITOR_MAX_COLUMN = 39;
```


### variable vi_struct

```ca65
const char vi_struct = userzp;
```

2 bytes 

### variable vi_ptr1

```ca65
const char vi_ptr1 = userzp+2;
```

2 bytes 

### variable vi_argv

```ca65
const char vi_argv = userzp+4;
```

2 bytes 

### variable vi_argc

```ca65
const char vi_argc = userzp+6;
```

1 bytes 

### variable vi_arg1

```ca65
const char vi_arg1 = userzp+7;
```

2 bytes 

### variable vi_fp

```ca65
const char vi_fp = userzp+9;
```

2 bytes 

### variable vi_ptr_file

```ca65
const char vi_ptr_file = userzp+11;
```

2 bytes 

### variable vi_tmp2

```ca65
const char vi_tmp2 = userzp+13;
```


### variable vi_ptr_screen

```ca65
const char vi_ptr_screen = userzp+14;
```

2 bytes 

### variable vi_length_file

```ca65
const char vi_length_file = userzp+16;
```

2 bytes 

### variable vi_length_file_compute

```ca65
const char vi_length_file_compute = userzp+18;
```

2 bytes 

### variable vi_tmp1

```ca65
const char vi_tmp1 = userzp+20;
```


### variable vi_fileopened

```ca65
const char vi_fileopened = userzp+22;
```


### variable vi_ptr_file_used

```ca65
const char vi_ptr_file_used = userzp+24;
```

2 bytes 

### variable tmp0_16

```ca65
const char tmp0_16 = userzp+26;
```


### variable vi_no_opened_file

```ca65
const char vi_no_opened_file = userzp+28;
```


### variable vi_pos_debug

```ca65
const char vi_pos_debug = userzp+30;
```


### variable vi_ptr2

```ca65
const char vi_ptr2 = userzp+32;
```

2 bytes 

### variable vi_savex

```ca65
const char vi_savex = userzp+34;
```

2 bytes 

### variable vi_ptr3

```ca65
const char vi_ptr3 = userzp+36;
```

2 bytes 

### variable vi_tmp3

```ca65
const char vi_tmp3 = userzp+38;
```

2 bytes 


## Macros Documentation

### define vi_dec16_zp

```ca65
#define vi_dec16_zp(
    addr
)

```


## Source code

```ca65
; Limits max line : 256 bytes
; Max file : VI_MAX_LENGTH_FILE (2000 bytes)
; max edit char per line : 39

; Max 2KB pour un fichier (arbitraire)
; Pas de possibilité d'éditer une ligne de plus de 39 chars (donc pas de gestion de retour à la ligne quand une ligne fait plus de 40 chars
; Quand on remonte ou quand on descend le curseur, il revient toujours à la position X=0 même si on était en milieu de ligne
; Pas de gestion du mode écrasement
; Pas de possibilité d'avoir une touche pour aller en fin de ligne
; gère le mode windows pour les retours à la ligne, et ne marchera pas en retour chariot unix


.macro  vi_dec16_zp   addr

    lda     addr ; 98
    bne     *+2 ; go to label
    dec     addr+1
;label:
    dec     addr
.endmacro

CR = $0D
LF = $0A

IS_EOF                      = $00
IS_BEGINNING_OF_THE_FILE    = $00
IS_LAST_LINE_OF_SCREEN_TEXT = $01
IS_BEGINNING_OF_THE_LINE    = $00


VI_LAST_LINE_EDITOR            = 26 ; Last line used by the editor
VI_FILL_SCREEN_MODE_STOP_AT_THE_END_OF_LAST_LINE = 0
VI_COMMANDLINE_MAX_CHAR        = 8
VI_MAX_LENGTH_FILE             = 2000
VI_EDITOR_CHAR_LIMITS_EMPTY    = '~'
VI_COMMANDLINE_VIDEO_ADRESS    := $bb80+40*27
VI_EDITION_LAST_VIDEO_ADRESS   := $bb80+40*26
VI_EDITION_VIDEO_ADRESS        := $bb80
VI_EDITOR_MAX_LENGTH_OF_A_LINE = 255
VI_EDITOR_MAX_COLUMN           = 39



;* labels prefixed with _ are populated from C*/
    vi_struct                                   := userzp ; 2 bytes
    vi_ptr1                                     := userzp+2 ; 2 bytes
    vi_argv                                     := userzp+4 ; 2 bytes
    vi_argc                                     := userzp+6 ; 1 bytes
    vi_arg1                                     := userzp+7 ; 2 bytes
    vi_fp                                       := userzp+9 ; 2 bytes
    vi_ptr_file                                 := userzp+11 ; 2 bytes
    vi_tmp2                                     := userzp+13
    vi_ptr_screen                               := userzp+14 ; 2 bytes
    vi_length_file                              := userzp+16 ; 2 bytes
    vi_length_file_compute                      := userzp+18 ; 2 bytes
    vi_tmp1                                     := userzp+20
    vi_fileopened                               := userzp+22
    vi_ptr_file_used                            := userzp+24 ; 2 bytes
    tmp0_16                                     := userzp+26
    vi_no_opened_file                           := userzp+28
    vi_pos_debug                                := userzp+30
    vi_ptr2                                     := userzp+32 ; 2 bytes
    vi_savex                                    := userzp+34 ; 2 bytes
    vi_ptr3                                     := userzp+36 ; 2 bytes
    vi_tmp3                                     := userzp+38 ; 2 bytes




.include "data/vi/strings.s"
.include "Routines/vi_fill_screen_with_empty_line.s"

.include "Routines/vi_struct.s"
.include "Routines/vi_displays_info.s"

.include "Routines/subfunc/vi/vi_init_vi_struct.s"

.include "Routines/subfunc/vi/vi_ptr_last_char_plus_plus.s"
.include "Routines/subfunc/vi/vi_ptr_last_char_sub_sub.s"
.include "Routines/subfunc/vi/vi_set_ptr_last_char.s"
.include "Routines/subfunc/vi/vi_ptr_last_char_add.s"
.include "Routines/subfunc/vi/vi_vi_ptr_file_used_plus_plus.s"

.include "Routines/subfunc/vi/vi_xpos_screen_plus_plus.s"
.include "Routines/subfunc/vi/vi_xpos_screen_sub_sub.s"

.include "Routines/subfunc/vi/vi_ypos_screen_sub_sub.s"
.include "Routines/subfunc/vi/vi_ypos_screen_plus_plus.s"

.include "Routines/subfunc/vi/vi_ptr_file_used_plus_plus.s"
.include "Routines/subfunc/vi/vi_length_file_sub_sub.s"
.include "Routines/subfunc/vi/vi_display_char.s"
.include "Routines/subfunc/vi/vi_check_beginning_of_file.s"
.include "Routines/subfunc/vi/vi_fill_last_line.s"
.include "Routines/subfunc/vi/vi_copy_arg1_to_name_file_open.s"
.include "Routines/subfunc/vi/vi_length_file_plus_plus.s"
.include "Routines/subfunc/vi/vi_compute_video_adress.s"
.include "Routines/subfunc/vi/vi_ptr_file_used_sub_sub.s"
.include "Routines/subfunc/vi/vi_display_file_opened.s"
.include "Routines/subfunc/vi/vi_check_0A.s"
.include "Routines/subfunc/vi/vi_set_xpos_0.s"
.include "Routines/subfunc/vi/vi_ptr_file_used_plus_plus_and_check_eof.s"
.include "Routines/subfunc/vi/vi_search_next_line.s"
.include "Routines/subfunc/vi/vi_shift_file_from_memory_one_char.s"
.include "Routines/subfunc/vi/vi_check_inserted_char_overflow_the_max_column.s"
.include "Routines/subfunc/vi/vi_scroll_from_left_to_right_full_line.s"
.include "Routines/subfunc/vi/vi_shift_line_left_to_right_editor.s"
.include "Routines/subfunc/vi/vi_search_previous_line_beginning.s"
.include "Routines/subfunc/vi/vi_set_xpos_from_A.s"
.include "Routines/subfunc/vi/vi_scroll_to_left.s"
.include "Routines/subfunc/vi/vi_check_if_previous_line_was_truncated.s"
.include "Routines/subfunc/vi/vi_search_previous_cr.s"
.include "Routines/subfunc/vi/vi_add_char_to_text.s"
.include "Routines/subfunc/vi/vi_strlen_current_line.s"
.include "Routines/subfunc/vi/vi_compute_last_text_line.s"

.include "Routines/subfunc/vi/vi_clear_command_line.s"

.include "Routines/subfunc/vi/vi_key_down.s"
.include "Routines/subfunc/vi/vi_key_enter.s"
.include "Routines/subfunc/vi/vi_key_del.s"
.include "Routines/subfunc/vi/vi_key_up.s"
.include "Routines/subfunc/vi/vi_key_right.s"
.include "Routines/subfunc/vi/vi_key_left.s"
.include "Routines/subfunc/vi/vi_check_eof.s"

.include "Routines/vi_put_char.s"
.include "Routines/vi_command_edition.s"
.include "Routines/vi_editor_switch_on_cursor.s"
.include "Routines/vi_editor_switch_off_cursor.s"
.include "Routines/vi_edition_keyboard.s"
.include "Routines/vi_switch_to_edition_mode.s"

.include "Routines/tables.s"
.include "Routines/_clrscr_vi.s"


.proc _vi


    XMAINARGS       = $2C
    XGETARGV        = $2E
    argv            := userzp   ; 2 bytes
    argc            := userzp+2 ; 1 byte

    lda     #$00
    sta     vi_no_opened_file


    lda     #<$bb80
    sta     vi_ptr_screen

    lda     #>$bb80
    sta     vi_ptr_screen+1


    lda     #$00
    sta     vi_fileopened


    malloc .sizeof(vi_struct_data)

    cmp     #NULL
    bne     @not_oom2
    cpy     #NULL
    bne     @not_oom2
    print   str_OOM
    ; oom
    rts
@not_oom2:

    sta     vi_struct
    sty     vi_struct+1

    jsr     vi_init_vi_struct

    initmainargs vi_argv, vi_argc, 0

    lda     vi_argc  ; Do we have a file on the command line
    cmp     #$01
    beq     not_opened_file

    getmainarg #1, (vi_argv) ,vi_arg1

    ; Checking if vi_arg1 is not empty

    ; when we type "vi [space]" on command line, initmainargs returns argv=2 but the arg is empty
    ; This is a fix to avoid this
    ldy     #$00
@check_arg:
    lda     (vi_arg1),y
    beq     not_opened_file

@check_filename:

    fopen (vi_arg1), O_RDONLY,,vi_fp

    cpx     #$FF
    bne     opened_file
    cmp     #$FF
    bne     opened_file
    beq     not_opened_file



opened_file:
    lda     #$01
    sta     vi_fileopened

    ; copy into name_file_open of the struct
    jsr     vi_copy_arg1_to_name_file_open

not_opened_file:

    cursor OFF
    jsr     _clrscr_vi

    malloc #VI_MAX_LENGTH_FILE,vi_ptr_file ; $376B

    lda     vi_ptr_file ; $3769
    bne     @ptr_file_continue
    lda     vi_ptr_file+1
    bne     @ptr_file_continue
    print   str_OOM
    rts

@ptr_file_continue:
    ; Set last char of the file ptr

    lda     vi_ptr_file
    ldx     vi_ptr_file+1
    jsr     vi_set_ptr_last_char

    lda     vi_ptr_file         ; Contains the ptr $376B
    sta     vi_ptr_file_used

    lda     vi_ptr_file+1
    sta     vi_ptr_file_used+1

    lda     vi_fileopened
    beq     @skip_loading

    ; Now load the file
    fread (vi_ptr_file_used), #VI_MAX_LENGTH_FILE, 1, vi_fp ; myptr is from a malloc for example

    sta     vi_length_file
    sta     vi_length_file_compute
    stx     vi_length_file+1
    stx     vi_length_file_compute+1
    fclose(vi_fp)


    lda     vi_ptr_file
    sta     vi_ptr1
    sta     vi_ptr_file_used


    lda     vi_ptr_file+1
    sta     vi_ptr1+1
    sta     vi_ptr_file_used+1

    ; now set vi_ptr_last_char with the length of the file

    lda     vi_length_file
    ldx     vi_length_file+1
    jsr     vi_ptr_last_char_add

    ; Check eof
    ; Dans le cas où on a chargé avant un fichier, comme on ne s'arrete pas à l'eof du fichier courant, cela va continuer a s'afficher alors même qu'on est à la fin du fichier
    ; Cela va afficher l'ancien fichier chargé. On compare donc pour s'arreter.

    jsr     vi_display_file_opened

@skip_fill_last_line:

    ldx     #$01
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    beq     @no_compute ; First line ? Then X=1 in order to display ~ on the second line
    cmp     #VI_LAST_LINE_EDITOR
    beq     @no_empty_line_begin

    tax
    inx

@no_compute:
    ldy     #$01
    jmp     @display_empty_line_begin

@skip_loading:
    ldy     #$01 ; For a new_file
    ldx     #$01
@display_empty_line_begin:
    jsr     vi_fill_screen_with_empty_line

@no_empty_line_begin:
    ; Set cursor position to 0,0
    ldy     #vi_struct_data::ypos_screen
    lda     #$00
    sta     (vi_struct),y

    ldy     #vi_struct_data::xpos_screen
    sta     (vi_struct),y

    lda     vi_ptr_file         ; Contains the ptr
    sta     vi_ptr_file_used

    lda     vi_ptr_file+1
    sta     vi_ptr_file_used+1


@loop_until_esc_is_pressed:

    jsr     vi_edition_keyboard

    cmp     #$01

    beq     @final_exit
    jmp     @loop_until_esc_is_pressed

@final_exit:
    rts

; **********************************




str_OOM:
    .asciiz "OOM"       ; FIXME import from general lib
str_not_found:
    .asciiz "File not found"


.endproc
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
