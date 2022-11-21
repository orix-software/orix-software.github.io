# XRD0

Check if a key is pressed

``` ca65
  BRK_KERNEL XRD0 ; primitive exits even if no key had been pressed
  bcs   @no_key_pressed
  ; When a key is pressed, A contains the ascii of the value
@here_a_key_is_pressed:
    rts
@no_key_pressed:
    rts
```
  Page last revised on: {{ git_revision_date }}
