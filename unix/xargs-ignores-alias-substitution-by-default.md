# xargs Ignores Alias Substitution By Default

I have a number of aliases set up in my shell's RC file. For instance, I use
`nvim` as my main editor, but because of muscle memory, I've aliased `vim` to
`nvim`.

```bash
❯ alias vim
vim=nvim
```

So, I was surprised when I ran the following `xargs` command.

```bash
❯ rg 'some pattern' -l | xargs vim
```

It opened the matching files in `vim` rather than `nvim`.

The reason for this is that `xargs` is a separate function that does not have
an internal concept of aliases that need to be substituted.

There is, however, a trick built in to `alias` that we can use. By leaving a
trailing space in an alias, we tell the shell to check for an alias
substitution to expand in the following word.

So, I can alias `xargs` to `'xargs '` and it will respect my `vim` alias.

```
❯ alias xargs='xargs '
```

[source](https://unix.stackexchange.com/a/244516/5916)
