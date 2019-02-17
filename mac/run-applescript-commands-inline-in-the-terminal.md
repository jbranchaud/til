# Run AppleScript Commands Inline In The Terminal

[AppleScript](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html)
is often invoked as a series of commands from a file. It is also possible to
execute individual commands inline in the terminal. Use the `-e` flag to
specify the command.

For example, if you'd like to mute your Mac:

```bash
$ osascript -e 'set volume 0'
```

Run that and your Mac's volume will now be at zero.

[source](http://osxdaily.com/2016/08/19/run-applescript-command-line-macos-osascript/)
