
# Malloc

## Description

Performs a malloc

## usage

malloc size [,ptr] [,oom_msg_ptr] [,fail_value]

malloc #$0100
malloc (ptr)
malloc value

Note:
    - if parameter 'ptr' is present, store resulting AY in ptr &ptr+1
    - if parameter 'oom_msg_ptr' is present, emit string pointed by
        'oom_msg_ptr' and return if AY is null (ie malloc error)

## Output

A and Y contains the ptr. If A and Y are equal to 0, the malloc had failed

## Example

```ca65
    .include "telestrat.inc"
    .include "../orix-sdk/macros/SDK_memory.mac"

    malloc #$100
    rts
```

Call [XMALLOC](../../../developer_manual/kernel/primitives/xmalloc.md) function
