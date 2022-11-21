# Orix SDK

It provides macro to help assembly coding for Orix :

https://github.com/assinie/orix-sdk/

The main way to handle orix-sdk is to add it as gitmodules (for example in a "dependencies folder")

## Install in a project

```bash
mkdir myasmproject
cd  myasm_project
mkdir dependencies && cd dependencies
git clone https://github.com/assinie/orix-sdk.git

```

## Load Orix SDK

you just need to load macro file in your code (and telestrat.inc from cc65):

```ca65
.include "telestrat.inc"
.include "dependencies/orix-sdk/macros/SDK.mac"
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

## Get args from command line

### Init struct of the mainargs from current process

```ca65
	XMAINARGS       = $2C
	XGETARGV        = $2E
	argv            := userzp   ; 2 bytes
	argc            := userzp+2 ; 1 byte

	initmainargs argv, argc, 0
```

### Get arg 1

```ca65
	XMAINARGS       = $2C
	XGETARGV        = $2E
	argv            := userzp   ; 2 bytes
	argc            := userzp+2 ; 1 byte

	; Init struct
	initmainargs argv, argc, 0

    getmainarg #1, (argv)

	; Save the ptr of the parameter
    sta     argv
    sty     argv+1

	BRK_TELEMON XWSTR0 ; Displays the arg 1 from the command line

```

Result (argbin) is binary in assembly with a parameter "foo"

```bash
/#argbin foo
foo
```


Page last revised on: {{ git_revision_date }}
