# FOPEN

```ca65
;----------------------------------------------------------------------
;
; usage:
;	fopen file, mode [,TELEMON] [,ptr] [,oom_msg_ptr] [,fail_value]
;
; note:
;	- file may be: (ptr), address
;	- if parameter 'ptr' is present, store resulting AX in ptr & ptr+1
;	- if parameter 'oom_msg_ptr' is present, emit string pointed by
;		'oom_msg_ptr' and return if AX is $FFFF (ie XOPEN error)
;
; Call XOPEN function
;----------------------------------------------------------------------
```

ex :

```ca65
    .include "telestrat.inc"          ; from cc65
    .include "fcntl.inc"              ; from cc65
    .include "../dependencies/orix-sdk/macros/SDK_file.mac"
    .include "../dependencies/orix-sdk/macros/SDK_print.mac"

start:
    fopen (basic11_ptr2), O_RDONLY,,fp ; open the filename located in ptr 'basic11_ptr2', in readonly and store the fp in fp address
    cpx     #$FF
    bne     @read_maindb ; not null then  start because we did not found a conf
    cmp     #$FF
    bne     @read_maindb ; not null then  start because we did not found a conf

    print   str_basic11_missing
    crlf    ; Macro for return line
    lda     #$FF
    ldx     #$FF
    rts
fp:
    .res 2
@read_maindb:
    ; bla

```

!!! warning "The filename/path address must not be in the rom. If it's the case, the string must be copied into main memory because Kernel overlap the ROM. fopen macro from SDK will produce an error, if the 'address' is in a ROM range (eg : $c000-$FFFF). If you use a ptr, macro can not detect it, and XOPEN primitive won't be able to open your file"

See XOPEN kernel primitive : [XOPEN](../kernel/primitives/xopen)
