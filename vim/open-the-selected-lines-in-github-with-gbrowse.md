# Open the Selected Lines In GitHub With GBrowse

The [`vim-fugitive`](https://github.com/tpope/vim-fugitive) plugin comes with
the `:Gbrowse` command.

> Open the current file, blob, tree, commit, or tag in your browser at the
> upstream hosting provider.  If a range is given, it is appropriately appended
> to the URL as an anchor.

I would try this from repositories hosted on GitHub and get an error. Reading a
bit further into the `:Gbrowse` documentation I can see why.

> Upstream providers can be added by installing an appropriate Vim plugin.  For
> example, GitHub can be supported by installing rhubarb.vim, available at
> <https://github.com/tpope/vim-rhubarb>.

I was missing the [`vim-rhubarb` plugin](https://github.com/tpope/vim-rhubarb).
After installing that, I can open the current file in GitHub by running
`:Gbrowse`.

If I make a visual selection of any number of lines, then I can go into command
mode again typing out `Gbrowse` with the automatically preceding visual
selection tags. This will open the file on GitHub with those lines selected.

```
:'<,'>Gbrowse
```
