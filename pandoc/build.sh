cat parts/part1.md > manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/asm2k2.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/bank.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/barboric.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/blakes7.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/bootfd.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/born1983.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/cat.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/cd.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/cksum.md >> manual.md
echo '![](.//Pictures/1000020100000281000001CFDD8EF28C17D2A206.png){width="7.685cm" height="5.595cm"}' >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/clear.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/cp.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/df.md >> manual.md
echo "" >> manual.md
echo '![](.//Pictures/1000000000000283000001D12D928D88479E7F83.png){width="17cm" height="12.293cm"}' >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/dsk-util.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/echo.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/env.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/forth.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/ftdos.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/grep.md >> manual.md
echo "" >>  manual.md
echo '![](../docs/update/images/2022_3/grep.jpg){width="7.685cm" height="5.595cm"}' >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/help.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/hexdump.md >> manual.md
echo "" >>  manual.md
echo '![](.//Pictures/1000020100000280000001D2140A361B5ADFEDE0.png){width="7.685cm" height="5.595cm"}' >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/ioports.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/ls.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/lscpu.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/lsmem.md >> manual.md


cho "\\\newpage\n">> manual.md
cat ../docs/commands/man.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/mkdir.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/mount.md >> manual.md
echo "" >>  manual.md
echo '![](.//Pictures/1000020100000280000001CFC6CDA413ADDF6624.png){width="7.685cm" height="5.595cm"}' >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/more.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/otimer.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/pwd.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/ps.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/quintes.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/reboot.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/rm.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/sh.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/twil.md >> manual.md

cat parts/pizero.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/submit.md >> manual.md
#echo "\n======================\n">> manual.md
#cat ../docs/commands/subdoc.md >> manual.md

echo "\\\newpage\n">> manual.md
cat ../docs/commands/untar.md >> manual.md

cat parts/last.md >> manual.md

pandoc -V geometry:margin=.5in -s -o ../twilighte_manual.pdf manual.md
