# Split Different

Vim's defaults for `:split` and `:vsplit` are to open the splits above and
to the left, respectively. I prefer for them to the split below and to the
right, respectively. To get `:split` to split below:

```
:set splitbelow
```

and to get `:vsplit` to split to the right:

```
:set splitright
```

Add those two lines to your `.vimrc` to have them set that way all the time.

If you have them set as such in `.vimrc` and want to temporarily revert the
setting for the current file, type:

```
:set nosplitbelow
```

or

```
:set nosplitright
```

as commands.
