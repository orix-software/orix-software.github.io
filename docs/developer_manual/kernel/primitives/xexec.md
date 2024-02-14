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

; Fork
```ca65
    .include "telestrat.inc"

    lda #<str
    ldy #>str
    ldx #$00 ; Fork
    BRK_TELEMON XEXEC
    rts
str:
    .asciiz "mybin"
```

; exec (replace in memory program)
```ca65
    .include "telestrat.inc"

    lda #<str
    ldy #>str
    ldx #$01 ; Exec (replace)
    BRK_TELEMON XEXEC
    rts
str:
    .asciiz "mybin"
```

!!! tip "See [exec](../../../developer_manual/orixsdk_macros/exec) macro from orix-sdk to use it (exec mode as linux style)"

!!! tip "See [system](../../../developer_manual/orixsdk_macros/system) macro from orix-sdk to use it (exec mode as linux style)"

!!! info "If the command is executed Y contains 'EOK' code"

!!! fail "XEXEC does not manage './' or '../' before kernel v2023.2"

!!! fail "Bug : when XEXEC is finished (binary is terminated), XEXEC will close all FD of all process !"

!!! warning "./ calls and /mypath/mybinary calls are available since kernel v2023.2, but '../' is not available"

!!! warning "Since Kernel 2023.3 : if command is too long for the KERNEL, Y contains 'EINVAL' error"
