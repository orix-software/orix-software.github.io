# XSOCKET

.define KERNEL_SOCKET_NETWORK            $05

```ca65
    lda     #$00
    ldx     domain
    ldy     type

    lda     #KERNEL_SOCKET_NETWORK
    BRK_TELEMON $01
```

!!! tip "See [socket.lib](https://oriclibs.github.io/socketlib/2025.4/) to use it easily"
