# Combine Two Slices

The `append` function can be used to create a new slice with the contents of
the given slice and one or more items added to the end.

We can add one or more items like so:

```go
s1 := []int{1, 2, 3, 4}
s2 := append(s1, 5)
s3 := append(s2, 6, 7, 8)

fmt.Println(s1) //=> [1 2 3 4]
fmt.Println(s2) //=> [1 2 3 4 5]
fmt.Println(s3) //=> [1 2 3 4 5 6 7 8]
```

But what if we have a second slice instead of individual items? We could import
`slices` and use its `Concat` function. Or we can stick with `append` and
unpack that slice as a series of arguments into the second part of `append`
using `slice...`.

```go
s4 := append(s2, s1...)
fmt.Println(s4) //=> [1 2 3 4 5 1 2 3 4]
```

Here is the full example:

```go
package main

import (
	"fmt"
)

func main() {
	s1 := []int{1, 2, 3, 4}
	s2 := append(s1, 5)
	s3 := append(s2, 6, 7, 8)

	fmt.Println(s1)
	fmt.Println(s2)
	fmt.Println(s3)

	s4 := append(s2, s1...)
	fmt.Println(s4)
}
```

[source](https://pkg.go.dev/builtin#append)
