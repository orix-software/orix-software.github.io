# Sedoric

Starts .dsk sedoric disk file

<iframe width="500" height="308" src="https://www.youtube.com/embed/ZElaqi_xa6U" title="Twilighte board : Start sedoric" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Search a dsk file with the first letter

```code
/#sedoric -l p
```

It will list all .dsk files with the letter 'p' on the first letter.

If a personnal disk must be inserted : It can be put in any folder (as /home/sedoric) for example.

then without .dsk file, sedoric will try to find .dsk in the right folder :

```code
/#sedoric pulsoids
```

## Start a disk from args

```code
/#sedoric my.dsk
```

or

```code
/#cd /usr/share/sedoric/p/
/#sedoric pulsoids.dsk
```

## Requirements

install/dsk file on twilighte board device:

Download [http://repo.orix.oric.org/dists/official/tgz/6502/software.tgz](http://repo.orix.oric.org/dists/official/tgz/6502/software.tgz) gunzip, untar and put all extracted files into the twilighte device.

Download [http://repo.orix.oric.org/dists/official/tgz/6502/dsk-bank.tgz](http://repo.orix.oric.org/dists/official/tgz/6502/dsk-bank.tgz), gunzip, untar and put all extracted files into the twilighte device.

## Issues

* Write on .dsk does not work
* some .dsk does not work
* Does not handle sedoric 4 disks (NY2019 COMPETITION)
* Pulsoids : When a game is finished, computer reboots
* Magnetix : When a game is finished, the game stops

## Incompatibility

All dsk built with floppybuilder:

* quintessential =>  use "quintes" binary
* pushing the envelop =>  use "pushing" binary
* Born in 1983 =>  use "born1983" binary
* Barbitoric =>  use "barboric" binary
* asm2k2 =>  use "asm2k2" binary
* zerofx =>  use "zerofx" binary
* OricTech =>  use "orictech" binary
* all .dsk on pinforic models : space99, 1337 and pinforic games (no solution for instance)

## Trouble shooting

If sedoric is launched without any args, it will try to load by default '/usr/share/sedoric/sedoric3.dsk'. If this disk is not present, sedsd will failed.
