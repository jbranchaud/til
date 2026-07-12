# Track Line Occurrences From Input With AWK

In [Deduplicate List While Preserving Original
Order](deduplicate-list-while-preserving-original-order.md), I showed a terse
AWK pattern that allows for sifting out all duplicate lines as they are
encountered. This looks like `!seen[$0]++`.

I thought it would be useful to look at a less dense version of this where I
break out the conditional check, make the `print` explicit, and add lines to the
associative array in the action block.

```bash
❯ echo "red green blue red yellow green blue red green" | tr ' ' '\n' | awk '!($0 in seen) { print; seen[$0] = 1 }'
red
green
blue
yellow
```

Let's take a look at that. The first part is the pattern that determines whether
the action(s) runs.

```bash
!($0 in seen)
```

Here we check if the current line from the input being processed (`$0`) has
already been added to the associative array we declared with a name of `seen`.
If it is the first time we've seen that exact line, then it won't be in, so a
`false` which gets negated (`!`) to `true`, so the actions are triggered.


The second part in curly braces is a sequence of actions separated by
semicolons.

```bash
{ print; seen[$0] = 1 }
```

The first action is `print` which will print the current line to stdout. The
second action adds the current line to the associative array (`seen`) with a
value of `1`. Now any time we encounter a recurring line it will be present _in_
`seen` and the pattern will evaluate to false, preventing these actions from
running.

The whole thing then is:

```bash
awk '!($0 in seen) { print; seen[$0] = 1 }'
```

Again this is an expanded, easier-to-understand version of `awk '!seen[$0]++`
which has the same behavior.
