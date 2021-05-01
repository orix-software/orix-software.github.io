# XOPENLIB

``` ca65
lda #<lib_sdl
ldy #>lib_sdl
BRK_KERNEL OPENLIB
; Return in X the id of the lib
rts
lib_sdl:
  .asciiz "sdl.so"

```

``` ca65
; RES contains the id of the lib
; A & Y contains maybe the struct
; X contains others thing
; RES contains the id of the function
BRK_KERNEL XCALL

```
