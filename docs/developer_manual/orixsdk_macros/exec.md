# Exec macro

## Description

Execute a binary

## Usage

exec command

command may be : (ptr), address

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_process.mac"

    exec mycommand
    rts
mycommand:
    .asciiz ls
```

Call [XEXEC](../../../kernel/primitives/XEXEC/) kernel function.
