# Print macro

print string in text mode

```ca65
	;----------------------------------------------------------------------
	;
	; usage:
	;	print #byte [,TELEMON|SAVE]
	;	print (pointer) [,TELEMON|SAVE]
	;	print address [,TELEMON|SAVE]
	;
	; Option:
	;	- TELEMON: when used within TELEMON bank
	;	- NOSAVE : does not preserve A,X,Y registers
	;
	; Call XWSTR0 function
	;
	;----------------------------------------------------------------------
```


```ca65
  print helloworld_str
  crlf ; Return line
  rts
helloworld_str:
	.asciiz "Hello world!"
```