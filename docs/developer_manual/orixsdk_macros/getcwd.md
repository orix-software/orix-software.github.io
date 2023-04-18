# getcwd

	;----------------------------------------------------------------------
	;
	; usage:
	;	getcwd ptr [,TELEMON]
	;
	; note:
	;	ptr may be: ptr, address
	;
	; Call XGETCWD function
	;----------------------------------------------------------------------
	.macro getcwd ptr, option


```ca65
	pwd            := userzp ; 2 byte

	getcwd pwd
```