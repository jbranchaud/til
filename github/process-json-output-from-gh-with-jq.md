# Process JSON Output From gh With jq

The `gh` (GitHub) CLI is useful for accessing data about your profile and
projects from the terminal. With the `--json` flag, we can access the data in a
structured way which is useful for scripting.

Here is an example of pulling a list of all my repositories, limiting each
entity to just the `nameWithOwner` and `description`:

```bash
❯ gh repo list --limit 1000 --json nameWithOwner,description
[
  {
    "description": "My personal site -- joshbranchaud.com",
    "nameWithOwner": "jbranchaud/personal-site"
  },
  {
    "description": "Private repo for the NOTES.md of my TIL repo",
    "nameWithOwner": "jbranchaud/til-notes-private"
  },
  ...
]
```

If I'm using the `--json` flag, then I can add in the `--jq` flag to apply a
`jq` query for additional processing of the output.

Here I convert it to a series of tuples:

```bash
❯ gh repo list --limit 1000 --json nameWithOwner,description \
  --jq '.[] | [.nameWithOwner, .description]'
[
  "jbranchaud/personal-site",
  "My personal site -- joshbranchaud.com"
]
[
  "jbranchaud/til-notes-private",
  "Private repo for the NOTES.md of my TIL repo"
]
...
```

Then I can add one more pipe to that `jq` query to turn it into _tab-separated
values_ using
[`@tsv`](https://jqlang.org/manual/v1.5/#format-strings-and-escaping):

```bash
❯ gh repo list --limit 1000 --json nameWithOwner,description \
  --jq '.[] | [.nameWithOwner, .description] | @tsv'
jbranchaud/personal-site	My personal site -- joshbranchaud.com
jbranchaud/til-notes-private	Private repo for the NOTES.md of my TIL repo
...
```

This is useful because I can then pipe it to another program, such as an `fzf`
command like [this repo selector that opens the selected one in the
browser](https://github.com/jbranchaud/dotfiles/commit/f964ca10c6c4db3475411c2991dc2f1dfd18c818).
