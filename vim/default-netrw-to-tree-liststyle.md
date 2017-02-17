# Default netrw To Tree Liststyle

The built-in `netrw` plugin is a great way to browse files and directories
within a Vim session. `netrw` supports four ways of displaying files and
directories. That is, there are four liststyles. You can toggle through
these by hitting `i`.

I prefer the tree liststyle, which is not the default. I can set the tree
liststyle as the default by adding the following line to my `.vimrc` file.

```vimscript
let g:netrw_liststyle = 3
```

Now, every time I visit or revisit a `netrw` window, I'll see everything
nicely displayed as a tree.
