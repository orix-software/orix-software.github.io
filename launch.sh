#! /bin/bash

declare -a tab_command

tab_command=("bank" "basic11" "bootfd" "cat"   "cd"    "cksum"   "clear" "date"   "dsk-util"       "echo"  "env"   "forth" "help" "hexdump"  "ioports"  "ls"    "lscpu" "lsmem" "man"   "mkdir" "mount" "orixcfg" "ps"     "reboot" "rm"    "setfont" "touch" "twil"  "uname" "untar" "vidplay" "viewscr" "viewhrs" )
tab_repo=("shell"   "shell"   "bootfd"  "shell" "shell"  "cksum"        "shell" "shell"  "dsk-util" "shell" "shell" "forth" "shell" "hexdump" "shell"    "shell" "shell" "shell" "shell" "shell" "shell" "orixcfg" "shell"  "shell"  "shell" "shell"   "shell" "shell" "shell" "untar" "vidplay" "viewscr" "shell")


COMMAND_LIST="bank basic11 cat cd clear date echo env help ioports ls lscpu lsmem man mkdir mount ps reboot rm setfont touch twil uname viewhrs"
COMREPO_LIST="shell shell shell"
#cd kernel && mkdocs build && cp site/* . -adpR && cd ..
#cd hardware && mkdocs build && cp site/* . -adpR && cd ..

if [ "$1" == "--full" ]; then
mkdir docs/commands/ -p

rm docs/commands/all.md

#for I in $COMMAND_LIST; do
for i in ${!tab_command[@]}; do
VAL=${tab_command[$i]}
echo Get shell .md 

wget https://raw.githubusercontent.com/orix-software/${tab_repo[$i]}/master/docs/$VAL.md -O docs/commands/$VAL.md
echo "* [$VAL](../$VAL)" >> docs/commands/all.md
done 

echo "* [grep](../grep)" >> docs/commands/all.md
wget https://github.com/orix-software/grep/raw/master/docs/grep.md -O docs/commands/grep.md


echo full
fi

mkdocs build && cp site/* . -r  && git add * && git commit -m update &&echo push &&  git push
