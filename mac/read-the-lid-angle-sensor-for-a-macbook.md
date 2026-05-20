# Read The Lid Angle Sensor For A MacBook

MacOS has a bunch of internal HID (Human Interface Device) data that can surface
details about all kinds of "devices" that comprise your machine. Some obvious
ones are the keyboard and trackpad as well as external mice and keyboards. The
battery and power source details are another which is sometimes integrated into
tools that display battery status (e.g.
[`tmux-battery`](https://github.com/tmux-plugins/tmux-battery)), though it uses
`pmset` directly). And many, many more.

One example I'd never considered is that there is a sensor for the lid angle of
the laptop that can tell the system whether the lid is open or closed and how
open it is (i.e. at what angle). There is no public interface for this lid angle
sensor, but people exploring all the HID devices have found the identifiers that
correspond to it (e.g.
[`pybooklid`](https://github.com/tcsenpai/pybooklid/blob/main/pybooklid/macbook_lid.py)).

Here is a minimal script that uses `uv`, `hidapi` (python bindings), and
`libhidapi` (shared runtime lib for those bindings):

```python
#!/usr/bin/env -S uv run --quiet --script
# /// script
# requires-python = ">=3.10"
# dependencies = ["hidapi"]
# ///
"""Print MacBook lid angle in degrees."""
import os, sys

if sys.platform == "darwin":
    brew = "/opt/homebrew/lib"
    if os.path.exists(brew):
        os.environ["DYLD_LIBRARY_PATH"] = f"{brew}:{os.environ.get('DYLD_LIBRARY_PATH','')}"

import hid

VENDOR_ID, PRODUCT_ID = 0x05AC, 0x8104
USAGE_PAGE, USAGE = 0x0020, 0x008A
REPORT_ID = 1

def read_angle():
    for info in hid.enumerate(VENDOR_ID, PRODUCT_ID):
        if info.get("usage_page") == USAGE_PAGE and info.get("usage") == USAGE:
            d = hid.device()
            path = info["path"]
            d.open_path(path if isinstance(path, bytes) else path.encode())
            try:
                data = d.get_feature_report(REPORT_ID, 8)
                if data and len(data) >= 3:
                    return float((data[2] << 8) | data[1])
            finally:
                d.close()
    return None

if __name__ == "__main__":
    a = read_angle()
    if a is None:
        sys.exit("sensor not available")
    print(f"{a:.0f}")
```

These IDs and usage values are the undocumented values that allow the script to
navigate specifically to the lid angle sensor and specifically to the usage page
and value that represent the current lid angle reading.

```
VENDOR_ID, PRODUCT_ID = 0x05AC, 0x8104
USAGE_PAGE, USAGE = 0x0020, 0x008A
REPORT_ID = 1
```

I added [this
script](https://github.com/jbranchaud/dotfiles/blob/cbc7196607d1d6b25885f5387ca85b658bd765de/bin/lidangle)
to [my dotfiles](https://github.com/jbranchaud/dotfiles) and made it executable
(`chmod +x bin/lidangle`) so that I can try it out. I first ran it while it was
closed and connected to my external monitor (`0`), then I opened it as far as it
could go (`129`), and then I tried angling it close to what I thought was 90
degress (`92`, so close).

```bash
❯ lidangle
0

❯ lidangle
129

❯ lidangle
92
```
