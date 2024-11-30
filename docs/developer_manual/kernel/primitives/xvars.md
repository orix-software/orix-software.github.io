# XVARS

## Get the number max of process

```ca65
  ldx #KERNEL_XVARS_KERNEL_MAX_PROCESS ; Value = 8
  BRK_KERNEL XVARS
  ; A contain the number max of the process available
  ; Y contains the max FP handled by kernel
```

## Get the number max opened file

```ca65
  ldx #KERNEL_XVARS_KERNEL_MAX_PROCESS ; Value = 8
  BRK_KERNEL XVARS
  ; A contain the number max of the process available
  ; Y contains the max FP handled by kernel
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

## Get the binary version of the kernel

```ca65
  .include "telestrat.inc"
  KERNEL_XVARS_CURRENT_VERSION_BINARY = $06
  ldx #KERNEL_XVARS_CURRENT_VERSION_BINARY
  BRK_KERNEL XVARS
  ; A contains the id of the kernel
  ; Below the information
  rts

.define KERNEL_VERSION_2022_3   $00
.define KERNEL_VERSION_2022_4   $01
.define KERNEL_VERSION_2022_4_1 $02
.define KERNEL_VERSION_2023_1   $03
.define KERNEL_VERSION_2023_2   $04
.define KERNEL_VERSION_2023_3   $05
.define KERNEL_VERSION_2024_1   $06
.define KERNEL_VERSION_2024_4   $07

```
