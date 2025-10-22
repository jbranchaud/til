# Capture Screenshoot To Clipboard From CLI

MacOS comes with a `screencapture` utility that you can run from the terminal
to activate the built-in screenshot functionality on Mac.

Usually when I am taking a screenshot, I want to do something with it right
away. Such as paste it into an application or group chat. The `-c` flag forces
the screen capture to go the clipboard.

I also generally want to capture a specific area of the screen so that the
captured image includes the right amount of context and nothing more. The `-i`
flag puts you in interactive screen capture mode. That means your cursor will
turn into a crosshair that you can use to make a drag selection of the capture
area.

```bash
$ screencapture -ic
```

Select an area to capture, it's now on your clipboard, paste it where you need
it.

Note: The first time you run this command, your terminal program (e.g. iTerm2)
may prompt you for the necessary OS permissions in order to capture images of
your screen. You'll need to grant those permissions and then rerun the command.

See `man screencapture` for more details.
