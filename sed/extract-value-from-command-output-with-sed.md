# Extract Value From Command Output With Sed

As part of a shell script, you may need to extract a value from one command to
be used as part of a subsequent command.

For instance, [I recently wrote a
script](https://gist.github.com/jbranchaud/3cda6be6e1dc69c6f55435a387018dac)
that needed to determine the version of the currently running Postges server.
The `postgres` command can tell me that.

```bash
$ postgres -V
postgres (PostgreSQL) 12.3
```

However, the output includes extra fluff that I don't need, namely the leading
`postgres (PostgreSQL) ` part.

The output of `postgres` can be piped into a `sed` command that can extract
just what I need.

```bash
$ postgres -V | sed -n 's/postgres (PostgreSQL) \(.*\)/\1/p'
12.3
```

The `sed` command receives this single line of output and attempts a
substituation. It matches on `postgres (PostgresSQL) ` followed by a capture
group (`\(.*\)`) for the remaining characters. This capture group matches the
version part of the output. `sed` replaces everything in the first part of the
substitution with `\1`, which is `12.3`, and outputs that.

The output of this could then be piped to another command or captured in a
variable to be used in the remainder of a script.

[source](https://stackoverflow.com/a/24572880/535590)
