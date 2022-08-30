#! /bin/bash

declare -a tab_command
declare -a tab_repo

tab_command=("bank" "basic10" "basic11" "barboric" "blakes7" "bootfd" "born1983" "cat"   "cd"     "cksum" "clear" "otimer" "dsk-util" "echo"  "env"   "forth" "ftdos" "grep" "help" "hexdump"  "ioports" "list" "ls"    "lscpu" "lsmem" "loader" "man"   "mkdir" "mount" "orixcfg" "pwd"   "ps"     "quintes" "reboot" "rm"    "setfont" "sh"    "submit" "touch" "twil"  "twiload" "uname" "untar" "vidplay" "viewscr" "viewhrs" )
tab_repo=("shell"   "shell"   "shell"   "barboric" "blakes7" "bootfd" "born1983" "shell" "shell"  "cksum" "shell" "shell"  "dsk-util" "shell" "shell" "forth" "ftdos" "grep" "shell" "hexdump" "shell"  "list"  "shell" "shell" "shell" "systemd" "shell" "shell" "shell" "orixcfg" "shell" "shell" "quintessential" "shell"  "shell" "shell"   "shell" "submit" "shell" "shell" "systemd" "shell"  "untar" "vidplay" "viewscr" "shell")


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

wget https://raw.githubusercontent.com/orix-software/${tab_repo[$i]}/master/docs/$VAL.md -O docs/commands/$VAL.md

ret=$?

#if [ $ret -ne 0 ]; then
#exit
#fi

wget https://raw.githubusercontent.com/orix-software/${tab_repo[$i]}/master/VERSION -O VERSION

MYVERSION=`cat VERSION`

echo "* [$VAL](../$VAL) Last version : $MYVERSION" >> docs/commands/all.md
done


tab_rom=("kernel" "shell")

#echo "# VERSION" > docs/user_manual/rom_versions.md

for i in ${!tab_rom[@]}; do
VAL=${tab_rom[$i]}

#wget https://raw.githubusercontent.com/orix-software/${VAL}/master/VERSION -O VERSION
#echo "* [$VAL](../$VAL)" >> docs/user_manual/rom_versions.md
#cat VERSION >>docs/user_manual/rom_versions.md
done




#wget https://raw.githubusercontent.com/orix-software/submit/master/docs/subdoc.md -O docs/commands/subdoc.md



echo full
fi


mkdocs build && cp site/* . -r  && git add * && git commit -m update &&echo push &&  git push
