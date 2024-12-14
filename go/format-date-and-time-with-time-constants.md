# Format Date And Time With Time Constants

The Go [`time` package](https://pkg.go.dev/time) has a [`Format`
function](https://pkg.go.dev/time#Time.Format) for displaying the parts of a
date and time in standard and custom ways. It works a bit different than you
might be used to from other languages. Rather than using `strftime` identifiers
like in this string `"%B %d, %Y"`, there is a canonical date that is used as a
reference point.

That canonical date is from Janary 2nd, 2006. That was a Monday. It was at 5
seconds after 3:04PM. The Unix format of it looks like `"Mon Jan _2 15:04:05
MST 2006"`.

```
package main

import (
	"fmt"
	"time"
)

func main() {
	// This specific time pulled from `time.Format` docs
	t, _ := time.Parse(time.UnixDate, "Wed Feb 25 11:06:39 PST 2015")

	// Reference date and time:
	// "Mon Jan _2 15:04:05 MST 2006"

	strf1 := t.Format("|2006|02|01|03:04:05|Day: Mon|")
	fmt.Println("strf1:", strf1)
	// strf1: |2015|25|02|11:06:39|Day: Wed|

	strf2 := t.Format(time.DateTime)
	strf3 := t.Format(time.RubyDate)
	strf4 := t.Format(time.Kitchen)

	fmt.Println("DateTime:", strf2) // DateTime: 2015-02-25 11:06:39
	fmt.Println("RubyDate:", strf3) // RubyDate: Wed Feb 25 11:06:39 +0000 2015
	fmt.Println("Kitchen:", strf4)  // Kitchen: 11:06AM
}
```

Though there are a [variety of useful formatting
constants](https://pkg.go.dev/time#pkg-constants) already available like
`DateTime`, `RubyDate`, `Kitchen`, etc., we can also define our own formatting
string by using the reference values for each part of a date and time.

If you want to reference the year, whether as `YYYY` or `YY`, it is always
going to be a form of `2006`, so `2006` or `06` respectively. Even though the
above time variable is in February, our format strings will always need to use
one of `Jan`, `January`, `01` or `1`.
