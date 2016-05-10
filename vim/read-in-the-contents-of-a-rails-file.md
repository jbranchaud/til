# Read In The Contents Of A Rails File

The [`rails.vim` plugin](https://github.com/tpope/vim-rails) allows you to
quickly navigate to specific types of files with the `E` prefix. For
instance, `:Emodel` will scope you to just the models directory.

You can use this same approach with the `D` prefix. Instead of navigating to
the specified file though, this will read in the contents of that file into
the current buffer.

Do you need to copy and tweak the contents of a similar view? Open up your
new view file (e.g. `:Eview posts/edit.html.erb`) and then enter `:Dview
posts/new` to quickly copy in its contents.

h/t Josh Davey
