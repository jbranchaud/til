# Almost The End Of The Line

If you are visually selecting from the cursor to the end of the line, you
will probably hit:

```
v$
```

This isn't always ideal though because the visual selection includes the
newline character at the end of the line. If instead you'd like to select to
the last non-blank character on the line you can use the `_g` motion. This
is great for deleting to the end of the line.

```
dg_
```

See `:h g_` for more details.

h/t Dorian Karter
