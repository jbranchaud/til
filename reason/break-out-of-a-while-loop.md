# Break Out Of A While Loop

The `while` construct is a great way to loop indefinitely. You may
eventually want to break out of the loop. For that, you are going to need to
invalidate the _while condition_. One way of going about this is creating a
mutable ref, changing it from true to false when a certain condition is met.

```reason
let break = ref(true);

while (break^) {
    switch (Unix.readdir(currentDir)) {
    | exception End_of_file => break := false
    | item => print_endline(item);
    }
};
```

Here we have a mutable ref called `break` which starts as `true`. This is
our _while condition_. Its actual value can be referenced by appending the
`^` character -- hence `break^`. Once a certain condition is met inside our
`while` block, we can set `break` to `false` using the `:=` operator.

The above code snippet can be seen in full details
[here](https://github.com/jbranchaud/basic-ls-reason-native/blob/master/src/Index.re).

[source](https://reasonml.github.io/docs/en/imperative-loops.html#tips-tricks)
