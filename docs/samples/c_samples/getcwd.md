# Get CWD in cc65

For instance chdir, is not manage in cc65, then here is a workaround.

Create a file _ogetcwd.s. It must contains : 

```ca65
.include "telestrat.inc"

XGETCWD=$48

.export _ogetcwd

.importzp tmp1

.proc _ogetcwd
    BRK_TELEMON XGETCWD
    sty tmp1
    ldx tmp1
    rts
.endproc
```

And now, you C code, you can do (don't forget to add _ogetcwd.s to your command line to build _ogetcwd.s when you launch cl65):

```c
extern unsigned char ogetcwd();


int main() {
    printf("Cwd : %s",ogetcwd());
    return 0;
}
```