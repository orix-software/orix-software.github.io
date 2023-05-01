# XOPEN

## Description

open a file

## Input

* Y : flag open mode
* A&X : path filename

## Output

* AX contains $FF if it does not exists
* A : FD id if file is found

## Modify

* RES, A X Y, XOPEN_SAVE XOPEN_FLAGS, XOPEN_RES_SAVE, XOPEN_SAVEA
* with XMALLOC call TR7

## Internal kernel calls

* XMALLOC
* create_file_pointer

## Changelog

### Since kernel 2022.2

Flag     | File exists | behaviour
O_WRONLY |    No       | return Null
O_WRONLY |    Yes      | open and return FD
O_RDONLY |    Yes      | open and return FD
O_WRONLY |    No       | return Null
O_CREAT  |    No       | Create file and open and return FD
O_CREAT  |    Yes      | open and return FD

## Usage

``` ca65
    lda #<str
    ldx #>str
    ldy #O_CREAT

    BRK_TELEMON XOPEN
    rts
str:
    .asciiz "myfile"
```





!!! tip "See [fopen](../../../home/orixsdk) macro from orix-sdk to use it "

!!! fail "XOPEN does not manage './' or '../' calls"

!!! warning "Multiples opened files are working since kernel 2022.2"

!!! warning "Max 2 opened files are working since kernel 2022.2, it's a constant defined in kernel build"

??? info "Flags behaviors since kernel 2023.1"
    | Flag     | File exists                         |Behaviour|
    | ----------- | ------------------------------------ ||
    | O_WRONLY & O_CREAT |    No       | Create file, open and return FD
    | O_WRONLY           |    No       | return Null (Changed since kernel 2023.1)
    | O_WRONLY           |    Yes      | open and return FD
    | O_RDONLY           |    Yes      | open and return FD
    | O_WRONLY           |    No       | return Null
    | O_CREAT            |    No       | Create file and open and return FD
    | O_CREAT            |    Yes      | open and return FD

??? info "Flags behaviors before kernel 2023.1"

    | Flag     | File exists                         |Behaviour|
    | ----------- | ------------------------------------ ||
    |O_WRONLY & O_CREAT |    No       | Create file, open and return FD
    |O_WRONLY           |    No       | open and return FD
    |O_WRONLY           |    Yes      | open and return FD
    |O_RDONLY           |    Yes      | open and return FD
    |O_WRONLY           |    No       | return Null
    |O_CREAT            |    No       | Create file and open and return FD
    |O_CREAT            |    Yes      | open and return FD
