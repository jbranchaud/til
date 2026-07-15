# Access CoreUtils That Conflict With Unix Utilities

In [another post about GNU CoreUtils](add-a-bunch-of-cli-utilities-with-coreutils.md) I explained how to
install and use some of the provided utilities. The utilities I referenced were
`seq` and `realpath` which are novel on MacOS. There are other CoreUtils that
would conflict with existing system utilities. To avoid the conflicts, those
utilities are installed with `g` prefix.

A good example of this is `mv` and `gmv`. These are both utilities for moving
files and largely behave the same. They are a few subtle differences though.

Here is the manpage for the built-in `mv` utility:

```
NAME
     mv – move files

SYNOPSIS
     mv [-f | -i | -n] [-hv] source target
     mv [-f | -i | -n] [-v] source ... directory
```

And here is the manpage for `gmv`:

```
NAME
       mv - move (rename) files

SYNOPSIS
       mv [OPTION]... [-T] SOURCE DEST
       mv [OPTION]... SOURCE... DIRECTORY
       mv [OPTION]... -t DIRECTORY SOURCE...
```

There are some different forms and flags available. `gmv` for instance supports
a `-t` flag which specifies the _target_ directory so that all other listed
paths are treated as sources of the move. This makes `gmv` easier to use with
`xargs`, for instance.

Look through `fd '^g' /opt/homebrew/bin/` and you'll notice a bunch of them like
`gls`, `gln`, `ghead`, `gwhoami`, `gyes`, etc. You can also look through all of
them in the [`coreutils.json` homebrew formula](https://formulae.brew.sh/api/formula/coreutils.json).
