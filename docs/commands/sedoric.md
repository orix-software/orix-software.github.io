# Sedoric

Starts .dsk sedoric disk file

## Start a disk from args

```code
/#sedoric my.dsk
```

oe

```code
/#cd /usr/share/sedoric/p/
/#sedoric pulsoids.dsk
```

## install/dsk file on twilighte board device

Download http://repo.orix.oric.org/dists/official/tgz/6502/software.tgz, gunzip,untar and put all extracted files into the twilighte device

## Issues

* Write on .dsk does not work
* some .dsk does not work
* Music is altered.
* Does not handle sedoric 4 disks

## Incompatibility

* all dsk built with floppybuilder:

quintessential =>  use "quintes" binary
pushing the envelop =>  use "pushing" binary
Born in 1983 =>  use "born1983" binary
Barbitoric =>  use "barboric" binary
asm2k2 =>  use "asm2k2" binary
zerofx =>  use "zerofx" binary
OricTech =>  use "orictech" binary

* all .dsk on pinforic models : space99, 1337 and pinforic games (no solution for instance)

## Trouble shooting

If sedsd is launched without any args, it will try to load by default '/usr/share/sedoric/sedoric3.dsk'. If this disk is not present, sedsd will failed.
