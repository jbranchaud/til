# Set Max Heap Size

For `lein`-based projects, the maximum heap size can be set by including the
`-Xmx` option in the `jvm-opts` portion of the `project.clj` file. For
instance, to set the maximum JVM heap size to 2 gigabytes, include:

```clojure
  :jvm-opts ["-Xmx2g"]
```

in your `project.clj` file.
