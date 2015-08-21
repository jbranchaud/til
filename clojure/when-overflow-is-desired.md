# When Overflow Is Desired

If you try to add two `MAX_VALUE` Longs, Clojure is kind enough to warn you.

```clojure
> (+ Long/MAX_VALUE Long/MAX_VALUE)
ArithmeticException integer overflow  clojure.lang.Numbers.throwIntOverflow (Numbers.java:1424)
```

However, when overflow is desired, you can use the *unchecked* operators
(e.g. `unchecked-add`).

```clojure
> (unchecked-add Long/MAX_VALUE Long/MAX_VALUE)
-2
```

See also `unchecked-subtract` and `unchecked-multiply`.
