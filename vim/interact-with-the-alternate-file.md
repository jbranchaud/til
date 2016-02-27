# Interact With The Alternate File

If you have a couple buffers going in a Vim session and you check out the
buffer list with `:ls`, you'll notice that one of those buffers has a `#`
indicator next to it. That means the file for this buffer is considered the
alternate file of the current, visible buffer. In addition to hitting
`CTRL-^` to switch to that buffer, you can reference it in other commands
with `#`. This means you can quickly `:edit`, `:split`, `:vsplit`, and so
forth the alternate file by just giving `#` as the argument to those
commands.

Quickly open the alternate file in a vertical split with:

```
:vsp #
```

See `:h alternate-file` for more details.
