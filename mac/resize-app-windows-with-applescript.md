# Resize App Windows With AppleScript

I showed in a [previous
TIL](run-applescript-commands-inline-in-the-terminal.md) how we can run
AppleScript commands inline from the terminal. Here is an inline command
for positioning and resizing your iTerm2 window.

```bash
osascript -e 'tell application "iTerm2"
  set the bounds of the first window to {50, 50, 1280, 720}
end tell'
```

The first two values tell the command the `x` and `y` coordinates of where
to position the upper left corner of the window relative to the upper left
corner of your screen. The next two values are the `width` and `height` that
the window should be resized to.

[source](https://apple.stackexchange.com/questions/98064/set-size-of-window-to-exact-pixels-and-place-via-x-y-coordinates)
