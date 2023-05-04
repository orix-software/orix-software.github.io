# fseek

## Description

Move into opened file

## Usage

fseek fp, offset, whence

fp may be : (ptr), address
offset may be: (ptr), address, constant
whence may be  : address, #value


## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_file.mac"

    [...]
    fseek (myfp), 1080, #SEEK_CUR
    fclose(MAN_FP)
    rts
```
