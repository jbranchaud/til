# Swap Occurrences Of Two Words

Imagine I have a file with `foo` and `bar` all over the place. The tables
have turned and now I want all occurrences of `foo` to be `bar` and all
occurrences of `bar` to be `foo`.

Reaching for a simple substitution won't work because after flipping all the
occurrences of `foo` to `bar`. I will no longer be able to distinguish
between the new `bar`s and the `bar`s that need to be flipped.

[Abolish.vim](https://github.com/tpope/vim-abolish) enhances Vim's
substitution capabilities making it easy to flip these strings in one
relatively simple command.

```
:%S/{foo,bar}/{bar,foo}/g
```

Notice the uppercase `S` as well as the ordering of `foo` and `bar` in the before
and after sequences.
