# Interactively Switch asdf Package Versions

I use [`asdf`](https://asdf-vm.com/) to manage versions for a couple different
languages that I use across projects. I mostly use it for `node` and `ruby`.

When setting up a new project or needing to set the version for an existing
one, I run some version of:

```bash
$ asdf local nodejs <some-version-here>
```

But before I can do that, I need to figure out what versions I have installed
(`asdf list nodejs`), so I end up running two commands and having to remember
the nuances of the sub-commands for each.

I decided to make this small interaction easier by making it _interactive_ with
[`fzf`](https://github.com/junegunn/fzf).

```bash
asdf local nodejs $(
  asdf list nodejs | fzf | xargs | sed 's/^\*//'
)
```

This grabs the list of installed `nodejs` versions, turns it into an
interactive list with `fzf`, and then passes my selection to `asdf local` to
set that version.

I can substitute `ruby` for `nodejs` to do the same thing for Ruby versions.
