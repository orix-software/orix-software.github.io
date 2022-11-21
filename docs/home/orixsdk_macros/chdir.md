
# CHDIR macro

```ca65
	;----------------------------------------------------------------------
	;
	; usage:
	;	chdir ptr [,TELEMON]
	;
	; note:
	;	ptr may be: (ptr), address
	;
	; Call XPUTCWD function
	;----------------------------------------------------------------------
```

```ca65
    chdir myfolder
    rts
myfolder:
    .asciiz "home"
```
