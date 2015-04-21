# Preventing Typos with Abbreviations

Are you are prone to mistyping *the* as *teh* or *function* as *funciton*?
You can add one-line abbreviations to your `.vimrc` file to auto-correct
these mistakes for you.

```
abbr teh the
abbr funciton function
```

By adding these (or others) to your vim configuration, whenever you type
the misspelled version, vim will know to instantly replace it with the
correct version. This can be handy, but use it sparingly.
