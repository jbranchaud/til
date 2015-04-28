# Single Key Presses in Interactive Mode

When staging changes in interactive mode (`git add -p`), you have a number
of options associated with single keys. `y` is *yes*, `n` is *no*, `a` is
*this and all remaining*, and so on.

By default, you have to press *enter* after making your selection. However,
it can be configured for single key presses. Add the following to your git
configuration file to enable single key presses for interactive mode:

```
[interactive]
    singlekey = true
```

[source](https://github.com/hashrocket/dotmatrix/blob/master/.gitconfig#L33-L34)
