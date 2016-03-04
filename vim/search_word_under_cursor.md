#Search word under cursor

On Vim often I have to search on my project. To do this really easy I have
in my vimrc.

```viml
" Search with Ag word under cursor in all the project
nnoremap <leader>K :exe 'Ag' expand('<cword>')<cr>

" Search with Ag word under cursor file under app
nnoremap <leader>k :exe 'Ag' expand('<cword>') app/<cr>
```

It works perfectly.
