# Swap Two Items in a Vector

If you want to replace the value at an index in a vector, you can use the
`assoc` function supplied by `clojure.core` like so:

```clojure
> (assoc [5 6 7 8] 1 9)
; [5 9 7 8]
```

Likewise, if you want to replace two items in a vector, you can extend the
above like so:

```clojure
> (assoc [5 6 7 8] 1 2 2 4)
; [5 2 4 8]
```

We can take advantage of that second example to construct a function that
will swap two values:

```clojure
(defn swap
  [items i j]
  (assoc items i (items j) j (items i)))
```

This function will break on values of `i` and `j` that are out of the bounds
of `items`, but dealing with that is left as an exercise to the reader.

[source](http://stackoverflow.com/questions/5979538/what-is-the-idiomatic-way-to-swap-two-elements-in-a-vector)
