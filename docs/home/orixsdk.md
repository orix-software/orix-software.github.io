# Orix SDK

It provides macro to help assembly coding for Orix :

https://github.com/assinie/orix-sdk/

The main way to handle orix-sdk is to add it as gitmodules (for example in a "dependencies folder")

## Load Orix SDK

you just need to load macro file in your code (and telestrat.inc from cc65):

```ca65
.include "telestrat.inc"
.include "macros/SDK.mac"
```

## Display operation

### print string in text mode

```ca65
	;----------------------------------------------------------------------
	;
	; usage:
	;	print #byte [,TELEMON|NOSAVE]
	;	print (pointer) [,TELEMON|NOSAVE]
	;	print address [,TELEMON|NOSAVE]
	;
	; Option:
	;	- TELEMON: when used within TELEMON bank
	;	- NOSAVE : does not preserve A,X,Y registers
	;
	; Call XWSTR0 function
	;
	;----------------------------------------------------------------------
```

## Files operation

### fopen

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

!!! warning "The filename/path address must not be in the rom. If it's the case, the string must be copied into main memory because Kernel overlap the ROM. fopen macro from SDK will produce an error, if the 'address' is in a ROM range (eg : $c000-$FFFF). If you use a ptr, macro can not detect it, and XOPEN primitive won't be able to open your file"

### FREAD macro

```ca65
;----------------------------------------------------------------------
	;
	; usage:
	;	fread ptr, size, count, fp
	;
	; note:
	;	ptr may be : (ptr), address
	;	size may be: (ptr), address
	;	fp may be  : address, #value, {address,y}
	;
	; Call XFREAD function
	;----------------------------------------------------------------------
```

Example :

```ca65
    fopen (MAN_SAVE_MALLOC_PTR), O_RDONLY
    cpx     #$FF
    bne     next

    cmp     #$FF
    bne     next
    ; Not found
    rts

next:
    ; Save FP
    sta     MAN_FP
    stx     MAN_FP+1
    fread myptr, 1080, 1, MAN_FP
    fclose(MAN_FP)
```

### FWRITE macro

```ca65
    ;----------------------------------------------------------------------
	;
	; usage:
	;	fwrite ptr, size, count, fp
	;
	; note:
	;	ptr may be : (ptr), address
	;	size may be: (ptr), address
	;	fp may be  : address, #value, {address,y}
	;
	; Call XFWRITE function
	;----------------------------------------------------------------------
```

### FCLOSE macro

```ca65
	;----------------------------------------------------------------------
	;
	; usage:
	;	fclose (fp) [,TELEMON]
	;
	; Call XCLOSE function
	;----------------------------------------------------------------------
```

### MKDIR macro

```ca65
	;----------------------------------------------------------------------
	;
	; usage:
	;	mkdir ptr [,TELEMON]
	;
	; note:
	;	ptr may be: (ptr), address
	;
	; Call XMKDIR function
	;----------------------------------------------------------------------
```

### CHDIR macro

```ca65
	;----------------------------------------------------------------------
	;
	; usage:
	;	chdir ptr [,TELEMON]
	;
	; note:
	;	ptr may be: (ptr), address
	;
	; Call XPUTCWD function
	;----------------------------------------------------------------------
```

## Memory operations

### Malloc

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

### Mfree (free pointer)

```ca65

;----------------------------------------------------------------------
;
; usage:
;	mfree (ptr)
;
; Call XFREE function
;----------------------------------------------------------------------
```

## Strings operation

### strncpy

```ca65

;----------------------------------------------------------------------
; strncpy src, dest, n
;
; Sortie:
;        A: 0 et Z=1 si copie effectuée, inchangé si non
;        X: 0
;        Y: Longueur réellement copiée
;----------------------------------------------------------------------
```

```ca65

    lda     #<file_path
    sta     ptr2
    lda     #>file_path
    sta     ptr2+1

    strncpy ptr2, ptr1, #20 ;Limit 20 bytes (immediate mode) strncpy(src, dest, n)
```

### strncat

concat 2 strings. Strings must be terminated by 0

strncat src, dest, n


```ca65
    lda     #<file_path
    sta     ptr2
    lda     #>file_path
    sta     ptr2+1

    strncpy ptr2, ptr1, #20 ;strncpy(src, dest, n)

    lda     files_type_loader_low
    sta     ptr2
    lda     files_type_loader_high
    sta     ptr2+1


    strncat RESB, ptr1 , #13
```


!!! warning "dest ptr will be changed by strncat. dest pointer must be saved"


