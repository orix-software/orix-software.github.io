# XVARS

## Get the number max of process

```ca65
  ldx #KERNEL_XVARS_KERNEL_MAX_PROCESS ; Value = 8
  BRK_KERNEL XVARS
  ; A and Y contains the number max of the process available

```

## Get the list of the process

```ca65
  .include "telestrat.inc"
  ldx #KERNEL_XVARS_PID_LIST_PTR ; Value = $0A
  BRK_KERNEL XVARS
  ; A and Y contains the ptr of the list of current pid.
  ; If 0 is set, the slot is available and there is no process
  ; The end of the list is defined with #KERNEL_XVARS_KERNEL_MAX_PROCESS
  rts
```
