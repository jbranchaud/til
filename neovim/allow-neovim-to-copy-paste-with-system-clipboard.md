# Allow Neovim To Copy/Paste With System Clipboard

By default, Neovim uses some internal registers for managing the values that
have been copied (`y`) and what should be pasted (`p`). These registers are
independent from the system clipboard, so a value copied from the browser will
not show up when you hit `p` in Neovim (or Vim).

If you'd like to create a more seamless and cohesive copy/paste experience for
yourself, you can instruct Neovim to read from and write to the system
clipboard when copy/paste actions happen.

This is accomplished with a `provider` that instructs Neovim to use the system
clipboard directly for all copy/paste operations.

```vimscript
" ~/.vimrc
set clipboard+=unnamedplus
```

Setting the `clipboard` option to include `unnamedplus` enables that provider
"which transparently uses shell commands to communicate with the system
clipboard or any other clipboard 'backend'." So, for Mac, `pbcopy` and
`pbpaste`.

See `:h provider-clipboard` for more details.
