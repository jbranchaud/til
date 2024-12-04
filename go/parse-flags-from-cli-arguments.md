# Parse Flags From CLI Arguments

Though we can grab the arguments to a Go program from `os.Args`, it requires
some manual parsing. With the built-in `flag` package, we can declare specific
flags our program accepts, by type. When we parse them, they will be separated
out from the rest of the positional arguments.

Here is an example of the program that accepts a boolean `debug` flag. This
will work with either `-debug` or `--debug`.

```go
package main

import (
	"flag"
	"fmt"
	"os"
)

func main() {
	var debug bool
	flag.BoolVar(&debug, "debug", false, "turns on debug mode, extra logging")
	flag.Parse()

	positionalArgs := flag.Args()

	if len(positionalArgs) < 1 {
		fmt.Println("Please specify which part to run: 1 or 2")
		os.Exit(1)
	}

	if debug {
		fmt.Println("We are in debug mode...")
		fmt.Println("Received the following argument:", positionalArgs[0])
	}

	// ...
}
```

We can run the program in debug mode like so:

```bash
$ go run . --debug 123
We are in debug mode...
Received the following argument: 123
```

We can also take advantage of the `help` flag that we get for free:

```bash
$ go run . --help
Usage of /var/folders/62/lx9pcjbs1zbd83zg6twwym2r0000gn/T/go-build3212087168/b001/exe/test:
  -debug
        turns on debug mode, extra logging
```

Note: any recognized flags need to come before any of the position arguments.
The `debug` flag won't be picked up if we run the program like this:

```bash
$ go run . 123 --debug
```

[source](https://pkg.go.dev/flag)
