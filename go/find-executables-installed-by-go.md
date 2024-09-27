# Find Executables Installed By Go

When you install an executable using `go install`, it puts that executable in
the `bin` directory designated by the `GOBIN` environment variable. If that env
var isn't set, then it falls back to one of `$GOPATH/bin` or `$HOME/go/bin`.

When I run `go help install`, it tells me as much:

```
Executables are installed in the directory named by the GOBIN environment
variable, which defaults to $GOPATH/bin or $HOME/go/bin if the GOPATH
environment variable is not set.
```

So, if I am to install something like [`tern`](https://github.com/jackc/tern),

```bash
$ go install github.com/jackc/tern/v2@latest
```

it is going to place that binary in `~/go/bin` for me.

```bash
$ which tern
/Users/jbranchaud/go/bin/tern
```
