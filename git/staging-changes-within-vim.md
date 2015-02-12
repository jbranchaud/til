# Staging Changes Within Vim

I've always used git from the command line, but only recently have I started
to leverage [fugitive.vim](https://github.com/tpope/vim-fugitive) to more
quickly do some common git commands from within vim.

I mostly use *fugitive* to stage changes for committing. To stage entire
files, you can view the repository status, `:Gstatus`, and then navigate up
and down (`k` and `j`) tapping `-` next to the files to be staged (or
unstaged).

I've started to use git's interactive mode for staging changes from the
command line (`git add --patch`) more and more and recently wondered if the
same thing can be accomplished with *fugitive*.

It turns out it's pretty simple to do so. Instead of tapping `-` next to a
file you want to stage, you can tap `p` next to it and you will be
immediately dropped into interactive mode for that file. Prepare the lines
you want to stage (or, again, unstage) and save.
