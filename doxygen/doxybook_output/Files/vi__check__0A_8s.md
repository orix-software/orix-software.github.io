---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_0A.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_check_0A.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_0A](Files/vi__check__0A_8s.md#function-vi-check-0a)**() |


## Functions Documentation

### function vi_check_0A

```cpp
vi_check_0A()
```




## Source code

```cpp

.proc vi_check_0A
   ; jmp vi_check_0A
    ; $c398
    lda     (vi_ptr_file_used),y
    cmp     #$0A
    beq     @exit_advance_after_LF
    rts
@exit_advance_after_LF:
    jsr     vi_vi_ptr_file_used_plus_plus
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
