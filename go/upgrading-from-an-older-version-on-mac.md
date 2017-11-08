# Upgrading From An Older Version On Mac

To upgrade from an older version on Mac, there are a couple manual steps
that you need to take. For starters, download the latest installer for Mac
from [Go Lang Downloads](https://golang.org/dl/).

While this is downloading, you'll need to delete the older version of Go
that is installed on your machine.

First, remove the existing Go installation directory:

```bash
$ sudo rm -rf /usr/local/go
```

Second, clean up the Go `bin` directory from your `PATH` environment
variable:

```bash
$ sudo rm /etc/paths.d/go
```

Now, you can double click on the downloaded installer dmg and follow the
prompt instructions.

When its all said and done, check `go version` from the command line to see
that you are now working with the latest.
