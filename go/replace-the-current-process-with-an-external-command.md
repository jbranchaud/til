# Replace The Current Process With An External Command

Go's `syscall.Exec` function can be used to execute an external program.
Instead of forking a child process though, it runs the external command in
place of the current process. You need to give the function three pieces of
information: the location of the binary, the pieces of the command to be
executed, and relevant environment. Here is a simple example.

```go
package main

import "fmt"
import "os"
import "syscall"

func main() {
    // get the system's environment variables
    environment := os.Environ()

    // get a slice of the pieces of the command
    command := []string{"tmux", "new-session", "-s", "burrito"}

    err := syscall.Exec("/usr/local/bin/tmux", command, environment)
    if err != nil {
        fmt.Printf("%v", err)
    }
}
```

When this program is executed, it will replace itself with a new tmux
session named *burrito*.
