# Tutorial

## Print a string

=== "C"

    ``` c
    #include <stdio.h>

    int main(void) {
      printf("Hello world!\n");
      return 0;
    }
    ```

=== "Asm"

    ```ca65

    .include "telestrat

    print str_hello

    rts
str_hello:
    .byte "Hello world!",$0A,$0D,0
    ```
