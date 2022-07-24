cat parts/part1.md > manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-53}Help\n=====================\n\n">> manual.md
cat ../docs/commands/help.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-54}Hexdump\n======================">> manual.md
cat ../docs/commands/hexdump.md >> manual.md
echo '![](.//Pictures/1000020100000280000001D2140A361B5ADFEDE0.png){width="7.685cm" height="5.595cm"}' >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-55}Ioports\n=====================\n\nDisplays I/O address of the board\n">> manual.md
cat ../docs/commands/ioports.md >> manual.md

echo "\\\newpage\n">> manual.md
echo '[]{#anchor-56}Ls\n=====================\n\n'>> manual.md
cat ../docs/commands/ls.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}Lscpu\n=====================\n\n">> manual.md
cat ../docs/commands/lscpu.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}Lsmem\n=====================\n\n">> manual.md
cat ../docs/commands/lsmem.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}Man\n=====================\n\n">> manual.md
cat ../docs/commands/man.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-63}Mkdir\n=====================\n\n">> manual.md
cat ../docs/commands/mkdir.md >> manual.md

cat parts/pizero.md >> manual.md

echo "\\\newpage\n">> manual.md
echo "[]{#anchor-91}Untar\n=====================\n\n">> manual.md
cat ../docs/commands/untar.md >> manual.md

cat parts/last.md >> manual.md

pandoc -V geometry:margin=.5in   -s -o test.pdf manual.md
