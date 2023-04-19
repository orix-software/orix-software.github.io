#! /bin/bash

declare -a tab_command
declare -a tab_repo

tab_command=("asm2k2" "bank"  "basic10" "basic11" "barboric" "blakes7" "bootfd" "born1983" "cat"   "cd"     "cksum" "clear" "cp"    "df"    "otimer" "dsk-util" "echo"  "env"   "forth" "ftdos" "grep" "help" "hexdump"  "ioports" "list" "ls"    "lscpu" "lsmem" "loader" "man"   "mkdir" "mount" "orixcfg" "pwd"   "ps"     "quintes"        "raw2dsk" "readdsk" "reboot" "rm"    "setfont" "sh"    "submit" "touch" "twil"  "twiload" "uname" "untar" "vidplay" "viewscr" "viewhrs" "zerofx")
tab_repo=(   "asm2K2" "shell" "shell"   "shell"   "barboric" "blakes7" "bootfd" "born1983" "shell" "shell"  "cksum" "shell" "shell" "shell" "shell"  "dsk-util" "shell" "shell" "forth" "ftdos" "grep" "shell" "hexdump" "shell"  "list"  "shell" "shell" "shell" "systemd" "shell" "shell" "shell" "orixcfg" "shell" "shell" "quintessential" "raw2dsk" "readdsk" "shell"  "shell" "shell"   "shell" "submit" "shell" "shell" "systemd" "shell"  "untar" "vidplay" "viewscr" "shell" "zerofx")

if [ -z $TOKEN_GITHUB_PRIVATE_REPO ]; then
echo Missing TOKEN_GITHUB_PRIVATE_REPO  impossible to get private repo
else
GITHUB_AUTH=$TOKEN_GITHUB_PRIVATE_REPO@
echo no
fi


if [ "$1" == "--full" ]; then
mkdir docs/commands/ -p

rm docs/commands/all.md
rm docs/commands/commands_for_nav.md

for i in ${!tab_command[@]}; do
VAL=${tab_command[$i]}

echo ${tab_repo[$i]}


curl https://github.com/orix-software/pbar-lib/blob/main/docs/api/pbar-lib.md -o docs/libs/

MYURL="https://${GITHUB_AUTH}raw.githubusercontent.com/orix-software/${tab_repo[$i]}/master/docs/$VAL.md -o docs/commands/$VAL.md"

echo $MYURL
curl  $MYURL
ret=$?

if [ $ret -ne 0 ]; then
exit
fi

MYURLVERSION="https://${GITHUB_AUTH}raw.githubusercontent.com/orix-software/${tab_repo[$i]}/master/VERSION -o VERSION"

curl $MYURLVERSION

MYVERSION=`cat VERSION`

echo "* [$VAL](../$VAL) Last version : $MYVERSION" >> docs/commands/all.md
echo "$VAL: commands/$VAL.md" >> docs/commands/commands_for_nav.md
done
fi

mkdocs build && cp site/* . -r  && git add * && git commit -m update && echo push &&  git push


