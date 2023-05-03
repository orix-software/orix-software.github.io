# XRM

## Description

Remove file in arg

* Input : AX the ptr
* Returns ENOENT in A if the file does not exist
* Returns $00 in A if the rm is done

```ca65
    .include "telestrat.inc"
    lda     #<myfile_to_remove
    ldx     #>myfile_to_remove
    BRK_KERNEL XRM
    rts
myfile_to_remove:
    .asciiz "toto"
```

!!! tip "See [unlink](../../developer_manual/orixsdk_macros/unlink) macro from orix-sdk to use it"
