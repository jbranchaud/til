# Do Something N Times

With Go 1.23 there is a new for-range syntax that makes looping a bit easier
and more compact.

Instead of needing to set up our 3-part for-loop syntax, we can say we want to
do something `N` times with `for range N`.

```go
for range n {
	// do something
}
```

Let's look at an actual, runnable example:

```go
package main

import "fmt"
import "math/rand"
import "time"

func main() {
	rand.Seed(time.Now().UnixNano()) 

	food := []string{"taco", "burrito", "torta", "enchilada", "tostada"}

	for range 5 {
		randomIndex := rand.Intn(len(food))
		fmt.Println(food[randomIndex])
	}
}
```

The output is random and might look something like this:

```bash
$ go run loop.go
taco
burrito
tostada
taco
enchilada
```

I appreciate this syntax addition because it feels very akin to Ruby's `#times`
method:

```ruby
5.times do
  # do something
end
```

[source](https://eli.thegreenplace.net/2024/ranging-over-functions-in-go-123/)
