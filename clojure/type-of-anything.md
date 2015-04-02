# Type of Anything

You can get the type of anything with the `type` function. Because Clojure
is built on Java, many of these types may be types you recognize form Java.

Boot up the repl to try some of these out:

```clojure
> (type 5)
; java.lang.Long
> (type 5.2)
; java.lang.Double
> (type 5/4)
; clojure.lang.Ratio
> (type (int 2))
; java.lang.Integer
> (type "hello, world!")
; java.lang.String
> (type [1 2 3])
; clojure.lang.PersistentVector
> (type '(1 2 3))
; clojure.lang.PersistentList
```

[source](https://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types)
