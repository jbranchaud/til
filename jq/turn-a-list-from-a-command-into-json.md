# Turn A List From A Command Into JSON

There are a lot of command-line utilities that produce a list of things. Since
JSON is a universal data format, it would be useful to be able to quickly turn
some items from `stdout` into a JSON list.

The [`jq`](https://jqlang.github.io/jq/) utility can help with this.

Let's say I'm working with the following `git` command that lists changed files
in a specific directory.

```bash
$ git diff --name-only | grep some/dir
```

I can then pipe that list of files to `jq` with a few flags.

```bash
$ git diff --name-only \
  | grep some/dir \
  | jq -R -s 'split("\n")[:-1]'
```

Here's what is going on:

- The `-R` flag tells `jq` to accept raw input, rather than looking for JSON.
- The `-s` flag is short for `--slurp` and tells `jq` to read in the entire
  input before applying the filter.
- The string argument is the filter to be applied to the output. It splits on
  newlines and then takes the entire array except for the last item (`[:-1]`)
  which would be an empty string for the trailing newline.
- `jq` automatically turns the whole thing into a formatted JSON list.
