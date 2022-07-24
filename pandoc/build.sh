cat parts/part1.md > manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/bank.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/cksum.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/help.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/hexdump.md >> manual.md
echo '![](.//Pictures/1000020100000280000001D2140A361B5ADFEDE0.png){width="7.685cm" height="5.595cm"}' >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/ioports.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/ls.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/lscpu.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/lsmem.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/man.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/mkdir.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/sh.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/twil.md >> manual.md

cat parts/pizero.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/submit.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/untar.md >> manual.md

cat parts/last.md >> manual.md

pandoc -V geometry:margin=.5in   -s -o manual.pdf manual.md
