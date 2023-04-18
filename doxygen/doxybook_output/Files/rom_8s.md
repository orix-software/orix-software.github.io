---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/rom.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/rom.s



## Attributes

|                | Name           |
| -------------- | -------------- |
| int | **[addr_commands](Files/rom_8s.md#variable-addr-commands)**  |
| char[$FFF0- *] | **[end_rom](Files/rom_8s.md#variable-end-rom)**  |
| char[2] | **[parse_vector](Files/rom_8s.md#variable-parse-vector)**  |
| unsigned int | **[signature_adress_commands](Files/rom_8s.md#variable-signature-adress-commands)**  |
| unsigned int | **[list_commands](Files/rom_8s.md#variable-list-commands)**  |
| char | **[number_of_commands](Files/rom_8s.md#variable-number-of-commands)**  |
| int | **[copyright](Files/rom_8s.md#variable-copyright)**  |
| int | **[NMI](Files/rom_8s.md#variable-nmi)**  |
| int | **[RESET](Files/rom_8s.md#variable-reset)**  |
| int | **[BRK_IRQ](Files/rom_8s.md#variable-brk-irq)**  |

## Defines

|                | Name           |
| -------------- | -------------- |
|  | **[userzp](Files/rom_8s.md#define-userzp)**  |
|  | **[NULL](Files/rom_8s.md#define-null)**  |



## Attributes Documentation

### variable addr_commands

```cpp
int addr_commands;
```


### variable end_rom

```cpp
char[$FFF0- *] end_rom;
```


### variable parse_vector

```cpp
char[2] parse_vector;
```


### variable signature_adress_commands

```cpp
unsigned int signature_adress_commands;
```


### variable list_commands

```cpp
unsigned int list_commands;
```


### variable number_of_commands

```cpp
char number_of_commands;
```


### variable copyright

```cpp
int copyright;
```


### variable NMI

```cpp
int NMI;
```


### variable RESET

```cpp
int RESET;
```


### variable BRK_IRQ

```cpp
int BRK_IRQ;
```



## Macros Documentation

### define userzp

```cpp
#define userzp $80
```


### define NULL

```cpp
#define NULL 0
```


## Source code

```cpp
;----------------------------------------------------------------------
;                       cc65 includes
;----------------------------------------------------------------------
.include   "telestrat.inc"          ; from cc65
.include   "fcntl.inc"              ; from cc65
.include   "errno.inc"              ; from cc65
.include   "cpu.mac"                ; from cc65


;----------------------------------------------------------------------
;                       Orix SDK includes
;----------------------------------------------------------------------
.include   "../dependencies/orix-sdk/macros/SDK.mac"
.include   "../dependencies/orix-sdk/include/SDK.inc"
.include   "../dependencies/orix-sdk/include/keyboard.inc"




;----------------------------------------------------------------------
;                           Zero Page
;----------------------------------------------------------------------
userzp                       := $80
NULL = 0

;----------------------------------------------------------------------
;                               Shell
;----------------------------------------------------------------------
.org        $C000

.code
start:
rts




.include "commands/vi.s"



list_of_commands_bank:
    .asciiz "vi"

addr_commands:
    .word _vi

signature:
    .asciiz "vi 2022.4"


end_rom:


;----------------------------------------------------------------------
;
;----------------------------------------------------------------------
.out   .sprintf("Size of ROM : %d bytes", end_rom-$c000)


    .res $FFF0-*
    .org $FFF0
.byt 1 ; Command ROM
; $fff1
parse_vector:
    .byt $00,$00
; fff3
signature_adress_commands:
    .addr addr_commands
; fff5-fff6
list_commands:
    .addr list_of_commands_bank
; fff7
number_of_commands:
    .byt 1

; fff8-fff9
copyright:
    .word   signature
; fffa-fffb
NMI:
    .word   start

; fffc-fffd
RESET:
    .word   start
; fffe-ffff
BRK_IRQ:
    .word   IRQVECTOR
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100
