# Orix SDK

It provides macro to help assembly coding for Orix.

## Load it

you just need to load macro file in your code (and telestrat.inc from cc65):

```ca65
.include "telestrat.inc"
.include "macros/SDK.mac"
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

;----------------------------------------------------------------------
;
; usage:
;	mfree (ptr)
;
; Call XFREE function
;----------------------------------------------------------------------
