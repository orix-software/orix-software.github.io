# Mount management :


## FP
Each FP has a struct with with string, flag and others 3 bytes : 

extbank (1 byte)
vectorbank (2 bytes)

When a fopen is done, if the file is not found on current device (ch376), before it returns null, it tries to find EXTFP string in bank

If it's found, EXTFP is executed (not forked) and it returns a A Y vector to manage this FP (if it manage this path). If it does not manage this path, it return null.

## When a FREAD/FWRITE is done, if extbank is different to 0, then, Kernel will launch external vector with A and Y contains the string of the path, and X contains the action : 
X=1 : FREAD
X=2 : FWRITE
X=3 : XCLOSE

## ls case

ls should do a FOPEN call. It should return a fp. When we need to displays the external path, we need to know which command we need to launch to kernel

## cp/mv case

don't know

