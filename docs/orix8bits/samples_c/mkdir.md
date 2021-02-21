# Create a folder with cc65

For instance mkdir in cc65 telestrat target is bugged, here is a work around. Create a file _omkdir.s. It must contains : 

mkdir kernel primitive does not support absolute path, and it can only create folder in CWD.

```ca65
.include "telestrat.inc"

.export _omkdir

.importzp tmp1

.proc _omkdir
    stx tmp1
    ldy tmp1

    BRK_TELEMON XMKDIR
    rts
.endproc
```

And now, you C code, you can do (don't forget to add _omkdir.s to your command line to build _omkdir.s when you launch cl65):

```c
extern void omkdir(unsigned char *path);


int main() {
    mkdir ("myfolder");
    return 0;
}
```