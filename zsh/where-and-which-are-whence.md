# Where And Which Are Whence

I was recently watch some of the commands being run by an AI agent in a coding
harness. One in particular caught my attention because it wasn't one I was
familiar with. It was the command `whence`.

The `man zshbuiltins` describe `whence` like so:

> For each name, indicate how it would be interpreted if used as a command name.

I'd describe it myself as a utility for surfacing what a given command name
corresponds to when it gets executed. For instance, when run against the name
`cat` in my local setup, I see `bat` which is explained by the alias I set up.

```bash
❯ whence cat
bat
```

There are several flags that can be used with `whence`. The underlying behavior
for `whence` is what is also used for more familiar commands like `where` and
`which`.

```
where [ -wpmsS ] [ -x num ] name ...
        Equivalent to whence -ca.

which [ -wpamsS ] [ -x num ] name ...
        Equivalent to whence -c.
```

I can get a clearer answer that `cat` is an alias with `-c`.

```bash
❯ whence -c cat
cat: aliased to bat
```

And with `-ca`, I can see that `cat` resolves several different times on the
path with the alias to `bat` taking precedence over all of that.

```bash
❯ whence -ca cat
cat: aliased to bat
/bin/cat
/bin/cat
/bin/cat
/bin/cat
/bin/cat
/bin/cat
```

The other command that uses the underlying `whence` functionality is `type`.

```
type [ -wfpamsS ] name ...
        Equivalent to whence -v.
```

See `man zshbuiltins` for more details. There are more flags which can be used
to get additional info.
