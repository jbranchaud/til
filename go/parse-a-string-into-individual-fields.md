# Parse A String Into Individual Fields

Let's say you're reading in data from a file or otherwise dealing with an
arbitrary string of data. If that string has a series of values separated by
whitespace, you can parse it into individual fields with
[`strings.Fields`](https://pkg.go.dev/strings#Fields).

```go
import (
	"fmt"
	"strings"
)

func main() {
	data := "3 5 2 6 7 1 9"
	fields := strings.Fields(data)

	fmt.Printf("Fields: %v", fields)
	// [3 5 2 6 7 1 9]
}
```

Here is another example where we can see that `strings.Fields` deals with
multiple whitespace and surrounding whitespace:

```go
import (
	"fmt"
	"strings"
)

func main() {
	data := "  go  java c++ rust "
	fields := strings.Fields(data)

	fmt.Printf("%v", fields)
	// [go java c++ rust]
}
```
