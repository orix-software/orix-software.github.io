# orixcfg

### Load ROM into RAM bank or ROM bank

## SYNOPSYS
+ orixcfg
Load a .rom into RAM (in the example, set 0, bank 4)
+ orixcfg -w -s 0 -b 4 myrom.rom
Clear a ram bank (in the example, set 0, bank 4)
+ orixcfg -w -s 0 -b 4 -c
Load an eeprom set (in the example, set 0), only 64KB set
+ orixcfg -r -s 0 myset.r64
Update kernel 
+ orixcfg -r -s 4 kernelus.r64

## DESCRIPTION
Manage twilighte board configuration
