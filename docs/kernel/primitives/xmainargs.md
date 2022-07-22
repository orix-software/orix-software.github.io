# XMAINARGS (argmains)

ID primitive : $2C

## Description

Return argc and argv

## Input

A => mode
For instance only mode 0 is avaiblable

## Output

A & Y contains ptr to XMAINARGS Struct
X: number of args

## Usage

``` ca65
XMAINARGS = $2C

lda		#$00 ; Mode 0
brk_kernel XMAINARGS

stx save_argc
sta save_argv
sty save_argv+1
```

!!! warning "XMAINARGS allocates a chunk in memory, it must be free at the end of the use of the parameters"
