# Ignore The Alias When Running A Command

I have a number of shell aliases set up to override one command with another.
For instance, I want to run `bat` anytime I type `cat`, so I have `alias
cat=bat` in my shell configuration.

But what if I were to ever want to run `cat` instead of `bat`?

Aliases can be ignored several ways:

1. Precede the command with a backslash.

```bash
$ \cat
```

2. Wrap the command in quotes.

```bash
$ 'cat'
```

3. Pass the command to `command`.

```bash
$ command cat
```

[source](https://unix.stackexchange.com/questions/39291/run-a-command-that-is-shadowed-by-an-alias)
