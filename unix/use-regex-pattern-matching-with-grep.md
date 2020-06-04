# Use Regex Pattern Matching With Grep

The `grep` command supports perl-flavored regular expression pattern matching.
Rather than grepping for specific words, you can use regex with grep to find
patterns throughout a text or command output.

As an example, I can list all Ruby versions available for install with
[`asdf`](https://github.com/asdf-vm/asdf) using the following command.

```bash
$ asdf list-all ruby
```

This produces a ton of lines of output including versions of `jruby` and
`truffleruby`.

I can use grep to filter this list down to the MRI versions which all start
with a digit (e.g. `2.6.5`).

```bash
$ asdf list-all ruby | grep "^[[:digit:]]"
```

That regex says, find all lines that begin (`^`) with a number (`[[:digit:]]`).
This means grep will filter down the output to things like `1.9.3-p551`,
`2.6.5`, and `2.7.0-preview2` whereas it will exclude `truffleruby-19.0.0` and
`jruby-9.2.9.0`.

[source](https://www.digitalocean.com/community/tutorials/using-grep-regular-expressions-to-search-for-text-patterns-in-linux)
