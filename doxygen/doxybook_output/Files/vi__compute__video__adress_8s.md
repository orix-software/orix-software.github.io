---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_compute_video_adress.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/subfunc/vi/vi_compute_video_adress.s



## Functions

|                | Name           |
| -------------- | -------------- |
| | **[vi_compute_video_adress](Files/vi__compute__video__adress_8s.md#function-vi-compute-video-adress)**() |


## Functions Documentation

### function vi_compute_video_adress

```cpp
vi_compute_video_adress()
```




## Source code

```cpp

.proc vi_compute_video_adress
    ldy     #vi_struct_data::ypos_screen
    lda     (vi_struct),y
    tay
    lda     TABLE_LOW_TEXT,y
    sta     vi_ptr_screen
    lda     TABLE_HIGH_TEXT,y
    sta     vi_ptr_screen+1
    rts
.endproc
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
