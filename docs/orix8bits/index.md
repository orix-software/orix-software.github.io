# 

## Samples for kernel calls

### Get ctrl+c hook

``` ca65
   .include "telestrat.inc"
    asl     KBDCTC
    bcc     @no_ctrl
    ; here is ctrl management
@no_ctrl:
      rts

```

### Stop output when spacebar is pressed (for example)

``` ca65
   .include "telestrat.inc"
@L12:
   BRK_KERNEL XRD0
   bcs     @no_char_action
   cmp     #' ' ; Space pressed ?
   bne     @no_char ; no continue

   lda     myOffsetToManageSwitch ; One byte
   beq     @inv_to_1

   lda     #$00
   sta     myOffsetToManageSwitch
   jmp     @L12

@inv_to_1:
   inc     myOffsetToManageSwitch
   jmp     @L12

@no_char_action:
   lda     myOffsetToManageSwitch
   beq     @L12

@no_char:
   ; No keypressed
```

### Displays a string

``` ca65
   lda #<mystr
   ldy #>mystr
   BRK_KERNEL XWRSTR0
   rts
   mysstr
```   

