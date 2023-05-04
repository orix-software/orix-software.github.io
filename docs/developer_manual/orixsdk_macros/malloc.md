
# Malloc

## usage

malloc size [,ptr] [,oom_msg_ptr] [,fail_value]

malloc #$0100
malloc (ptr)
malloc value

Note:
    - if parameter 'ptr' is present, store resulting AY in ptr &ptr+1
    - if parameter 'oom_msg_ptr' is present, emit string pointed by
        'oom_msg_ptr' and return if AY is null (ie malloc error)

Call [XMALLOC](../../kernel/primitives/xmalloc/) function
