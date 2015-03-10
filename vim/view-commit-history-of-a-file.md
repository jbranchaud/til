# View Commit History of a File

[Gitv](https://github.com/gregsexton/gitv) is an extension of the
[Fugitive](https://github.com/tpope/vim-fugitive) plugin that allows you to
view and step through the commit history of a file (among other things).

Open a file in Vim and enter the `:Gitv!` command to open a preview window
listing the commits involving the current file. It will look something like
this:

```
-- [plugin/fugitive.vim] --
*  (HEAD, r:origin/master, r:origin/HEAD, master) Provide g:fugitive_no_maps to disable key maps  4 weeks ago            Fedor Gusev    [0095769]
*  Support browsing with new netrw.vim                                                            2 weeks ago            Eli Young      [e8b9409]
*  Support for browsing with recent Vim                                                           4 weeks ago            Tim Pope       [eb8eb18]
*  s:Diff: use winnr with `<C-W>w` instead of `<C-W>p`                                            6 weeks ago            Daniel Hahler  [933f6a1]
*  (tag: t:v2.2) fugitive.vim 2.2                                                                 7 weeks ago            Tim Pope       [3471901]
*  Use `<nomodeline>` with Fugitive autocmds, and un-silent them                                  4 months ago           Daniel Hahler  [2c8461d]
*  Make configured_tree a caching global function                                                 4 months ago           John Whitley   [d3b98d9]
*  Fix instaweb support                                                                           4 months ago           Tim Pope       [5699f46]
*  Fix :Glog                                                                                      6 months ago           Tim Pope       [0374322]
```

You can skim over these commits and when one looks interesting, just hit
`enter` when your cursor is over its respective line to view the file as it
was at the time of that commit.

Restore your buffer to its original state by navigating to the top of the
preview and hitting `enter` for the filename on the first line.

This tool is great for use in a team setting when you want to figure out
what changes a file has undergone recently, especially when something about
a file seems a little fishy. This is also great for individual and team use
when you simply cannot remember why you changed a file or what it used to
look like before that *clever* refactoring.
