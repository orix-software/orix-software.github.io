# 


## Samples for kernel calls

### Displays a string

   lda #<mystr
   ldy #>mystr
   BRK_KERNEL XWRSTR0
   rts
   mys

