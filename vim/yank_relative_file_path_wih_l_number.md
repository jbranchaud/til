# Yank relative file path with line number

Sometimes I want to give quickly line number number and current file path to
my colleague, rspec or rubocop.

For that you can use the command [expand](http://vimdoc.sourceforge.net/htmldoc/eval.html#expand()).

To give a try do `:echo expand("%")`. Then you can combinate modifiers to
get wat you want and add it to the `+` yank key. I also use [join](http://vimhelp.appspot.com/eval.txt.html#join%28%29) to join 
characters in my scenario.

```viml
:let @+=join([expand('%'),  line(".")], ':')
```

Now `<y + +>` should give you what you want.


EDIT : Easiest version because of [vi.stackexchange.com answer](http://vi.stackexchange.com/questions/6923/yank-current-file-path-and-line-number-into-system-clipboard/6925#6925).

