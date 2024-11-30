# XVALUES ROUTINE

Get vars from kernel

## Get Free malloc table

X = KERNEL_XVALUES_FREE_MALLOC_TABLE

KERNEL_XVALUES_FREE_MALLOC_TABLE = $02

Returns in A and Y a copy of free malloc table. This ptr must be free when the buffer is useless

### Example

```ca65
    .include "telestrat.inc"

    KERNEL_XVALUES_FREE_MALLOC_TABLE = $02

    ldx     #KERNEL_XVALUES_FREE_MALLOC_TABLE

    BRK_TELEMON  $2D ; XVALUES

    ; A and Y contains a ptr of free malloc table

    rts
```

## Get Busy malloc table ($07)

X = KERNEL_XVALUES_BUSY_MALLOC_TABLE

KERNEL_XVALUES_FREE_MALLOC_TABLE = $07

Returns in A and Y a copy of busy malloc table. This ptr must be free when the buffer is useless

```ca65
    .include "telestrat.inc"

    KERNEL_XVALUES_FREE_MALLOC_TABLE = $07

    ldx     #KERNEL_XVALUES_BUSY_MALLOC_TABLE

    BRK_TELEMON  $2D ; XVALUES

    rts
```

## Get processName of the current chunk ($08)

Y contains the id of the malloc busy table

Y = the pid
X = 08

It returns in A & Y the ptr of the process name.

KERNEL_XVALUES_GET_CURRENT_PROCESSNAME_FROM_PID = $08

```ca65
    .include "telestrat.inc"

    KERNEL_XVALUES_GET_CURRENT_PROCESSNAME_FROM_PID = $07

    ldx     #KERNEL_XVALUES_GET_CURRENT_PROCESSNAME_FROM_PID
    ldy     #03 ; Get the name of pid = 3

    BRK_TELEMON  $2D ; XVALUES

    rts
```

## Get the path of an opened file and mode of the opened file ($09)

KERNEL_XVALUES_PATH_FROM_FD = $09

Y must contains the fd.

```ca65
    .include "telestrat.inc"

    KERNEL_XVALUES_PATH_FROM_FD = $09

    ldx     #KERNEL_XVALUES_PATH_FROM_FD
    ldy     #$03 ; Get the name of pid = 3

    BRK_TELEMON  $2D ; XVALUES
    ; A and Y contains the ptr of path
    ; X contains the mode of the file
    rts
```

## Get the position in the opened file/ftell ($0A)

KERNEL_XVALUES_GET_FTELL_FROM_FD = $0A

Params :

* X = KERNEL_XVALUES_GET_FTELL_FROM_FD
* A = FD

It returns in A, X, Y and RES, the position in the file

```ca65
    .include "telestrat.inc"

    KERNEL_XVALUES_PATH_FROM_FD = $0A

    ldx     #KERNEL_XVALUES_GET_FTELL_FROM_FD
    lda     myfd ; fd

    BRK_TELEMON  $2D ; XVALUES
    ; A, X, Y and RES contains the size
    ; X contains the mode of the file
    rts
```

## Get the ptr of the pid list (KERNEL_XVALUES_GET_PROCESS_ID_LIST=$0C)

KERNEL_XVALUES_GET_PROCESS_ID_LIST=$0C

; A and Y contains the ptr

## Get the processname with the PID

A = contains the POI

X = KERNEL_XVALUES_GET_PROCESS_NAME_WITH_PID

A & Y = contains the ptr of processname

## Get the number of malloc available in the kernel

X = 5

Returns in A the number of the malloc

## Get the magic number of the kernel

X = 6

Returns in A the magic number

## Get the max process configured in the kernel

X = 8

Output :

A contains the max process

## Get Os string (Orix)

```ca65
    .include "telestrat.inc"

    XVARS_KERNEL_OSNAME = 9

    ldx     #XVARS_KERNEL_OSNAME
    BRK_TELEMON XVARS
    ; A and X contains the ptr to osname
    rts
```

!!! warning "It will be available in Kernel v2023.2"

## Get an empty bank (KERNEL_XVALUES_GET_FREE_BANK = $10)

Get an empty bank and register if the bank must be known by the kernel as a referenced type (Only Network is available in that case and is reserved, for any others cases, set A to KERNEL_BANK_UNDEFINED)

All others cases, except network rom :

```ca65
    .include "telestrat.inc"

    KERNEL_XVALUES_GET_FREE_BANK = $10
    KERNEL_BANK_UNDEFINED = $FF

    ldx     #KERNEL_XVALUES_GET_FREE_BANK
    ldy     #$00 ; RAM type
    lda     #KERNEL_BANK_UNDEFINED
    BRK_TELEMON  $2D ; XVALUES
    ; returns :
    ; Y contains the id of the bank
    ; X contains set ($343 register)
    ; A the bank ($321 register)
    ; If there is no available bank, Y=0
    rts
```

For Network bank registering :

```ca65
    .include "telestrat.inc"

    KERNEL_XVALUES_GET_FREE_BANK = $10

    ldx     #KERNEL_XVALUES_GET_FREE_BANK
    ldy     #$00 ; RAM type
    lda     #KERNEL_BANK_NETWORK
    BRK_TELEMON  $2D ; XVALUES
    ; returns :
    ; Y contains the id of the bank
    ; X contains set ($343 register)
    ; A the bank ($321 register)
    ; If there is no available bank, Y=0
    rts
```

!!! warning "It available since Kernel v2023.2"

!!! warning "It can only allocate the first 8 banks"

!!! warning "It does not verify the content of any bank"

!!! warning "The content is reset every reboot"
