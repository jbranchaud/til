# Open The Fugitive Git Summary Window

The [`vim-fugitive` plugin](https://github.com/tpope/vim-fugitive) can show a
git summary window that is "akin to git-status". There are two ways to open up
this window.

The short-hand way of doing this is with `:G` (or `:Git`) with no arguments.
For me, this opens the `fugitive-summary` in a split.

The other way is with the `:Gedit` command. This command can take a variety of
arguments, and when you pass it `:` as an argument, it will open a window with
the `fugitive-summary` (i.e. `:Gedit :`).

I tend to short-hand this as `:Ge:`.

See `:h fugitive-summary` and `:h fugitive-object` for more details on this.

[source](https://www.youtube.com/watch?v=rzUMjqD6NMQ)
