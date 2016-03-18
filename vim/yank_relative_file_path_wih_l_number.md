# Yank relative file path with line number

Sometimes I want to give quickly line number number and current file path to
my colleague, rspec or rubocop.

For that you can use the command [expand](http://vimdoc.sourceforge.net/htmldoc/eval.html#expand()).

To give a try do `:echom expand("%:h")`. Then you can combinate modifiers to
get wat you want and add it to the `+` yank key.

```viml
:let @+=expand("%:h") . '/' . expand("%:t") . ':' . line(".")
```

Now `<y + +>` should give you what you want.

