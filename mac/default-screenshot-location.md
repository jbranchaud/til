# Default Screenshot Location

By default, Mac saves all screenshots to the desktop. If you'd like
screenshots to be dumped somewhere else, you have to configure it manually
from the command line. For instance, if you'd like your screenshots to be
saved in the `~/screenshots` directory, then enter the following commands:

```bash
$ mkdir ~/screenshots
$ defaults write com.apple.screencapture location ~/screenshots
$ killall SystemUIServer
```

[source](http://osxdaily.com/2011/01/26/change-the-screenshot-save-file-location-in-mac-os-x/)
