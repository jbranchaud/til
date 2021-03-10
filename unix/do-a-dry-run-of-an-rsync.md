# Do A Dry Run Of An rsync

The `rsync` command, especially when running recursively (with the `-a` flag),
will create and update a bunch of directories and files. Because of that, you
may want to do a _dry run_ of an `rsync` command to make sure it is touching
the intended files.

The `--dry-run` flag (or the `-n` flag for short) will prepare a
synchronization of one directory to another. You can use this flag to be sure
that the source and target files and directories are correct.

The `-n` (or `--dry-run`) flag on its own won't _show_ what is going to get
synced. To get that information, you need to combine it with the `-v` (verbose)
flag.

```bash
$ rsync -anv til-temp/ til-content

building file list ... done
./
LICENSE
...

sent 909 bytes  received 296 bytes  2410.00 bytes/sec
total size is 1058  speedup is 0.88
```

That will show everything that is going to be synced from `til-temp/`
recursively to `til-content`.

Doing a dry run is a great way to make sure you have the patterns for
`--exclude` flags correct, before actually syncing anything.

```bash
$ rsync -anv --exclude='./*.md' --exclude='.*' til-temp/ til-content
```

That excludes top-level markdown files and all dotfiles and dot-directories.

[source](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories)
