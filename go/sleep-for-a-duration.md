# Sleep For A Duration

Many languages allow you to sleep for a certain number of milliseconds. In
those languages, you can give `500` or `1000` to the sleep function to
sleep for half a second and a second respectively. In Go, the duration of a
call to [`time.Sleep`](https://golang.org/pkg/time/#Sleep) is in
nanoseconds. Fortunately, there are constants that make it easy to sleep in
terms of milliseconds.

For example, you can sleep for a half a second (500 milliseconds) like so:

```go
package main

import (
    "time"
)

func main() {
    time.Sleep(500 * time.Millisecond)
}
```

Other available time constants are `Nanosecond`, `Microsecond`, `Second`,
`Minute`, `Hour`.
