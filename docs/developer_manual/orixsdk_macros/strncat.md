
#strncat

concat 2 strings. Strings must be terminated by 0

strncat src, dest, n

```ca65
    .include "telestrat.inc"

    lda     #<file_path
    sta     ptr2
    lda     #>file_path
    sta     ptr2+1

    strncpy ptr2, ptr1, #20 ;strncpy(src, dest, n)

    lda     files_type_loader_low
    sta     ptr2
    lda     files_type_loader_high
    sta     ptr2+1


    strncat RESB, ptr1 , #13
    rts
```

!!! warning "dest ptr will be changed by strncat. dest pointer must be saved"
