# The Black Hole Register

Vim has a variety of registers for storing and moving around text. Vim also
has a special register called the *black hole register*. This black hole
register is associated with the `_` character.

> When writing to this register, nothing happens.  This can be used to delete
> text without affecting the normal registers.  When reading from this register,
> nothing is returned.

As stated in the docs, if you don't want to overwrite the unnamed register or
some other register when deleting text, you can use the black hole register.
For instance, deleting the current line without any register side-effects
looks like this:

```
"_dd
```

See `:h registers` for more info on Vim's registers.
