# Open Finder.app To Specific Directory

The Mac OSX built-in GUI for navigating directories and files is _Finder.app_.
I use it just about anytime I need to drag a file on my machine into Slack,
Discord, Google Drive, or wherever else has a file drop zone.

Sometimes certain directories can be hard to navigate to because they are
deeply nested or because Mac hides them by default. The `~/Library` directory
is a great example of the latter.

I can use the `open` command from the terminal to open a Finder window right in
that directory.

```bash
$ cd ~/Library
$ open .
```

I first navigated there and then I ran `open .` which means open the current
directory. For directories, `open` defaults to using Finder.app.

I could have also run `open` with the target directory name instead of
navigating there first.

```bash
$ open ~/Library
```

See `man open` for more details.
