# Orix 8 Bits

# Install environment development for developers

* [Getting-started](getting-started)


## Kernel primitives

* [Primitives](primitives)
* [Mount Management](mount)

* Doxygen for [kernel](doxygen/kernel).

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

### Test kernel Error when fopen failed

``` ca65
    ; Open
    ... 
    BRK_KERNEL XOPEN 
    cpy     #$00
    bne     @read_rom 
    cmp     #$00
    bne     @read_rom 

    ldx     #$04 ; Get kernel ERRNO
    BRK_KERNEL XVARS
    sta     userzp
    sty     userzp+1

    ldy     #$00
    lda     (userzp),y ; get ERRNO from kernel
    cmp     #ENOMEM
    bne     @no_enomem_kernel_error
    PRINT   str_enomem

@no_enomem_kernel_error:
    cmp     #ENOENT
    bne     @no_enoent_kernel_error
    PRINT   str_not_found
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
   mysstr:
      .asciiz "hello" 
```   

