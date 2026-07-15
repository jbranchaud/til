# Move A List Of Files To Another Directory

Let's say I have some command I run (it doesn't matter what it is) that produces
a list of files I want to deal with. For instance, how about all the markdown
files in some directory -- `fd -e md . docs`.

Whatever that list of files is, I want to move them to another directory. To do
that I can pipe the list to `mv` via `xargs`. The built-in `mv` command on MacOS
can take a list of one or more source files followed by a single target
directory. So I need `xargs` to inject the filename for the current line being
processed into the middle of each `mv` that gets executed.

```bash
❯ fd -e md . docs | xargs -IFILE mv FILE ../target/dir
# essentially:
# mv docs/file1.md ../target/dir
# mv docs/file2.md ../target/dir
# mv docs/file3.md ../target/dir
```

The `-I` flag lets me define a token (e.g. `FILE`) that represents a line from
the source input. I can then inject that token anywhere in the command that
`xargs` is evaluating. This `mv` command gets run once for each line (that is,
each file name) from the source input.

A slightly easier way to approach this if I have [GNU
CoreUtils](https://formulae.brew.sh/formula/coreutils) installed is to use their
version of `mv` ([which will be `gmv` for
me](/mac/access-coreutils-that-conflict-with-unix-utilities.md)) which has the
`-t` flag. With that form, I can specify the target directory first with `-t`
and then `xargs` can naturally inject all the file names from the source input
at the end of the line.

```bash
❯ fd -e md . docs | xargs gmv -t ../target/dir
# essentially:
# gmv -t ../target/dir docs/file1.md docs/file2.md docs/file3.md
```

See `man xargs` as well as `man mv` and `man gmv` for more details.
