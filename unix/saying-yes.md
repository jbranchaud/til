# Saying Yes

Tired of being prompted for confirmation by command-line utilities? Wish you
could blindly respond 'yes' to whatever it is they are bugging you about?
The `yes` command is what you've been looking for.

```
$ yes | rm -r ~/some/dir
```

This will respond `y` as `rm` asks for confirmation on removing each and
every file in that directory.

`yes` is just as good at saying *no*. Give it `no` as an argument and it
will happily (and endlessly) print `no`.

```
$ yes no
```

h/t [Chris Erin](https://twitter.com/MCNormalMode)
