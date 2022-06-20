#! /bin/bash

declare -a tab_command

tab_command=("bank" "basic11" "cat" "cd" "clear" "date" "echo" "env" "help" "ioports" "ls" "lscpu" "lsmem" "man" "mkdir" "mount" "ps" "reboot" "rm" "setfont" "touch" "twil" "uname" "viewhrs")



COMMAND_LIST="bank basic11 cat cd clear date echo env help ioports ls lscpu lsmem man mkdir mount ps reboot rm setfont touch twil uname viewhrs"
COMREPO_LIST="shell shell shell"
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
wget https://github.com/orix-software/dsk-util/raw/master/docs/dsk-util.md -O docs/commands/dsk-util.md

echo "* [hexdump](../hexdump)" >> docs/commands/all.md
wget https://github.com/orix-software/hexdump/raw/master/docs/hexdump.md -O docs/commands/hexdump.md

echo "* [grep](../grep)" >> docs/commands/all.md
wget https://github.com/orix-software/grep/raw/master/docs/grep.md -O docs/commands/grep.md


echo "* [gunzip](../gunzip)" >> docs/commands/all.md
wget https://github.com/orix-software/gunzip/blob/master/src/man/gunzip.md -O docs/commands/gunzip.md




echo full
fi

mkdocs build && cp site/* . -r  && git add * && git commit -m update &&echo push &&  git push
