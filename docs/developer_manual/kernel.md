# Kernel

Kernel is located in bank 7.

Each primitives are called with "brk" instruction with a value after it.

We can pass args to AXY or others memory location and the primitive can be called.

[Orixsdk](../home/orixsdk/) manages some kernel calls, and it's better to use macro set to call some primitives

## Useful links

* Documented primitives  [Primitives](../../kernel/primitives/)

* Orixsdk (sdk for assembly) : [Orixsdk](../orixsdk/)

* C programming : cc65 (telestrat target)
