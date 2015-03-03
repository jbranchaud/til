# Rename Current File

Vim doesn't come with an easy way to rename the existing, current file. The
closest you will get with a one-off command is `:saveas {new file name}`
which renames the current buffer, but also leaves you with your old file.

Another approach that you can take is to chain two commands together. You
can start be *deleting* the current file (don't worry, you've still got the
file contents in your buffer) and then *saving* the buffer with the new
name. Like so:

```
:call delete(expand('%')) | saveas new-file-name.txt
```

While this seems to do the job well enough, your mileage may vary.
Consider using a more robust plugin, such as
[vim-eunuch](https://github.com/tpope/vim-eunuch) or
[rename.vim](https://github.com/danro/rename.vim/blob/master/plugin/rename.vim).
