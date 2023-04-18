---
title: /rom.s

---

# /rom.s



## Attributes

|                | Name           |
| -------------- | -------------- |
| const char | **[userzp](Files/rom_8s.md#variable-userzp)**  |
| const char | **[NULL](Files/rom_8s.md#variable-null)**  |
| const char[3] | **[list_of_commands_bank](Files/rom_8s.md#variable-list-of-commands-bank)**  |
| int | **[addr_commands](Files/rom_8s.md#variable-addr-commands)**  |
| const char[10] | **[signature](Files/rom_8s.md#variable-signature)**  |
| char[$FFF0- *] | **[end_rom](Files/rom_8s.md#variable-end-rom)**  |
| char[2] | **[parse_vector](Files/rom_8s.md#variable-parse-vector)**  |
| unsigned int | **[signature_adress_commands](Files/rom_8s.md#variable-signature-adress-commands)**  |
| unsigned int | **[list_commands](Files/rom_8s.md#variable-list-commands)**  |
| char | **[number_of_commands](Files/rom_8s.md#variable-number-of-commands)**  |
| int | **[copyright](Files/rom_8s.md#variable-copyright)**  |
| int | **[NMI](Files/rom_8s.md#variable-nmi)**  |
| int | **[RESET](Files/rom_8s.md#variable-reset)**  |
| int | **[BRK_IRQ](Files/rom_8s.md#variable-brk-irq)**  |



## Attributes Documentation

### variable userzp

```ca65
const char userzp = $80;
```


### variable NULL

```ca65
const char NULL = 0;
```


### variable list_of_commands_bank

```ca65
const char[3] list_of_commands_bank = "vi";
```


### variable addr_commands

```ca65
int addr_commands;
```


### variable signature

```ca65
const char[10] signature = "vi 2022.4";
```


### variable end_rom

```ca65
char[$FFF0- *] end_rom;
```


### variable parse_vector

```ca65
char[2] parse_vector;
```


### variable signature_adress_commands

```ca65
unsigned int signature_adress_commands;
```


### variable list_commands

```ca65
unsigned int list_commands;
```


### variable number_of_commands

```ca65
char number_of_commands;
```


### variable copyright

```ca65
int copyright;
```


### variable NMI

```ca65
int NMI;
```


### variable RESET

```ca65
int RESET;
```


### variable BRK_IRQ

```ca65
int BRK_IRQ;
```



## Source code

```ca65
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

Updated on 2022-12-15 at 14:20:17 +0100
