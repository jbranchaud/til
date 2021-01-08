# Provide A Fallback Value For Unset Parameter

If you are using a value in a parameter expansion expression that isn't set,
the result will be empty.

For instance, the XDG paths are not defined for me on OSX.

```bash
$ echo "${XDG_CONFIG_HOME}"

```

To make a script more robust, you can provide a fallback value (i.e. [default
value](https://wiki.bash-hackers.org/syntax/pe#use_a_default_value)). The
parameter expansion will use the fallback value if the primary value is either
unset or null.

The syntax for this is to follow the primary parameter with `:-` and then the
fallback parameter.

```bash
$ echo "${XDG_CONFIG_HOME:-$HOME/.local/share}"
/Users/jbranchaud/.local/share
```

Because I'm on OSX, this expands to my `$HOME` directory with `/.local/share`
appended.

[source](https://unix.stackexchange.com/a/122848/5916)
