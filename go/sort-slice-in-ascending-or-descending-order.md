# Sort Slice In Ascending Or Descending Order

The [`slices.Sort`](https://pkg.go.dev/slices#Sort) function defaults to
sorting a slice in ascending order. If we want to control the sort order, we
have to do a little more work. We can reach for the
[`slices.SortFunc`](https://pkg.go.dev/slices#SortFunc) function. This allows
us to define a sort function and in that function we can control whether the
sort order is ascending or descending.

Here I've defined `SortItems` which takes a list of items constrained by the
[`cmp.Ordered`](https://pkg.go.dev/cmp#Ordered) interface (so things like
`int`, `string`, `uint64`, etc.). It takes a direction (`ASC` or `DESC`) as a
second argument. It does the directional sort based on that second argument.

```go
import (
	"cmp"
	"fmt"
	"slices"
)

type Direction int

const (
	ASC Direction = iota
	DESC
)

func SortItems[T cmp.Ordered](items []T, dir Direction) {
	slices.SortFunc(items, func(i, j T) int {
		if dir == ASC {
			return cmp.Compare(i, j)
		} else if dir == DESC {
			return cmp.Compare(j, i)
		} else {
			panic(fmt.Sprintf("Unrecognized sort direction: %d", dir))
		}
	})
}

// items := []int{3,2,8,1}
// SortItems(items, ASC)
// // items => [1,2,3,8]
// SortItems(items, DESC)
// // items => [8,3,2,1]
```

Because `slices.SortFunc` expects a negative value, zero, or positive value to
determine the sort order, we use
[`cmp.Compare`](https://pkg.go.dev/cmp#Compare) which returns those kinds of
values. For ascending, we compare `i` to `j`. For descending, we swap them,
comparing `j` to `i` to get the reverse sort order.
