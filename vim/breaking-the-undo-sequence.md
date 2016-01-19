# Breaking The Undo Sequence

Generally, the sequence of undo-able actions is segmented by command. When
entering Insert mode, everything typed until exiting Insert mode is part of
a single undo-able segment. If you are going to be typing in Insert mode for
a while though, you may want to break it up a bit. Without leaving Insert
mode, hit `ctrl-g u` to mark a break in the sequence of undos.

For example, starting in Normal mode and then typing
`iabc<CTRL-G>udef<CTRL-G>ughi<ESC>` will leave the buffer with:

```
abcdefghi
```

Hitting `u` once will leave the buffer with:

```
abcdef
```

Hitting `u` again:

```
abc
```

Hitting `ctrl-r`:

```
abcdef
```

See `:h i_CTRL-G_u` for more details.
