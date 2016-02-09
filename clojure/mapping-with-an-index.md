# Mapping With An Index

If you're mapping over a collection and you need an index for each item, you
can reach for `map-indexed`. The `map-indexed` function can be used like so:

```clojure
> (def foods ["pizza" "hotdog" "chicken alfredo"])
#'cljs.user/foods
> (map-indexed (fn [idx item] (str idx " - " item)) foods)
("0 - pizza" "1 - hotdog" "2 - chicken alfredo")
```

Alternatively, `map` can take multiple sequences, and each becomes a new argument to the mapping function. By giving an infinite sequential list of numbers starting at 0 as the first sequence, you can pretend they're indices, like so:

```clojure
> (map (fn [idx item] (str idx " - " item)) (range) foods)
("0 - pizza" "1 - hotdog" "2 - chicken alfredo")
```
