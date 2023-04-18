---
title: vi_check_0A.s

---

# vi_check_0A.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_check_0A](Files/vi__check__0A_8s.md#Routine-vi-check-0a)** |


## Routine documentation

### Routine vi_check_0A

```ca65
vi_check_0A
```




## Source code

```ca65

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

Updated on 2022-12-15 at 14:20:17 +0100
