# Touch Access And Modify Times Individually

When running the `touch` command on an existing file:

```bash
$ touch README.md
```

The `Access` and `Modify` times of that file will be updated to the current
time.

You can update these values individually with the `-a` and `-m` flags.

To update just the access time:

```bash
$ touch -a README.md
```

To update just the modify time:

```bash
$ touch -m README.md
```

See `man touch` for more details.
