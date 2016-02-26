# Close All Other Windows

Opening split windows can be useful in a number of circumstances. Eventually
though, you are going to want to go back to just one window. Generally when
this happens to me, I navigate to each of the other split windows that I
don't want and execute `:q`. What I want to do is essentially close all the
other split windows except for my current one. Vim provides a single command
for doing this. By hitting

```
<CTRL>w <CTRL>o
```

all other windows are closed leaving the current window as the only one on
the screen.

If you want this command to be able to work with windows containing modified
buffers, you are going to want to have the `hidden` option turned on.

See `:h CTRL-W_CTRL-O` for more details.
