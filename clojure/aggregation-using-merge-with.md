# Aggregation Using merge-with

Clojure provides the `merge-with` function as a way of conjoining a series
of maps. You must provide `merge-with` a function that it can use to merge
two values for matching keys. For instance, imagine you have a bunch of maps
that contain counts for entities identified by keywords. You can consolidate
the sum of all the counts into a single map using the `merge-with` function
combined with the `+` function.

```clojure
> (merge-with + {:a 1 :b 3} {:b 2 :c 3} {:c 1 :d 4})
{:a 1, :b 5, :c 4, :d 4}
```

For different kinds of data, a different function argument may be more
appropriate. For instance, aggregating lists instead of integers calls for
the `concat` function:

```clojure
> (merge-with concat {:a '(1 2) :b '(3 4)} {:c '(3 4) :a '(5 4 1)})
{:a (1 2 5 4 1), :b (3 4), :c (3 4)}
```
