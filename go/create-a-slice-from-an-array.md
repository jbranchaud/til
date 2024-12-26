# Create A Slice From An Array

Slices in Go are a flexible abstraction over arrays. We can create a slice from
an array with the `[n:m]` _slicing_ syntax. We specify the left and right
(exclusive) bounds of the array that we want to create the slice relative to.

We can exclude the lower bound which translates to the `0` index of the array.
We can exclude the left bound which translates to the end of the array. We can
even exclude both ends of the _slicing_ syntax which means creating a slice of
the entire array.

Here is an example of each of those:

```go
package main

import "fmt"

func main() {
	arr := [...]string{
		"taco",
		"burrito",
		"torta",
		"enchilada",
		"quesadilla",
		"pozole",
	}

	firstTwo := arr[:2]
	lastTwo := arr[len(arr)-2:]
	all := arr[:]

	fmt.Println("First two:", firstTwo)
	// First two: [taco burrito]

	fmt.Println("Last two:", lastTwo)
	// Last two: [quesadilla pozole]

	fmt.Println("All:", all)
	// All: [taco burrito torta enchilada quesadilla pozole
}
```

[source](https://go.dev/blog/slices-intro#slices)
