# Allow Cursor To Be Launched From CLI

It is nice to be able to open Cursor for a specific project directly from the
terminal like so:

```bash
$ cd ~/dev/my/project

$ cursor .
```

For the `cursor` launcher binary to be available like that, we have to find it
and add it to the path.

It is probably located in the `/Applications` folder and within that nested down
a couple directories is a `bin` directory that contains the binary we're looking
for.

```bash
ls /Applications/Cursor.app/Contents/Resources/app/bin
 bin/
├──  code*
├──  cursor*
└──  cursor-tunnel*
```

The `cursor` binary is what we want, so let's add that to our path. In my case,
I'll add this to my `~/.zshrc` file.

```bash
export PATH="/Applications/Cursor.app/Contents/Resources/app/bin:$PATH"
```
