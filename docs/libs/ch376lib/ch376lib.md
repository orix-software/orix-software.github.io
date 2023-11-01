# ch376 lib (version v2021.2)

## _ch376_check_exist

Modify A
Returns : A = $AA if ch376 is found

Send #$55 to ch376 and read the answer

```ca65
    jsr _ch376_check_exist
    cmp   #$55
    beq   ch376_is_here
    ; Not found

ch376_is_here:
    ; Found
    rts
```

## _ch376_dir_create

Modify A, X, Y
Returns: A=1 if the wait from ch376 has failed or A = status of the CH376

Send the order to create the folder (setfilename must be set before)

```ca65

    rts
```

## _ch376_disk_capacity

## _ch376_disk_mount

## _ch376_disk_query

## _ch376_file_close

## _ch376_file_create

## _ch376_file_erase

## _ch376_file_open

## _ch376_get_descr

## _ch376_get_file_size

## _ch376_ic_get_ver

## _ch376_lib_version

## _ch376_reset_all

## _ch376_set_bytes_read

## _ch376_set_file_name

## _ch376_set_usb_mode

Broken

## _ch376_wait_response
