---
title: /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/tables.s

---

# /mnt/c/Users/plifp/OneDrive/oric/projets/orix-software/vi/src/functions/tables.s



## Attributes

|                | Name           |
| -------------- | -------------- |
| char | **[TABLE_LOW_TEXT](Files/tables_8s.md#variable-table-low-text)**  |
| char | **[TABLE_HIGH_TEXT](Files/tables_8s.md#variable-table-high-text)**  |



## Attributes Documentation

### variable TABLE_LOW_TEXT

```cpp
char TABLE_LOW_TEXT;
```


### variable TABLE_HIGH_TEXT

```cpp
char TABLE_HIGH_TEXT;
```



## Source code

```cpp
TABLE_LOW_TEXT:
;0
    .byt <($bb80)
    .byt <($bb80+40)
    .byt <($bb80+80)
    .byt <($bb80+120)
    .byt <($bb80+160)
    .byt <($bb80+200)
    .byt <($bb80+240)
    .byt <($bb80+280)
    .byt <($bb80+320)
    .byt <($bb80+360)
    .byt <($bb80+400)
    .byt <($bb80+440)
    .byt <($bb80+480)
    .byt <($bb80+520)
    .byt <($bb80+560)
    .byt <($bb80+600)
    .byt <($bb80+640)
    .byt <($bb80+680)
    .byt <($bb80+720)
    .byt <($bb80+760)
    .byt <($bb80+800)
    .byt <($bb80+840)
    .byt <($bb80+880)
    .byt <($bb80+920)
    .byt <($bb80+960)
    .byt <($bb80+1000)
    .byt <($bb80+1040)
    .byt <($bb80+1080)


TABLE_HIGH_TEXT:
    .byt >($bb80)
    .byt >($bb80+40)
    .byt >($bb80+80)
    .byt >($bb80+120)
    .byt >($bb80+160)
    ;5
    .byt >($bb80+200)
    .byt >($bb80+240)
    .byt >($bb80+280)
    .byt >($bb80+320)
    .byt >($bb80+360)
    ;10
    .byt >($bb80+400)
    .byt >($bb80+440)
    .byt >($bb80+480)
    .byt >($bb80+520)
    .byt >($bb80+560)
    ;15
    .byt >($bb80+600)
    .byt >($bb80+640)
    .byt >($bb80+680)
    .byt >($bb80+720)
    .byt >($bb80+760)
    ;20
    .byt >($bb80+800)
    .byt >($bb80+840)
    .byt >($bb80+880)
    .byt >($bb80+920)
    .byt >($bb80+960)
    ;25
    .byt >($bb80+1000)
    ; 26
    .byt >($bb80+1040)
    ; 27
    .byt >($bb80+1080)
```


-------------------------------

Updated on 2022-12-15 at 11:48:27 +0100