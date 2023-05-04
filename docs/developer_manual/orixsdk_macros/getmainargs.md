# Getmainargs

## Description

Get arg

## Usage

Get main args : get arg value

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_mainargs.mac"

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
    rts
```

Result (argbin) is binary in assembly with a parameter "foo"

```bash
/#argbin foo
foo
```

Call [XGETARGV](../../../kernel/primitives/xgetargv/) kernel function.
