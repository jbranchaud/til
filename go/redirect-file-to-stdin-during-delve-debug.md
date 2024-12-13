# Redirect File To Stdin During Delve Debug

I have a go program that accepts input from stdin. The way I've been running
the program as I develop it is to redirect the output of some sample files to
the program.

```bash
$ go run . < sample/001.txt
```

When I then go to debug this program with
[Delve](https://github.com/go-delve/delve), I'd still like to be able to
redirect a file into the program to reproduce the exact behavior I'm seeing.

The following won't work:

```bash
$ dlv debug . < samples/001.txt
Stdin is not a terminal, use '-r' to specify redirects for the target process or --allow-non-terminal-interactive=true if you really want to specify a redirect for Delve
```

Fortunately, `dlv` sees what I'm trying to do and makes a recommendation. The
`-r` flag can be used to specify redirects for the target process. The [`dlv`
redirect
docs](https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_redirect.md)
explain that `-r` can be passed a `source:destination`. The `source` is `stdin`
by default, but can also be `stdout` and `stderr`.

I can redirect my file into the debugging session of my program like so:

```bash
$ dlv debug . -r stdin:samples/001.txt
```

Or even more succinctly:

```bash
$ dlv debug . -r samples/001.txt
```
