# Searching For Hex Digits

If you want to find sequences of hex digits (`A-F`, `a-f` and `0-9`) in a
search, you can hack together something like:

```
/[A-Fa-f0-9]\+
```

This is a bit verbose, though. Vim has a number of built in character
classes that can be referenced in searches and substitutions. For hex
digits, there is `\x`. Using this, the search above can be achieved with:

```
/\x\+
```

See `:h \x` for more details and other character classes.
