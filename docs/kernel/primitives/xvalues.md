# XVARS

Get vars from kernel

## Get Free malloc table

X = KERNEL_XVALUES_FREE_MALLOC_TABLE

## Get Busy malloc table

X = KERNEL_XVALUES_BUSY_MALLOC_TABLE

## Get processName of the current chunk

Y contains the id of the malloc busy table

Y = the chunk
X = 08

It returns in A & Y the ptr of the process name

## Get the position in the opened filed

KERNEL_XVALUES_GET_FTELL_FROM_FD = $0A

X=KERNEL_XVALUES_GET_FTELL_FROM_FD

It returns in A, X, Y and RES, the position in the file

## TGet the ptre of the pid list

KERNEL_XVALUES_GET_PROCESS_ID_LIST

; A and Y contains the ptre

## Get the processname with the PID

A = contains the POD

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

XVARS_KERNEL_OSNAME = 9

ldx     #XVARS_KERNEL_OSNAME
BRK_KERNEL XVARS
; A and X contains

!!! warning "It will be available in Kenrel v2023.2"
