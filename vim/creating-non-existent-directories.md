# Creating Non-Existent Directories

When creating new files from within vim, using `:e`, you may find yourself
creating that file in a directory that doesn't yet exist. Vim will tell you
as much if you then try to save that file. To get around this, I have often
shelled out with `:!mkdir %:h`. This is a bit awkward to type though.

The [`vim-eunuch`](https://github.com/tpope/vim-eunuch) plugin comes with a
handy command for this. `:Mkdir` will create the parent directory for the
current buffer. If you're in a situation where multiple levels of the
buffer's directory don't exist, you can use `:Mkdir!` which will invoke
`mkdir` with the `-p` flag.
