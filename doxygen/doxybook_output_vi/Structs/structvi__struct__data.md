---
title: vi_struct_data

---

# vi_struct_data





## Public Attributes

|                | Name           |
| -------------- | -------------- |
| char | **[xpos_screen](Structs/structvi__struct__data.md#variable-xpos-screen)**  |
| char | **[ypos_screen](Structs/structvi__struct__data.md#variable-ypos-screen)**  |
| int | **[pos_file_addr](Structs/structvi__struct__data.md#variable-pos-file-addr)**  |
| char[4] | **[pos_file](Structs/structvi__struct__data.md#variable-pos-file)**  |
| char | **[posx_command_line](Structs/structvi__struct__data.md#variable-posx-command-line)**  |
| char[VI_MAX_LENGTH_FILENAME] | **[name_file_open](Structs/structvi__struct__data.md#variable-name-file-open)**  |
| | **[int](Structs/structvi__struct__data.md#variable-int)**  |
| | **[ptr_file_begin](Structs/structvi__struct__data.md#variable-ptr-file-begin)**  |
| char[4] | **[length_file](Structs/structvi__struct__data.md#variable-length-file)**  |
| int | **[pos_ptr_video_address](Structs/structvi__struct__data.md#variable-pos-ptr-video-address)**  |
| char[4] | **[file_number_of_line](Structs/structvi__struct__data.md#variable-file-number-of-line)**  |
| char | **[xpos_command_line](Structs/structvi__struct__data.md#variable-xpos-command-line)**  |
| char[39] | **[command_line_buffer](Structs/structvi__struct__data.md#variable-command-line-buffer)**  |
| int | **[ptr_last_char_file](Structs/structvi__struct__data.md#variable-ptr-last-char-file)**  |
| int | **[line_id](Structs/structvi__struct__data.md#variable-line-id)**  |
| char | **[xpos_text](Structs/structvi__struct__data.md#variable-xpos-text)**  |
| char | **[ypos_text](Structs/structvi__struct__data.md#variable-ypos-text)**  |

## Public Attributes Documentation

### variable xpos_screen

```ca65
char xpos_screen;
```


position x of the cursor on the screen 


### variable ypos_screen

```ca65
char ypos_screen;
```


position y of the cursor on the screen 


### variable pos_file_addr

```ca65
int pos_file_addr;
```


position on the file (address) 


### variable pos_file

```ca65
char[4] pos_file;
```


position in the file 


### variable posx_command_line

```ca65
char posx_command_line;
```


position on command line 


### variable name_file_open

```ca65
char[VI_MAX_LENGTH_FILENAME] name_file_open;
```


### variable int

```ca65
int;
```


### variable ptr_file_begin

```ca65
ptr_file_begin;
```


adress of the beginning of the file 


### variable length_file

```ca65
char[4] length_file;
```


Length of the file 


### variable pos_ptr_video_address

```ca65
int pos_ptr_video_address;
```


### variable file_number_of_line

```ca65
char[4] file_number_of_line;
```


### variable xpos_command_line

```ca65
char xpos_command_line;
```


### variable command_line_buffer

```ca65
char[39] command_line_buffer;
```


### variable ptr_last_char_file

```ca65
int ptr_last_char_file;
```


### variable line_id

```ca65
int line_id;
```


### variable xpos_text

```ca65
char xpos_text;
```


### variable ypos_text

```ca65
char ypos_text;
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100