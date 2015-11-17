# Pretty Print The Last Thing

Clojure provides `pp` as a convenience macro for pretty printing the last
thing that was output. If you are playing around with a function in the
repl, trying to get the output just right, `pp` can come in handy.

```clojure
> (fancy-func)
{:one {:a 1, :b 2, :c 3, :d 4}, :two {:b 2, :c 3, :d 4, :e 5}, :three {:c 3,
:d 4, :e 5, :f 6}, :four {:d 4, :e 5, :f 6, :g 7}}
> (clojure.pprint/pp)
{:one {:a 1, :b 2, :c 3, :d 4},
 :two {:b 2, :c 3, :d 4, :e 5},
 :three {:c 3, :d 4, :e 5, :f 6},
 :four {:d 4, :e 5, :f 6, :g 7}}
nil
```

See `(doc pp)` for more details.
