# Guidelines

## Ways to do a binary

There is many ways to buid a binary : bank or on storage

To summarize, the best speed shoud be read only bank, but it could a bit slow when program runs cd

| type        | Starting speed                            |Loading| kernel search command speed| Runtime speed |
|-------------|--------------------------------------|-------|----------------------------|---------------|
|Eeprom bank  |  :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }     | :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }|  :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star } | :fontawesome-regular-star:{ .star }  :fontawesome-regular-star:{ .star }
|RAM bank |    :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }      | :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }:fontawesome-regular-star:{ .star } |:fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }:fontawesome-regular-star:{ .star } | :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }
|Binary from /bin |    :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }      | :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star } | :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star } | :fontawesome-regular-star:{ .star } :fontawesome-regular-star:{ .star }:fontawesome-regular-star:{ .star }

* Eeprom bank : No loading, Best mode to find a command for the kernel and probably slower due to zp use and indirect mode to access memory.
* RAM bank : No loading, second Best mode to find a command for the kernel and probably slower due to zp use and indirect mode to access memory.
* Binary on the storage : loading, the worst way to find a command : kernel search into bank and after in the storage. Probably faster than bank (due to absolute mode in it's own buffers)