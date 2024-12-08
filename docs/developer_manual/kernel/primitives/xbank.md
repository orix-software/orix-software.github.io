# XBANK

## Description

Manage bank :

* Get a persistant bank

* Free a bank

It can only allocate ram bank

## Input/Output

### Allocate persistant bank

Input :

* A : Mode (KERNEL_ALLOCATE_BANK = 1)
* X : type of persistant bank (KERNEL_RAM_BANK_APPLICATION_TYPE=1)

Output :

* A the id of the bank from 34 to 63 (Else A = 0 if no more bank are available)
* X set
* Y id of the bank (from 1 to 4 depending of the set)

### Free bank

Input :

* A : Mode (KERNEL_FREE_BANK = 2)
* X : id of the bank

Output :

* N/A

## Example 1 : Get a persistant bank

```ca65
    .include "telestrat.inc"
    .define XBANK $01
    .define KERNEL_RAM_BANK_APPLICATION_TYPE $01
    .define KERNEL_ALLOCATE_BANK $01
    .define KERNEL_FREE_BANK     $02

    print str_bank_id_given
    lda     #KERNEL_ALLOCATE_BANK    ; Mode : allocate bank
    ldx     #KERNEL_RAM_BANK_APPLICATION_TYPE ; X the type of bank (persistant bank)
    BRK_TELEMON XBANK ; GET free bank
    sta     tmp1 ; bank id (from 34 to 64), if it's equal to 0, it means all banks are allocated
    stx     tmp2 ; set
    sty     tmp3 ; Bank id (for $321 register)
    rts
str_bank_id_given:
    .asciiz "Allocate bank id : "

str_set:
    .asciiz " Set :"

str_bank:
    .asciiz " bank :"
```

## Example 2 : "remove" allocated bank

```ca65
    .include "telestrat.inc"
    .define XBANK $01
    .define KERNEL_RAM_BANK_APPLICATION_TYPE $01
    .define KERNEL_ALLOCATE_BANK $01
    .define KERNEL_FREE_BANK     $02

    print str_bank_id_given
    lda     #KERNEL_FREE_BANK    ; Mode : allocate bank
    ldx     #34 ; X the type of bank (persistant bank)
    BRK_TELEMON XBANK ; GET free bank

    rts
str_free_id:
    .asciiz "Free bank id : "
```

!!! warning "available in 2025.1 version"
