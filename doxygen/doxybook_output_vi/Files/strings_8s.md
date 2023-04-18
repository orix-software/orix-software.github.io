---
title: /data/vi/strings.s

---

# /data/vi/strings.s



## Attributes

|                | Name           |
| -------------- | -------------- |
| const char[13] | **[msg_insert](Files/strings_8s.md#variable-msg-insert)**  |
| const char[11] | **[msg_nofile](Files/strings_8s.md#variable-msg-nofile)**  |
| char[2] | **[msg_nofilename](Files/strings_8s.md#variable-msg-nofilename)**  |
| char[2] | **[msg_impossibletowrite](Files/strings_8s.md#variable-msg-impossibletowrite)**  |
| const char[8] | **[msg_written](Files/strings_8s.md#variable-msg-written)**  |



## Attributes Documentation

### variable msg_insert

```ca65
const char[13] msg_insert = "-- INSERT --";
```


### variable msg_nofile

```ca65
const char[11] msg_nofile = "[New File]";
```


### variable msg_nofilename

```ca65
char[2] msg_nofilename;
```


### variable msg_impossibletowrite

```ca65
char[2] msg_impossibletowrite;
```


### variable msg_written

```ca65
const char[8] msg_written = "written";
```



## Source code

```ca65
msg_insert:
    .asciiz "-- INSERT --"

msg_nofile:
    .asciiz "[New File]"

msg_nofilename:
    .byte 17,"E32: No file name",16,0

msg_impossibletowrite:
    .byte 17,"E99: Impossible to write",16,0

msg_written:
    .asciiz "written"
```


-------------------------------

Updated on 2022-12-15 at 14:20:17 +0100
