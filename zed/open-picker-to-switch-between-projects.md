# Open Picker To Switch Between Projects

When opening multiple projects with [Zed](https://zed.dev/), they can be spread
across separate instances (windows), but Zed's preference is that all projects
are within the same window. Both _File > Open_ and `zed path/to/project` will
open that project as part of the existing Zed window.

Once I'm working with multiple projects, I need to toggle between them. This can
be done from the _Threads_ sidebar by Cmd-clicking the project I want to focus.
I, however, prefer to use the keybinding that opens a picker menu.

```
Cmd+Opt+o
```

Hitting that keybinding with the editor area focused will open a Command Palette
specifically for interacting with open projects.

I can navigate to the one I want to open either with the arrow keys or `Ctrl-n`
/ `Ctrl-p` and then hit enter to open it.
