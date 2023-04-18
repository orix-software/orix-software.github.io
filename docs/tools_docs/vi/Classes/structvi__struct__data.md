---
title: vi_struct_data

---

# vi_struct_data





## Public Attributes

|                | Name           |
| -------------- | -------------- |
| char | **[xpos_screen](Classes/structvi__struct__data.md#variable-xpos-screen)**  |
| char | **[ypos_screen](Classes/structvi__struct__data.md#variable-ypos-screen)**  |
| char[2] | **[pos_file_addr](Classes/structvi__struct__data.md#variable-pos-file-addr)**  |
| char[4] | **[pos_file](Classes/structvi__struct__data.md#variable-pos-file)**  |
| char | **[posx_command_line](Classes/structvi__struct__data.md#variable-posx-command-line)**  |
| char[VI_MAX_LENGTH_FILENAME] | **[name_file_open](Classes/structvi__struct__data.md#variable-name-file-open)**  |
| | **[int](Classes/structvi__struct__data.md#variable-int)**  |
| | **[ptr_file_begin](Classes/structvi__struct__data.md#variable-ptr-file-begin)**  |
| char[4] | **[length_file](Classes/structvi__struct__data.md#variable-length-file)**  |
| char[2] | **[pos_ptr_video_address](Classes/structvi__struct__data.md#variable-pos-ptr-video-address)**  |
| char[4] | **[file_number_of_line](Classes/structvi__struct__data.md#variable-file-number-of-line)**  |
| char[1] | **[xpos_command_line](Classes/structvi__struct__data.md#variable-xpos-command-line)**  |
| char[39] | **[command_line_buffer](Classes/structvi__struct__data.md#variable-command-line-buffer)**  |
| char[2] | **[ptr_last_char_file](Classes/structvi__struct__data.md#variable-ptr-last-char-file)**  |
| char[2] | **[line_id](Classes/structvi__struct__data.md#variable-line-id)**  |
| char[1] | **[xpos_text](Classes/structvi__struct__data.md#variable-xpos-text)**  |
| char[1] | **[ypos_text](Classes/structvi__struct__data.md#variable-ypos-text)**  |

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
char[2] pos_file_addr;
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


adress of the beginning of the file 


### variable ptr_file_begin

```ca65
ptr_file_begin;
```


### variable length_file

```ca65
char[4] length_file;
```


Length of the file 


### variable pos_ptr_video_address

```ca65
char[2] pos_ptr_video_address;
```


### variable file_number_of_line

```ca65
char[4] file_number_of_line;
```


### variable xpos_command_line

```ca65
char[1] xpos_command_line;
```


### variable command_line_buffer

```ca65
char[39] command_line_buffer;
```


### variable ptr_last_char_file

```ca65
char[2] ptr_last_char_file;
```


### variable line_id

```ca65
char[2] line_id;
```


### variable xpos_text

```ca65
char[1] xpos_text;
```


### variable ypos_text

```ca65
char[1] ypos_text;
```


-------------------------------

Updated on 2022-12-15 at 12:29:28 +0100