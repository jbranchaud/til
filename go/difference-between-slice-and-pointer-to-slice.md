# Difference Between Slice And Pointer To Slice

Though a slice can be thought of and used as a flexible, variable-length
array-like data structure, it is important to understand that it is also a
special kind of pointer to an underlying array.

This matters when we a function receives a slice versus a pointer to a slice as
an argument, depending on what it is doing with that slice.

If the function is access or updating elements in the slice, there is no
difference. There is no meaningful difference between these two functions and
we might as well use the former.

```go
func replaceAtIndex(slice []string, index int, value string) {
	slice[index] = value
}

func replaceAtIndexPtr(slice *[]string, index int, value string) {
	(*slice)[index] = value
}
```

On the other hand, if the receiving function needs to append to or replace the
slice, then we need to pass a pointer to the slice. A direct slice argument
will result in only the function-local copy getting replaced.

```go
package main

import (
	"fmt"
)

func main() {
	s1 := []int{8, 6, 7, 9}
	s2 := []int{8, 6, 7, 9}

	addItem(s1, 11)
	fmt.Printf("s1: %v\n", s1) //=> s1: [8 6 7 9]

	addItemPtr(&s2, 11)
	fmt.Printf("s2: %v\n", s2) //=> s2: [8 6 7 9 11]
}

func addItem(slice []int, value int) {
	slice = append(slice, value)
}

func addItemPtr(slice *[]int, value int) {
	(*slice) = append(*slice, value)
}
```

[source](https://go.dev/tour/moretypes/8)
