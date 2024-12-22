# Deterministically Seed A Random Number Generator

If you need a random number in Go, you can always reach for the various
functions in the `rand` package.

```go
package main

import (
	"fmt"
	"math/rand"
)

func main() {
	for range 5 {
		roll := rand.Intn(6) + 1
		fmt.Printf("- %d\n", roll)
	}
}
```

Each time I run that, I get a random set of values. Often in programming, we
want some control over the randomness. We want to _seed_ the randomness so that
it is deterministic. We want random, but the kind of random where we know how
we got there.

```go
package main

import (
	"fmt"
	"math/rand"
)

func main() {
	seed := int64(123)
	src := rand.NewSource(seed)
	rng := rand.New(src)

	for range 5 {
		roll := rng.Intn(6) + 1
		fmt.Printf("- %d\n", roll)
	}
}
```

In this second snippet, we create a `Source` with a specific seed value that we
can use with a custom `Rand` struct. We can then deterministically get random
numbers from it.
