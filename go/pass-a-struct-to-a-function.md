# Pass A Struct To A Function

Go operates as _pass-by-value_ which means that when we pass a struct to a
function, the receiving function gets a copy of the struct. Two things worth
noticing about that are 1) an extra memory allocation happens when calling the
function and 2) altering the struct does not affect the original in the calling
context.

On the other hand, we can have a function that takes a pointer to a struct.
When we call that function, we have a reference to the memory location of the
struct instead of a copy of the struct. That means no additional allocation and
modifications to the dereferenced struct are modifications to the original in
the calling context.

Here is an example that demonstrates both of these. Notice the printed output
that is included in comments at the end which shows memory locations and
contents of the struct at various points.

```go
package main

import "fmt"

type Order struct {
	Item string
	Quantity int
	DineIn bool
}

func main() {
	order := Order{Item: "taco", Quantity: 3, DineIn: true}

	fmt.Println("Order:", order)
	fmt.Printf("main - Loc: %p\n", &order)

	doubledOrder := doubleOrder(order)

	fmt.Println("Double Order:", doubledOrder)
	fmt.Println("Original Order:", order)

	doubleOrderPtr(&order)

	fmt.Println("Double Order Ptr:", order)
}

func doubleOrder(order Order) Order {
	fmt.Printf("doubleOrder - Loc: %p\n", &order)
	order.Quantity *= 2

	return order
}

func doubleOrderPtr(order *Order) {
	fmt.Printf("doubleOrderPtr - Loc: %p\n", order)
	(*order).Quantity *= 2
}

// Order: {taco 3 true}
// main - Loc: 0xc0000b4000
// doubleOrder - Loc: 0xc0000b4040
// Double Order: {taco 6 true}
// Original Order: {taco 3 true}
// doubleOrderPtr - Loc: 0xc0000b4000
// Double Order Ptr: {taco 6 true}
```
