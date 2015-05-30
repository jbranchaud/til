# Incremental Searching

You can do a text-based search on the contents of your current buffer by
hitting `/` and then beginning to type a pattern (including regex). The
`incsearch` feature makes searching for text even easier. As you type your
pattern, the first valid match will be located and highlighted. As you
continue to type the pattern, it will continue to update the highlighted
match. Incremental searching makes it easy to see when you've made
a typo in your pattern. By default `incsearch` is turned off in Vim. You
can enable it with `:set incsearch`.

See `:h incsearch` for more details.
