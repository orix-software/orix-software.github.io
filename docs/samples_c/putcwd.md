# chdir in cc65

For instance chdir, is not manage in cc65, then here is a workaround.

Create a file _oputcwd.s. It must contains :

```ca65
.include "telestrat.inc"

XPUTCWD=$49

.export _oputcwd

.importzp tmp1

.proc _oputcwd
    stx tmp1
    ldy tmp1

    BRK_TELEMON XPUTCWD
    rts
.endproc
```

And now, you C code, you can do (don't forget to add _oputcwd.s to your command line to build _oputcwd.s when you launch cl65):

```c
extern unsigned char oputcwd();


int main() {
    oputcwd("/etc");
    return 0;
}
```