# Select Several Results From An FZF Search

When performing a fuzzy search in Vim with
[FZF](https://github.com/junegunn/fzf.vim), you likely get a mix of results
you care about and results that are just noise. FZF allows you to narrow
down to just the results you care about. Move the cursor over each result of
interest and hit tab. Little red arrows will show next to each item you have
selected.

![multi-select with fzf](https://i.imgur.com/6nJY5Ik.png)

When you are done hit enter. Each result will be opened as a separate
buffer. You can then navigate between them using your preferred method of
moving between buffers -- i.e. `:bnext` and `:bprev`.
