# Check For An Executable

Sometimes Vim needs to reach outside of itself to use an existing program.
For example, wiring up [auto-formatting of JavaScript
code](https://hashrocket.com/blog/posts/writing-prettier-javascript-in-vim)
requires Vim to call out to the
[`prettier`](https://github.com/prettier/prettier) binary.

We want our `.vimrc` files and plugins to, generally, be as portable as
possible. What happens if you haven't yet installed a particular program?
Vim will likely experience a runtime exception. One way to get around this
is to check for the presence of that program on the path. If it isn't there,
don't do the thing. We can use the `executable()` function for this.

```vimscript
if executable('prettier')
  ...
endif
```

It will return `1` (true) if `prettier` is an executable on the path,
otherwise it will return `0` (false).

See `:help executable()` for more details.
