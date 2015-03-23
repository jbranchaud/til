# NETRW Listing Styles

When you edit a directory with vim (`vim .`), you are taken into netrw which allows
you to explore the contents of that directory. By default, you will see a
list of the files and directories in the target directory, like so:

```
" ============================================================================
" Netrw Directory Listing                                        (netrw v151)
"   /Users/jbranchaud/code/til
"   Sorted by      name
"   Sort sequence: [\/]$,\<core\%(\.\d\+\)\=\>,\.h$,\.c$,\.cpp$,\~\=\*$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$
"   Quick Help: <F1>:help  -:go up dir  D:delete  R:rename  s:sort-by  x:special
" ==============================================================================
../
./
.git/
git/
go/
postgres/
rails/
ruby/
vim/
zsh/
LICENSE
README.md
```

This (`thin`) is only one of a few listing styles that you can use to explore a
directory. The other styles are `long`, `wide`, and `tree`. You can cycle
between them by pressing `i`. For instance, if you cycle through to the `tree`
format, you will be presented with navigable tree structure like so:

```
" ============================================================================
" Netrw Directory Listing                                        (netrw v151)
"   /Users/jbranchaud/code/til/git
"   Sorted by      name
"   Sort sequence: [\/]$,\<core\%(\.\d\+\)\=\>,\.h$,\.c$,\.cpp$,\~\=\*$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$
"   Quick Help: <F1>:help  -:go up dir  D:delete  R:rename  s:sort-by  x:special
" ==============================================================================
../
til/
| .git/
| git/
| | checkout-previous-branch.md
| | delete-all-untracked-files.md
| | dry-runs-in-git.md
| | intent-to-add.md
| | staging-changes-within-vim.md
| | stashing-untracked-files.md
| | verbose-commit-message.md
| go/
| postgres/
| rails/
| ruby/
| | create-an-array-of-stringed-numbers.md
| | limit-split.md
| | parallel-bundle-install.md
| | summing-collections.md
| vim/
| zsh/
| LICENSE
| README.md
```

[source](http://vimdoc.sourceforge.net/htmldoc/pi_netrw.html)
