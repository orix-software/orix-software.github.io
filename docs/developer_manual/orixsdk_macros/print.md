# Print macro

## Description

print string in text mode

## usage

print #byte [,SAVE]
print (pointer) [,SAVE]
print address [,SAVE]

Option:

- TELEMON: when used within TELEMON bank
- NOSAVE : does not preserve A,X,Y registers



## Example

```ca65
  print helloworld_str
  crlf ; Return line
  rts
helloworld_str:
  .asciiz "Hello world!"
```

Call XWSTR0 function
