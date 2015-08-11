# Open JavaDocs

Clojure has all kinds of Java interop including a fancy function called
`javadoc`. The `javadoc` function _opens a browser window displaying the
javadoc for the argument_.

Thinking about using Java's `ArrayList` class, but want to read up on it
first? Try

```
> (javadoc java.util.ArrayList)
true
```

The javadoc page for
[ArrayList](http://docs.oracle.com/javase/6/docs/api/java/util/ArrayList.html)
will be opened up in your default browser.
