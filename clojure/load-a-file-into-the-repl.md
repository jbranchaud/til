# Load A File Into The REPL

You can quickly load a file into a REPL session using the `load-file`
function. You can specify an absolute or relative path and it will

> sequentially read and evaluate the set of forms contained in the file.

```clojure
(load-file "path/to/file.clj")
```

See the [`load-file` docs](https://clojuredocs.org/clojure.core/load-file)
for more details.
