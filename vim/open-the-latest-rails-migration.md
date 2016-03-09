# Open The Latest Rails Migration

The [`rails.vim`](https://github.com/tpope/vim-rails) plugin comes with a
lot of handy helpers for quickly navigating to many parts of a Rails
project. Among these helpers is the `:Emigration` command that makes it easy
to tab complete and navigate to Rails migration files. Often times the
migration you want is the latest migration. There is no need for tab
complete here, just type:

```
:Emigration
```

By default this command opens the latest migration in a new buffer.

See `:h rails-:Emigration` for more details.
