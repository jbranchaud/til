# Shortcuts in insert mode

If you're curious about Vim. Very often you will learn that the help from vim is one of the best in any software.

I've submitted a challenge on [vimgolf](http://www.vimgolf.com/challenges/57343555fd77ad227900df4a) and get some nice proposals.

The ones without lot's of keystrokes are using `<C-O>` and `<C-@>`. I've search on the vim help `:help i_CTRL-@` or `:help i_CTRL-O` and get this

```
CTRL-@		Insert previously inserted text and stop insert.  {Vi: only when typed as first char, only up to 128 chars}
CTRL-A		Insert previously inserted text.  {not in Vi}
CTRL-O		execute one command, return to Insert mode   *i_CTRL-O*
```

`CTRL-O` is particularly useful when you want to past a text (you can also use `CTRL-R "` if you want to past test from your clipboard).
