# Get Latest Commit Timestamp For A File

The `git log` command can tell you all the commits that touched a file. That
can be narrowed down to the latest commit for that file with the `-1` flag. The
commit that it reports can then be further formatted to with the `--format`
flag.

The `%ai` format pattern gives the date the commit was authored in an ISO
8601-like format. The `%aI` (capital `I`) gives the date the commit was
authored strictly in the ISO 8601 format.

Here are examples of both side by side:

```bash
❯ git log -1 --format=%ai -- README.md
2024-10-15 13:59:09 -0500

❯ git log -1 --format=%aI -- README.md
2024-10-15T13:59:09-05:00
```

I made use of this in a script where I needed to get an idea of when various
files were most recently modified.

See `man git-log` and the `PRETTY FORMATS` section for more details.
