# Build a binary from cc65 or assembly located on sdcard

cc65 generates a non relocation format for telestrat target.

We decided to stop this format in the kernel v2022.4 because it was too complex to manage it in a kernel which use dynamic memory allocation.

In order to generate a launchable binary, relocbin must be used : https://github.com/assinie/orix-sdk/blob/master/bin/relocbin.py3

## Step one : build your binary from cc65 with the start address $800 

cl65 -ttelestrat mysrc.c -o mysrc_800 --start-addr \$800

## Step Two : build your binary from cc65 with the start address $900

cl65 -ttelestrat mysrc.c -o mysrc_900 --start-addr \$900

## Step three (last one) : generate the relocation format :

python relocbin.py3 -2 -o mybin mysrc_800 mysrc_900 










