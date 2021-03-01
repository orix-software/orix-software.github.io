# Samples in Assembly

##  Malloc

Allocate 4000 bytes and displays a message if the 4000 bytes can't be allocated, else store ptr to myptr3

malloc is done with Orix-sdk

``` ca65
.include "telestrat.inc"
.include "macros/SDK.mac"

myptr3 := userzp

malloc 4000,myptr3,str_enomem ; Index ptr
rts
str_enoemem:
 .asciiz "Out of memory"

```