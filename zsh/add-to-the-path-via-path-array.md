# Add To Path Via Path Array

Typically when managing what is on your path in a Unix shell environment, you
override the `PATH` environment variable with `export`. This is usually an
append or prepend to bring along the existing path entries.

```bash
$ export PATH="$PATH:/Users/me/.local/bin"
```

The `zsh` shell environment exposes another way of adding to your path. They
have a `path` array which can be a little easier to work with since you can use
an array operation instead of string interpolation.

Here is how we'd do the same as above:

```bash
$ path+=/Users/me/.local/bin
```

This works because there is an automatic linking in zsh between arrays and
colon-separated strings (_scalars_).
[source](https://www.zsh.org/mla/users//2005/msg01132.html)

[source](https://superuser.com/a/1447959)
