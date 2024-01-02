---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_struct.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/vi_struct.s



## Classes

|                | Name           |
| -------------- | -------------- |
| struct | **[vi_struct_data](Classes/structvi__struct__data.md)**  |

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[VI_MAX_LENGTH_FILENAME16](Files/vi__struct_8s.md#define-vi-max-length-filename16)**  |




## Macros Documentation

### define VI_MAX_LENGTH_FILENAME16

```cpp
#define VI_MAX_LENGTH_FILENAME16 
```


## Source code

```cpp

.define VI_MAX_LENGTH_FILENAME 16

.struct vi_struct_data
    xpos_screen       .byte    ; position x of the cursor on the screen
    ypos_screen       .byte    ; position y of the cursor on the screen
    pos_file_addr     .res 2   ; position on the file (address)
    pos_file          .res 4   ; position in the file
    posx_command_line .byte    ; position on command line
    name_file_open    .res     VI_MAX_LENGTH_FILENAME
    ;ptr_file_begin   .word    ; adress of the beginning of the file
    length_file       .res 4   ; Length of the file
    pos_ptr_video_address .res 2
    file_number_of_line   .res 4
    xpos_command_line     .res 1
    command_line_buffer   .res 39
    ptr_last_char_file    .res 2
    line_id               .res 2
    xpos_text             .res 1
    ypos_text             .res 1
.endstruct

.if     .sizeof(vi_struct_data) > 255
  .error  "vi_struct_data size is greater than 255. It's impossible because code does not handle a struct greater than 255"
.endif
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
