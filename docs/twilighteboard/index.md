# Twilighte board

* [FDC, RTC WIFI controller ](fdcWifiEsp)


# firmware version 1

## $342 : twilighte board register

* b0,b1,b2 version number is equal to 1, but can be overwritten (There is not read only protection
* b5 : if it's equal to 0 if we are on eeprom set, 1 if it's ram set

## $343 : Banking register

Working board version with this firmware: 

* v0.6
* v0.65

# firmware version 2

Reserved for twilighte board v0.6 & v0.65 upgrades

# firmware version 3

## $342 

* b0,b1,b2 version number is equal to 1, but can be overwritten
* b5 : if it's equal to 0 if we are on eeprom set, 1 if it's ram set
* b6 : allow ftdos I/O 
* b7 : allow microdisc I/O : $314 $310, $311 ...

## $343 

Banking register

## Notes

Port A of via 65C22, b0,b1,b2 are managed by cpld

Working board version


# Twilighte board version 0.6

* dirty hack for ca3083 replacement

# Twilighte board version 0.65

* ca3083 removed and are replaced with BC547

# Twilighte board version 0.7
* Level shifters for esp32
* esp32 can be on the card (WROOM 32) but maybe it's not useful


