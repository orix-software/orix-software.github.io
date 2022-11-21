# XGETARGV

## Description

Get argv. X register contains the number of the arg search

Kernel handle a struct with XMAINARGS. This struct is handled by Kernel, and no action are required in external code, but here is how struct works :

``` ca65
.struct XMAINARGS_STRUCT
argv_ptr          .res     KERNEL_MAX_ARGS_COMMAND_LINE
argv_value_ptr    .res     KERNEL_LENGTH_MAX_CMDLINE+KERNEL_MAX_ARGS_COMMAND_LINE ; add 0 to string
.endstruct
```

argv_ptr contains an offset of each param. It means that we can't have a length of args greater than 256.

XMAINARGS and XGETARGV does not handle "" yet and "\ "

## Input

A & Y the ptr of struct from XMAINARGS

X the number of arg to get, first param is 0 not 1 !

## Output

A & Y contains argv ptr from xmainargs struct. It returns a copy of the command line with args parsed

## Example

``` ca65
    XMAINARGS = $2C
    XGETARGV = $2E
    BRK_KERNEL XMAINARGS
    sta   debug_mainargs_ptr
    sty   debug_mainargs_ptr+1

    ldx   #$02 ; get arg 2 ; Get the third param
    lda   debug_mainargs_ptr
    ldy   debug_mainargs_ptr+1

    BRK_KERNEL XGETARGV

    ; A & Y contains ptr
```

Page last revised on: {{ git_revision_date }}
