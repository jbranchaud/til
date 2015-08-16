# Reductions

One of the core functions in Clojure is
[`reduce`](https://clojuredocs.org/clojure.core/reduce). It allows you to
build up some result based on applying a function to each value in a
collection. Clojure provides a similar function that builds up a (lazy)
sequence of intermediate values as it is performing a reduce.
This function is
[`reductions`](https://clojuredocs.org/clojure.core/reductions).

Using `reduce` to sum a collection of integers looks like this

```clojure
> (reduce + 0 [1 2 3 4 5])
=> 15
```

whereas `reductions` performing the same task will look like this

```clojure
> (reductions + 0 [1 2 3 4 5])
=> (0 1 3 6 10 15)
```

h/t Josh Davey
