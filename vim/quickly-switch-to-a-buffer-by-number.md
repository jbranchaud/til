# Quickly Switch To A Buffer By Number

There are a number of different commands you can use for switching to a
buffer by its number. For example, if you want to switch to the buffer
assigned `7`, you can do `:7b` or `:e #7`. However, there is a quicker way
than typing out either of those commands.

You may already be familiar with `CTRL-^` for switching to the _alternate
file_ which is generally the previous buffer. If you precede that command
with a number, you will switch to the buffer with that number instead of the
alternate file.

From normal mode

```vimscript
7 Ctrl-^
```

will switch to buffer `7`.

See `:h Ctrl-^` for more details.
