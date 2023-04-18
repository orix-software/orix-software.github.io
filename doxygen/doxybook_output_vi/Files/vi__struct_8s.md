---
title: /Routines/vi_struct.s

---

# /Routines/vi_struct.s



## Classes

|                | Name           |
| -------------- | -------------- |
| struct | **[vi_struct_data](Structs/structvi__struct__data.md)**  |

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[VI_MAX_LENGTH_FILENAME](Files/vi__struct_8s.md#define-vi-max-length-filename)**  |




## Macros Documentation

### define VI_MAX_LENGTH_FILENAME

```ca65
#define VI_MAX_LENGTH_FILENAME 16
```


## Source code

```ca65

.define VI_MAX_LENGTH_FILENAME 16

.struct vi_struct_data
    xpos_screen           .byte    ; position x of the cursor on the screen
    ypos_screen           .byte    ; position y of the cursor on the screen
    pos_file_addr         .word   ; position on the file (address)
    pos_file              .res 4   ; position in the file
    posx_command_line     .byte    ; position on command line
    name_file_open        .res     VI_MAX_LENGTH_FILENAME
    ;ptr_file_begin   .word    ; adress of the beginning of the file
    length_file           .res 4   ; Length of the file
    pos_ptr_video_address .word
    file_number_of_line   .res 4
    xpos_command_line     .byte
    command_line_buffer   .res 39
    ptr_last_char_file    .word
    line_id               .word
    xpos_text             .byte
    ypos_text             .byte
.endstruct

.if     .sizeof(vi_struct_data) > 255
  .error  "vi_struct_data size is greater than 255. It's impossible because code does not handle a struct greater than 255"
.endif
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
