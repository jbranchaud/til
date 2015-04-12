# Expanding Macros

Macros are an important part of Clojure's syntax. They allow you to write
cleaner, terser, more expressive code.
Though sometimes you may want to inspect the
clojure code that is actually produced by a particular macro. The
`macroexpand` function allows for just this.

For instance, if you have a snippet of code using the `->>` operator:

```clojure
(->> 4 (+ 1) (- 2) (* 3))
```

You can wrap that form with the `macroexpand` function to see the form that
is ultimately evaluated:

```clojure
> (macroexpand (->> 4 (+ 1) (- 2) (* 3)))
; (* 3 (- 2 (+ 1 4)))
```

It doesn't buy us much in a contrived example like this, but can prove
useful for better understanding clojure and the more complex code we write.
