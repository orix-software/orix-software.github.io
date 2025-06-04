# Dynamic lib

Orix manages dynamic lib. For instance, it allocate lib into ram bank memory.

bpm does all things to generate all files, but below, it explain how it works.

## Introduction

There is few step to have a binary working with dynamic lib :

* It requires relocbin v0.3 (from [orix-sdk](https://github.com/assinie/orix-sdk)) or [bpm](https://orix-software.github.io/bpm/). This tool will relocate binary and will build dynamic link table into binary.
* The final lib (.so) with code which will be loaded by Orix kernel
* One module (.llo) in order to link binary with library (.so) loaded by Orix Kernel

## Dynamic lib (.so)

it contains the library code. The xxx_startup_dynlib routine in .llo file will map with theses routines

## Module (.lib)

This file is usually located in /usr/lib/$name/$version/llo (in that case [bpm](https://orix-software.github.io/bpm/) will find it easily) and has the $name.lib.

In this special lib, it will contain "c" routine and assembly routine which will wrap to .so routine at runtime.

It contains all routines to work.

It requires at least this header :

```ca65
curl_mapping_dynlib:

 ; This header must not be greater than 255
 ; A pattern with dynlib and the name of the lib seprated with '_'. This pattern is used by reloc_bin in order to replace into lib binary the offset of the first routine
    .asciiz "dynlib_curl"
    ; dynlib_curl must contain 0 at the end of string, because relocbin will put the next offset after 0 to kernel dynlib mapping
    .addr curl_startup_dynlib ; startup_dynlib, will replace all offset
    ; Version ASCII string.
    .asciiz "2025.1"
    ; Version with one byte
    .byt 0 ; Module version
    ; 0 in order to indicate that the lib can be loaded into RAM. Only 0 (ram) is managed
    .byt 0 ; ROM RAM ?
    .asciiz "curl.so" ; name of the file which will be loaded from /usr/lib/
    ; The first routine to execute.
    ; Kernel will run this routine. This routine does the job to replace offsets for routines
    ; Kernel will send in A the bank used to load curl.so and in X the set


.proc curl_easy_init
    pha
    jsr     curl_save_bank_set
    jsr     curl_switch_bank_set_curl
    pla

__curl_easy_init_offset:
    jsr     $0000

    pha
    jsr     curl_restore_bank_set_curl
    pla

    rts
.endproc

.proc curl_startup_dynlib
    ; Get the bank
    ; Get the set
    ; Get offset
    ; set offset
    ; A & X contains
    sta     curl_easy_init::__curl_easy_init_offset + 1
    stx     curl_easy_init::__curl_easy_init_offset + 2
    rts
.endproc

```
