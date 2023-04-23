# Guidelines

## Ways to do a binary

There is many ways to buid a binary : bank or on storage

To summarize, the best speed shoud be read only bank, but it could a bit slow when program runs cd

| type        | Relocation                           |Loading| kernel search command speed| Runtime speed | Update performance|
|-------------|--------------------------------------|-------|----------------------------|---------------|-------------------|
|Read only bank (eeprom) |:fontawesome-regular-star: { .star }   No relocation performed      | No loading | Best mode to find a command for the kernel | probably slower due to zp use and indirect mode to access memory | worst : need to load 64KB Rom slot to update
|Read/write bank (Ram) |    No relocation performed      | No loading | Best mode to find a command for the kernel (slower than read only bank)| probably slower due to zp use and indirect mode to access memory | need to load file into the 16KB bank
|Binary from /bin |    Relocation performed (some lag to relocate)     | Loading from storage| The worst way to find a command : kernel search into bank and after in the storage| probably faster than bank (due to absolute mode in it's own buffers) | just copy binary into /bin
