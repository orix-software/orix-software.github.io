# exec

## Description

Execute a binary

## usage

exec command

command may be : (ptr), address

```ca65
    .include "telestrat.inc"

    exec mycommand
    rts
mycommand:
    .asciiz ls
```

Call [XEXEC](../../../kernel/primitives/XEXEC/) kernel function.
