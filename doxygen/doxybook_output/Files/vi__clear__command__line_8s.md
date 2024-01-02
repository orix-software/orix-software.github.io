---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_clear_command_line.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_clear_command_line.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_clear_command_line](Files/vi__clear__command__line_8s.md#function-vi-clear-command-line)**() |


## Functions Documentation

### function vi_clear_command_line

```cpp
vi_clear_command_line()
```




## Source code

```cpp
.proc vi_clear_command_line
    ldx     #40
    lda     #$00 ; Set command line with 0
@loop:
    sta     VI_COMMANDLINE_VIDEO_ADRESS,x
    dex
    bpl     @loop
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
