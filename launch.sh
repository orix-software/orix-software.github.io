#! /bin/bash

COMMAND_LIST="bank basic11 cat cd clear date echo env help ioports ls lscpu lsmem man mkdir mount ps reboot rm setfont touch twil uname viewhrs"

#cd kernel && mkdocs build && cp site/* . -adpR && cd ..
#cd hardware && mkdocs build && cp site/* . -adpR && cd ..

if [ "$1" == "--full" ]; then
mkdir docs/commands/ -p

rm docs/commands/all.md

for I in $COMMAND_LIST; do
echo Get shell .md 
wget https://raw.githubusercontent.com/orix-software/shell/master/docs/$I.md -O docs/commands/$I.md
echo "* [$I](../$I)" >> docs/commands/all.md
done 

echo "* [dsk-util](../dsk-util)" >> docs/commands/all.md
wget https://github.com/orix-software/dsk-util/raw/master/docs/dsk-util.md -O docs/commands/dsk-util..md

echo full
fi

mkdocs build && cp site/* . -adpR  && git add * && git commit -m update && git push
