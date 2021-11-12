# Memory management

## Orix Roms


Kernel has XMALLOC and XFREE primitives to allocate memory dynamictly. But theses primitives only returns pointer from main memory.

## Standalone ROM

Extra memory can be accessed without kernel primitive with simple code

The banking management is a bit special, because it keeps telestrat compatibility (7 banks available + 1 bank for Overlay RAM), that is why twilighte board adds others registers to keep telestrat compatibility

It selects bank set ($343).

When you start Orix

you have only 7 banks available :

bank 7 : kernel
bank 6 : basic11 (modified to work with sdcard or usb key)
bank 5 : shell

Theses banks can't be switch and are always shown.

For others banks (4,3,2,1), you have
bank 4: what you want
bank 3: what you want
bank 2: what you want
bank 1: what you want

But theses banks can be switches to others set banking RAM or ROM

You should not use this code, because it's not necessary to use theses routines (Kernel provides routines, or facility to call binaries in banks)

If you want to switch to bank 4 (hardware) you have to do in main ram, but there is also vectors) :

```ca65
sei
lda #$04
sta $321
cli
```

; $C000 to $FFFF will be on bank 4 on eeprom bank because we did not set any others registers)

if you want to switch to RAM bank :

``` ca65
sei
lda $342
ora #%00100000 ; switch to ram set
sta $342
lda #$04 ; switch to bank set of ram bank
sta $321
cli
```

if you want to switch to antoher set RAM bank :

``` ca65
sei
lda #$01 ; set 1 instead of current set at boot (0)
sta $343
lda $342
ora #%00100000 ; switch to ram set
sta $342
lda #$04 ; switch to bank set of ram bank
sta $321
cli
```
