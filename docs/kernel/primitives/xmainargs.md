# XMAINARGS (argmains)

ID primitive : $2C

## Description

Return argc and argv or a ptr with a content of the command line

## Input

A => mode

mode 0 : return a struct of args

mode 1 : return the string of the command line (ptr)

## Output

Mode 0 :

* A & Y :contains ptr to XMAINARGS Struct
* X: number of args

Mode 1 :

* A & Y : a ptr to a new malloc which contains commandline

## Usage

Mode 0 : parse command line and build argc/argv

```ca65
XMAINARGS = $2C

lda	#$00 ; Mode 0
BRK_TELEMON XMAINARGS

stx save_argc
sta save_argv
sty save_argv+1
rts
```

Mode 1 : return command line

```ca65
XMAINARGS = $2C

lda   #$01 ; Mode 0
BRK_TELEMON XMAINARGS

sta ptr_cmd
sty ptr_cmd+1 ; ptr_cmd contains the ptr to the command line. It allocates a string, it needs to be free when the program does not need it anymore
rts
```

!!! tip "See [initmainargs](../../developer_manual/orixsdk_macros/initmainargs/) macro from orix-sdk to use it "

!!! warning "XMAINARGS allocates a chunk in memory, it must be free at the end of the use of the parameters"

!!! warning "Mode 0 is available since v2022.4"

!!! fail "XGETARGV does not handle "" yet and "\ in parameters"
