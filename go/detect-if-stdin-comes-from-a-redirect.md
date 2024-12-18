# Detect If Stdin Comes From A Redirect

Reading lines of input from `stdin` is flexible. And we may need our program to
behave differently depending on where that input is coming from. For instance,
if data is redirected or piped to our program, we scan and process it directly.
Otherwise, we need to prompt the user to enter in specific info and go from
there.

We can detect whether [`os.Stdin`](https://pkg.go.dev/os#pkg-variables) is
being piped to, redirected to, or whether we should prompt the user by looking
at the file mode descriptor of
[`os.Stdin.Stat()`](https://pkg.go.dev/os#File.Stat).

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	file, err := os.Stdin.Stat()
	if err != nil {
		fmt.Printf("Error checking stdin: %v\n", err)
		os.Exit(1)
	}

	fromTerminal := (file.Mode() & os.ModeCharDevice) != 0
	fromAPipe := (file.Mode() & os.ModeNamedPipe) != 0

	if fromTerminal {
		fmt.Println("This is Char Device mode, let's prompt user for input")
		termScanner := bufio.NewScanner(os.Stdin)
		for termScanner.Scan() {
			fmt.Printf("- %s\n", termScanner.Text())
			break;
		}
	} else if fromAPipe {
		fmt.Println("This is Named Pipe mode, contents piped in")
		pipeScanner := bufio.NewScanner(os.Stdin)
		for pipeScanner.Scan() {
			fmt.Printf("- %s\n", pipeScanner.Text())
		}
	} else {
		fmt.Println("This means the input was redirected")
		redirectScanner := bufio.NewScanner(os.Stdin)
		for redirectScanner.Scan() {
			fmt.Printf("- %s\n", redirectScanner.Text())
		}
	}
}
```

If `os.ModeCharDevice` then we are connected to a character device, like the
terminal. We can see if input is being piped in by checking against
`os.ModeNamedPipe`. Otherwise, there are a variety of file modes and I'm
willing to assume we're dealing with a regular file redirect at that point.
