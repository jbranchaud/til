# Show The diffstat Summary Of A Commit

Use the `--stat` flag when running `git show` on a commit to see the
`diffstat` summary of that commit. For instance, this is what I get for a
recent commit to [delve](https://github.com/derekparker/delve):

```bash
$ git show 8a1f36a1ce --stat
commit 8a1f36a1ce71d708d1d82afbc2191de9aefba021
Author: Derek Parker <derek.parker@coreos.com>
Date:   Wed Jan 27 23:47:04 2016 -0800

    dlv: Flag to print stacktrace on trace subcommand

 cmd/dlv/main.go     | 45 ++++++++++-----------------------------------
 terminal/command.go |  7 +++++--
 2 files changed, 15 insertions(+), 37 deletions(-)
```

The following is a description of the `diffstat` program

> This  program  reads the output of diff and displays a histogram of the
> insertions, deletions, and modifications per-file.

See `man git-show` and `man diffstat` for more details.
