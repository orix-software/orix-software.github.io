# XMAINARGS (argmains)

ID primitive : $2C

## Description

Return argc and argv

## Input

Nothing

##Output

A & Y contains ptr to XMAINARGS Struct
X: number of args

## Usage

``` ca65
XMAINARGS = $2C

brk_kernel XMAINARGS

stx save_argc
sta save_argvlow
sty save_argvhigh
``` 

