# List autocmds Configured For The Current Buffer

Vim itself and many of the plugins you use will configure `autocmd` triggers.
This are commands that get executed when a certain editor event takes place in
certain types of files.

A common example is having a tool like `prettier` configured to format the
contents of JavaScript files when the `BufWritePost` event happens, that is,
right after the buffer gets written.

You can list each `autocmd` that is configured for your current buffer using
`:au` and a couple arguments.

```
:au * <buffer>
```

The `*` says match against all events. The `<buffer>` filters them down to just
what is configured for the current buffer.

If you just wanted to know about `BufWritePost` events for the current buffer,
try this.

```
:au BufWritePost <buffer>
```

Or if you want to know about buffer number `4`:

```
:au BufWritePost <buffer=4>
```

See `:h :au` for more details.
