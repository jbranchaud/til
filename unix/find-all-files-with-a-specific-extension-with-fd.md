# Find All Files With A Specific Extension With fd

The best way with [`fd`](https://github.com/sharkdp/fd) to match on files with
a specific extension is to use the `-e` flag.

Here is how you'd find all `.ts` files:

```bash
$ fd -e ts
```

You can use the flag multiple times to specify multiple file extensions. This
will turn up all TypeScript and JavaScript files:

```bash
$ fd -e ts -e js
```

Alternatively, you can use regex in the filename pattern to match on several
file extensions like so:

```bash
$ fd '.*\.(js|ts|jsx|tsx)$'
```
