# XREADDIR

Read current folder and returns all entry in AY.

It returns max : 100 entry (READDIR_MAX_LINE = 100 values in kernel)

## Example

``` ca65
    ldx     #$01               ; XREADDIR MODE  Mode

    BRK_TELEMON $2F

	rts
@ok:
    ; Save ptr
    rts

```

!!! tip "XREADDIR returns a ptr"
