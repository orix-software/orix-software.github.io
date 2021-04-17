# Orix SDK

It provides macro to help assembly coding for Orix : 

https://github.com/assinie/orix-sdk/

## Load it

you just need to load macro file in your code (and telestrat.inc from cc65):

```ca65
.include "telestrat.inc"
.include "macros/SDK.mac"
```

## fopen

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
    fopen (basic11_ptr2), O_RDONLY
    cpx     #$FF
    bne     @read_maindb ; not null then  start because we did not found a conf
    cmp     #$FF
    bne     @read_maindb ; not null then  start because we did not found a conf
    
    PRINT   str_basic11_missing
    BRK_KERNEL XCRLF
    lda     #$FF
    ldx     #$FF
    rts
@read_maindb:
    bla

```


## Malloc

```ca65
;----------------------------------------------------------------------
;
; usage:
;	malloc size [,ptr] [,oom_msg_ptr] [,fail_value]
;
;	malloc #$0100
;	malloc (ptr)
;	malloc value
;
; Note:
;	- if parameter 'ptr' is present, store resulting AY in ptr &ptr+1
;	- if parameter 'oom_msg_ptr' is present, emit string pointed by
;		'oom_msg_ptr' and return if AY is null (ie malloc error)
;
; Call XMALLOC function
;
;----------------------------------------------------------------------
```

## Mfree (free pointer)

```ca65


;----------------------------------------------------------------------
;
; usage:
;	mfree (ptr)
;
; Call XFREE function
;----------------------------------------------------------------------
```
