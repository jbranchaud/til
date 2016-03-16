# Silently redo ctags

Sometimes I'm adding a lot of new methods on rails project and I want to jump
quickly on the wanted method with ctags.

For that I need to have ctags up-to-date. I'm using a very simple shell 
command to that that I'm calling from vim silently.

```viml
" Ctags the project silently
nnoremap <leader>ct :silent ! ctags -R --languages=ruby --exclude=.git --exclude=log -f .tags<CR>
```

It's not the best. I know some people a using git hook to do that. Feel free
to comment this tips.
