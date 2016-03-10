# Quickly remove the quickfix window

Very often I have one quickfix window open for Rubocop.vim or Ag.vim results.
To avoid to move inside the window and close it by pressing `q` I'm using this
shortcut mapped to the leader key.

```viml
" Close the quickfix window
noremap <Leader>e :ccl <bar> lcl<CR>
```

It seems it close only one quickfix window but that's enought for me.
