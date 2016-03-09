# Don't open the first result when searching with Ag.vim

It's simple. Just add a bang after `Ag` like `Ag!`

For my tips called '[Search word under cursor with Ag](vim/search_word_under_cursor.md)' I have something like this now :

```viml
" Search with Ag word under cursor in all the project
nnoremap <leader>K :exe 'Ag!' expand('<cword>')<cr>

" Search with Ag word under cursor file under app
nnoremap <leader>k :exe 'Ag!' expand('<cword>') 'app'<cr>
```
