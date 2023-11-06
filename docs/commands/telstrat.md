# Telstrat

Starts Telestrat

## Example

telstrat without binary starts hyperbasic mode with stratsed (Like -m 0 flag)

```code
/#telstrat [-v] [-d mydisk] [-m mode] [-l first_letter]
```

<iframe width="500" height="308" src="https://www.youtube.com/embed/9n0x8EYgBJM" title="Twilighte board : Start Telestrat, hyperbasic, stratsed, teleass, telematic" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Install

[Download telstrat](https://repo.orix.oric.org/dists/official/tgz/6502/telstrat.tgz)

[Download stratsed disks](https://repo.orix.oric.org/dists/official/tgz/6502/telstrat.tgz)

## Modes

Starts telestrat with hyperbasic + Stratsed

```code
/#telstrat -m 0
```

Starts telestrat with hyperbasic, teleass + Stratsed

```code
/#telstrat -m 1
```

Starts telestrat with hyperbasic, telematic + Stratsed

```code
/#telstrat -m 1
```

## Disk search

Displays all disks availables with the filename starting by 'a'

```code
/#telstrat -l a
```

## Starts with a disk

When telstrat starts, default disk (stratsed is inserted), it's possible to insert another disk with -d option.

in that case, send

```code
/#telstrat -d builder
```

It will try to load /usr/share/stratsed/b/builder.dsk

If a .dsk is added to the disk argument like :

```code
/#telstrat -d /builder.dsk
```

It will starts .dsk from / with the name builder.dsk

When .dsk is in the argument of -d flag, it will get the disk as a right path and filename.

## Add personnal disk

Add .dsk into /usr/share/stratsed/[FIRST_LETTER_OF_MYDISK]/

## Issues

* Tele disk 3 : Error, because it need Real Time Clock Extension
* Tele disk 2 : Keyboard mess (maybe a wrong .dsk ?)
* Tea 4 two : Does not work (waiting for rs232 ?)
* Software mapping keyboard<-> mouse is for instance disabled
* Wrong compute of ROM and RAM banks
* if an unknown command is launched, it crashes
* Serial port is not functionnal (minitel pages can't be started)

## Kernel

Need Oric kernel 2022.3 at least
