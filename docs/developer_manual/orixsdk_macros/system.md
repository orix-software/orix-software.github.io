# system

system mycommand

System fork

```ca65
    .include "telestrat.inc"

    system cmd
    rts
cmd:
    ls
```

Call [XEXEC](../../../developer_manual/kernel/primitives/xexec) kernel function (with X=1).
