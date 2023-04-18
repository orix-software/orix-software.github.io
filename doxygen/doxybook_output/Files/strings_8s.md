---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/data/vi/strings.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/data/vi/strings.s



## Attributes

|                | Name           |
| -------------- | -------------- |
| char[2] | **[msg_nofilename](Files/strings_8s.md#variable-msg-nofilename)**  |
| char[2] | **[msg_impossibletowrite](Files/strings_8s.md#variable-msg-impossibletowrite)**  |



## Attributes Documentation

### variable msg_nofilename

```cpp
char[2] msg_nofilename;
```


### variable msg_impossibletowrite

```cpp
char[2] msg_impossibletowrite;
```



## Source code

```cpp
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

Updated on 2022-12-15 at 11:48:27 +0100
