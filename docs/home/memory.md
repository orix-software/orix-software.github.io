# Memory management

## Hardware informations

Twilighte board handles 512KB of RAM and 512KB of eeprom

## Orix Roms

Kernel has [XMALLOC](../../kernel/primitives/xmalloc) and [XFREE](../../kernel/primitives/xfree) primitives to allocate memory dynamictly. [XMALLOC](../../kernel/primitives/xmalloc)  primitives only returns pointer from main memory.

Kernel can't instanciate extra memory from bank for instance.

## Standalone ROM

Extra memory can be accessed without kernel primitive with simple code

The banking management is the same as Telestrat in order to have Orix working on Telestrat too, because it keeps telestrat compatibility (7 banks available + 1 bank for Overlay RAM), that is why twilighte board adds others registers to keep telestrat compatibility

There is a register which contains a set of 4 banks. This register accept values from 0 to 7 : $343. Each value set another set of 4 banks. For example, if $343 contains 2, it will displays others parts of eeprom or SRAM when bit b0, b1, b2 in $321 register contains 4,3,2,1

## Banking management explanation.

Switching to another bank should not be done, but the behavior of the card is explained below.

For example, a ROM can be loaded into eeprom or ram with orixcfg. Some others ROMS (as systemd, or others standalone rom) are loaded on the fly with loader menu.

If it needs more ram than the main memory, extended driver is not coded, but it could on the future.

Kernel is always reached when $321&7 is equal to 7 . $343 register does not change the behavior of the value set in $321, when $321&7=7 $321&6=6 and $321&5=5. When it's below 5, banks are swapped when register value of $343 change

To summarize : 

* bank 7 : kernel
* bank 6 : basic11 (modified to work with sdcard or usb key)
* bank 5 : shell

Theses banks can't be switch and are always shown but for others banks (4,3,2,1), you have (depending the value of $343)

* bank 4: what you want
* bank 3: what you want
* bank 2: what you want
* bank 1: what you want

Theses banks can be switches to others set banking RAM or ROM with a flag.

You should not use this code, because it's not necessary to use theses routines when you do an orix bank (Kernel provides routines, or facility to call binaries in banks)

In the case you need to switch to another bank, you can do this : 
If you want to switch to bank 4 (hardware) you have to do in main ram, but there is also vectors) :

```ca65
sei
lda $321
and #%11111000 ; Do mask for b0,b1, b2 of banking register
ora #$04 ; Switch to bank 4
sta $321
cli
```

; $C000 to $FFFF will be on bank 4 on eeprom bank because we did not set any others registers)

if you want to switch to RAM mode :

``` ca65
sei
lda $342
ora #%00100000 ; switch to ram set
sta $342
lda $321
and #%11111000 ; Do mask for b0,b1, b2 of banking register
ora #$04 ; Switch to bank 4
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

