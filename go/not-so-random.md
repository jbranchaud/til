# Not So Random

Go's `rand` package makes it easy to generate all sorts of pseudo-random numbers.

What they don't tell you though is that the default seed is `1`. They [do tell you that the numbers are pseud-random and that you need to use the Seed function to initialize the default source if different behavior is required for each run](https://golang.org/pkg/math/rand/), though. So if you write a program like so:

```go
package main

import "fmt"
import "math/rand"

func main() {
    stuff := []string{
        "one",
        "two",
        "three",
        "four",
    }
    fmt.Println(stuff[rand.Intn(len(stuff))])
}
```

and then run it, you will get output like:

```
three
```

and any subsequent runs of the program will continue to produce `three`. Not
exactly what we are looking for.

If you want your program to be a little less predictable, you will want to
seed it yourself, perhaps with the current time, instead of `1`. Try adding
the following to the beginning of the `main` function:

```go
rand.Seed(time.Now().UTC().UnixNano())
```

You'll also want to import the `time` package.

Things should *appear* to be a bit more random now.

source: [Jake Worth](https://twitter.com/jwworth) and
[Stackoverflow](http://stackoverflow.com/questions/12321133/golang-random-number-generator-how-to-seed-properly)
