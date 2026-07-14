# Tutorials

## Hello world

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

    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_print.mac"

    start:
        print str_hello

        rts
    str_hello:
        .byte "Hello world!",$0A,$0D,0
    ```

## Getting current file size (current opened files)

This example works in the new kernel under development

=== "C"

    ``` c
    #include <stdio.h>
    #include <stdlib.h>

    long get_file_size(FILE *file) {
        // Save the current position
        long current_position = ftell(file);

        // Move to the end of the file
        if (fseek(file, 0, SEEK_END) != 0) {
            perror("Error moving to the end of the file");
            return -1;
        }

        // Get the position (file size)
        long size = ftell(file);

        // Return to the original position
        if (fseek(file, current_position, SEEK_SET) != 0) {
            perror("Error returning to the original position");
            return -1;
        }

        return size;
    }

    int main(int argc, char *argv[]) {
        if (argc != 2) {
            fprintf(stderr, "Usage: %s <file>\n", argv[0]);
            return EXIT_FAILURE;
        }

        FILE *file = fopen(argv[1], "rb");
        if (file == NULL) {
            perror("Error opening the file");
            return EXIT_FAILURE;
        }

        long size = get_file_size(file);
        if (size >= 0) {
            printf("File size: %ld bytes\n", size);
        }

        fclose(file);
        return EXIT_SUCCESS;
    }
    ```

=== "Asm"

    ```ca65
    .include "telestrat.inc"
    .include "fcntl.inc"
    ; Go to the end of the file to get size
    lda   #$00
    tay
    sta   RESB
    sta   RESB + 1

    lda   fp
    ldx   #SEEK_END
    BRK_TELEMON XFSEEK

    ; A & X contains position (from 0 to 15 bits)
    ; RES (2 bytes) contains position (from 16 to 31 bits)
    ; Returns long
    ```