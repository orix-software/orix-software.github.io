# XEXEC

## Description

Start a binary (located in a ROM or on the current device)

## Input

A & Y the ptr of the string.

## Output

Returns an error if the binary is not found

## Modify
* RES, RESB (kernel_create_process), TR0, TR1, TR4 (kernel_create_process), TR5 (kernel_create_process)
* KERNEL_ERRNO (kernel_create_process), KERNEL_XKERNEL_CREATE_PROCESS_TMP (kernel_create_process),kernel_process_struct::kernel_pid_list  (kernel_create_process)
* DECDEB, DECFIN, DECCIB,DECTRV,ACC1M
* VEXBNK, BUFEDT, BNKOLD, KERNEL_TMP_XEXEC, BNK_TO_SWITCH, KERNEL_KERNEL_XEXEC_BNKOLD

## Example

``` ca65
    lda #<str
    ldy #>str
    ldx #$00 ; Fork
    BRK_KERNEL XEXEC
    rts
str:
    .asciiz "mybin"
```

!!! fail "XEXEC does not manage './' or '../' calls"

Page last revised on: {{ git_revision_date }}
