# Specify App When Opening From Command Line

When you `open` files from the command line

```bash
$ open README.md
```

the default app for that filetype will be used. For me, `README.md` will be
opened in VS Code.

If you have a different app in mind, you can specify it using the `-a` flag:

```bash
$ open README.md -a Notes
```

This will open `README.md` in Mac's Notes app.

See `man open` for more details.
