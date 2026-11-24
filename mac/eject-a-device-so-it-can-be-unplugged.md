# Eject A Device So It Can Be Unplugged

When I plug in something like an external hard drive or my Garmin watch, it is
considered a "disk" that is externally and physically mounted. I can see that it
is connected now with `diskutil`.

```bash
❯ diskutil list physical external
/dev/disk5 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:                            GARMIN                 *57.0 MB    disk5
```

Typically before unplugging devices like this, you want to tell the OS to
_eject_ them first. This ensures that no I/O, especially in-flight writes, are
happening when you actually pull the plug. I can `eject` with `diskutil` as
well. I reference the device by name.

```bash
❯ diskutil eject GARMIN
Disk GARMIN ejected
```

Now when I run the same `list` command as above, nothing is listed.

```bash
❯ diskutil list physical external
```

See `man diskutil` for more details.
