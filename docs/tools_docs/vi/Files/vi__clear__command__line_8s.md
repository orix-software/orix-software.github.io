---
title: vi_clear_command_line.s

---

# vi_clear_command_line.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_clear_command_line](Files/vi__clear__command__line_8s.md#Routine-vi-clear-command-line)** |


## Routine documentation

### Routine vi_clear_command_line

```ca65
vi_clear_command_line
```




## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
