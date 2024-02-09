# Getmainargs

## Description

Get arg

## Usage

Get main args : get arg value

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_mainargs.mac"

    argv            := userzp   ; 2 bytes
    argc            := userzp+2 ; 1 byte
    first_arg_ptr   := userzp+2 ; 1 byte

    ; Init struct
    initmainargs argv, argc, 0

    getmainarg #1, (argv)

    ; Save the ptr of the first parameter in first_arg_ptr
    sta     first_arg_ptr
    sty     first_arg_ptr+1

    ; Displays because A and Y are set
    BRK_TELEMON XWSTR0 ; Displays the arg 1 from the command line
    rts
```

Result (argbin) is binary in assembly with a parameter "foo"

```bash
/#argbin foo
foo
```

Call [XGETARGV](../../../kernel/primitives/xgetargv) kernel function.

!!! warning "Since cc65 last version (2024 release), XMAINARGS and XGETARGV did not need to declare anymore"
