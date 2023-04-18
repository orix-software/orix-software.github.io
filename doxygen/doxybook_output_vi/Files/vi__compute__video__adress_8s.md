---
title: vi_compute_video_adress.s

---

# vi_compute_video_adress.s



## Routine

|                | Name           |
| -------------- | -------------- |
| | **[vi_compute_video_adress](Files/vi__compute__video__adress_8s.md#Routine-vi-compute-video-adress)** |


## Routine documentation

### Routine vi_compute_video_adress

```ca65
vi_compute_video_adress
```




## Source code

```ca65

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

Updated on 2022-12-15 at 14:20:17 +0100
