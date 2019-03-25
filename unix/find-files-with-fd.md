# Find Files With fd

The [`fd` command](https://github.com/sharkdp/fd) is an open-source utility
written in Rust. It is a fast and user-friendly way to find files -- as
compared to the standard `find` command.

You can recursively look in the current directory for a file with `git` in
the name like so:

```bash
$ fd git
```

If you have a `.gitignore` file, it will ignore those files and directories
by default.

Providing a second argument, `fd` will start its recursive search from that
directory.

```bash
$ fd git ~
```

Here, `fd` will look for filenames with `git` everywhere within my home
directory.

You can `brew install fd` to get the command and `man fd` for more details.
