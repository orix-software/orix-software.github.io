cat parts/part1.md > manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-53}HELP\n=====================\n\n">> manual.md
cat ../docs/commands/help.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-54}HEXDUMP\n======================">> manual.md
cat ../docs/commands/hexdump.md >> manual.md
echo '![](.//Pictures/1000020100000280000001D2140A361B5ADFEDE0.png){width="7.685cm" height="5.595cm"}' >> manual.md


echo "\\\newpage\n">> manual.md
echo "[]{#anchor-55}IOPORTS\n=====================\n\nDisplays I/O address of the board\n">> manual.md
cat ../docs/commands/ioports.md >> manual.md

echo "\\\newpage\n">> manual.md
echo '[]{#anchor-56}LS\n=====================\n\n'>> manual.md
cat ../docs/commands/ls.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}LSCPU\n=====================\n\n">> manual.md
cat ../docs/commands/lscpu.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}LSMEM\n=====================\n\n">> manual.md
cat ../docs/commands/lsmem.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}MAN\n=====================\n\n">> manual.md
cat ../docs/commands/man.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}MKDIR\n=====================\n\n">> manual.md
cat ../docs/commands/mkdir.md >> manual.md


cat parts/last.md >> manual.md

pandoc -V geometry:margin=.5in --template=latex.tpl  -s -o test.pdf manual.md
