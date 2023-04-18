
# initmainargs

### Init struct of the mainargs from current process

```ca65
	XMAINARGS       = $2C
	XGETARGV        = $2E
	argv            := userzp   ; 2 bytes
	argc            := userzp+2 ; 1 byte

	initmainargs argv, argc, 0
```

