# Verbose Commits With Fugitive

Let's say you are using [fugitive.vim](https://github.com/tpope/vim-fugitive).
You've staged some changes within the git index buffer using `:Ge:` and now
you want to make a commit. From the git index buffer, you can hit `cvc` to
pop open the commit message window in verbose mode. The verbose part means
that all the staged changes are shown below as a reference for composing the
commit message.
