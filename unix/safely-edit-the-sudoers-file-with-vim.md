# Safely Edit The Sudoers File With Vim

The sudoers file is a way on Unix systems to administer various levels of
permissions to different users. It is important to make sure you "know what
you're doing" when editing this file. Especially so because if you mangle the
syntax of the file, you could lock out yourself and even the root user from
doing all kinds of things. Even from being able to update and fix this file.

Fortunately, there is a command—`visudo`—that opens the sudoers file in an
editor that will perform pre-save checks to ensure the file is valid syntax.

```bash
$ visudo
```

This command has `vi` in the name because it used to be that it would default
to `vi` as the editor. On Ubuntu, at the very least, this has changed and the
default is now `nano`.

If you'd like to still have `visudo` open to `vi` (or `vim`), you can specify
that with the `SUDO_EDITOR` env var.

```bash
$ SUDO_EDITOR=vim visudo
```

[source](https://manpages.ubuntu.com/manpages/impish/en/man8/visudo.8.html#environment)
