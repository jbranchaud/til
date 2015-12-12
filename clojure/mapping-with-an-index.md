# Mapping With An Index

If you're mapping over a collection and you need an index for each item, you
can reach for `map-indexed`. The `map-indexed` function can be used like so:

```clojure
> (def foods ["pizza" "hotdog" "chicken alfredo"])
#'cljs.user/foods
> (map-indexed (fn [idx item] (str idx " - " item)) foods)
("0 - pizza" "1 - hotdog" "2 - chicken alfredo")
```
