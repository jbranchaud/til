# Quick Clojure Docs

Assuming you already have the
[`fireplace.vim`](https://github.com/tpope/vim-fireplace) plugin installed
and a repl running, you can quickly pull up the docs for any clojure
function. Navigate the cursor over the keyword in question and hit `K` in
normal mode. This will instruct `fireplace.vim` to use the `doc` function on
the symbol for that keyword. The docs associated with that keyword will be
displayed at the bottom of the window.
