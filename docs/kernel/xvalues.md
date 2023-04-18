# XVARS

Get vars from kernel




## Get Os string (Orix)

XVARS_KERNEL_OSNAME = 9

ldx     #XVARS_KERNEL_OSNAME
BRK_KERNEL XVARS
; A and X contains
