# I/O

The I/O ports can be see also when you type

``` bash

/#ioports

```

## $321 register for the id of the bank to switch

b0, b1, b2 which can select the id of the bank wanted.

## $314 register

This register is in firmware 2, and can mirror $314 calls to change to overlay memory

## $342 : twilighte board register

* b0,b1,b2 version number is equal to 1 or 2, but can be overwritten (There is not read only protection

* b5 : if it's equal to 0 if we are on eeprom set, 1 if it's ram set

## $343 : Twilighte banking register

This register can contains values from 0 to 7 included. It defines the "set" of 64KB which be present in slot 4,3,2 and 1 of register $321 which contains the bank.

