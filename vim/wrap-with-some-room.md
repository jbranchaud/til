# Wrap With Some Room

The [surround.vim](https://github.com/tpope/vim-surround) plugin allows
you to wrap text objects with various surrounding characters
(e.g. `( )`, `{ }`, `" "`).
If you have a visual selection on `1 2 3 4 5` and type `S]` you will get:

```
[1 2 3 4 5]
```

That works, but if you prefer a more readable version with some extra
breathing room, you can make the visual selection and hit `S[` which will
stick a space on either end:

```
[ 1 2 3 4 5 ]
```

Now, if you already have some text wrapped in square braces, like the
first example, and you want to convert it to the more spacious second
example, you can do a *change surround* command followed by hitting the
open square brace twice (that is, `cs[[`) which will convert
`[1 2 3 4 5]` to `[ 1 2 3 4 5 ]`.
