# Case-Aware Substitution With vim-abolish

Substitution in vim is, by default, case-sensitive. Adding the `i` `s-flag`
makes it case-insensitive.
[`vim-abolish`](https://github.com/tpope/vim-abolish), on the other hand, lets
you perform a case-insensitive substitution that preserves three case
variants (foo, Foo, and FOO). Substitution with `vim-abolish` can be
performed with `Subvert` or `S`.

For instance, `:%S/blog/article/g` will turn

```
blog Blog bLOg BLOG
```

into

```
article Article bLOg ARTICLE
```

Install `vim-abolish` and see `:h Subvert` for more details.
