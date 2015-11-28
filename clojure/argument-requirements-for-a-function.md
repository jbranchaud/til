# Argument Requirements For A Function

When defining a function, you must declare one or more function definitions,
each of which will require a different set of arguments. These argument
lists are stored as metadata for the function. So, if you are trying to
figure out what arity a function is or what variations of arguments it
takes, you can check the metadata like so:

```clojure
> (:arglists (meta #'str))
([] [x] [x & ys])
```

[source](http://stackoverflow.com/questions/1696693/clojure-how-to-find-out-the-arity-of-function-at-runtime)
