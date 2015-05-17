# Viewing Man Pages with man.vim

In [Quick Man Pages](quick-man-pages.md), I introduced `K` which shells
out to the man page for the unix command under the cursor. It gets better
though. Vim has a built-in plugin, `man.vim`, that you can enable which
allows you to view man pages without shelling out.

Add the following to your `.vimrc` file

```vimscript
runtime! ftplugin/man.vim
" grep
```

Then save it and re-source the configuration with `:source %`.

With the `man.vim` plugin enabled, you can now move your cursor over the
word `grep` and hit `<leader>K` which will pop open the man page for `grep`
in a unnamed, split buffer.

Not only does this prevent context-switching when viewing a man page, but it
also gives you the full power of vim over the content of the man page. You
can search, you can yank text, or you can even pop open the man page for
another command.

See `:h ft-man-plugin` for more details.
