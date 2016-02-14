# Splitting On Whitespace

If you have a string with spaces and you want to split the string into a
vector of strings (delimited by the spaces), then you can do something like
this:

```clojure
(clojure.string/split "split me up" #" ")
; ["split" "me" "up"]
```

However, if you have extra spaces in your string, the output may not be quite
what you want:

```clojure
(clojure.string/split "double  spacing  wtf?" #" ")
; ["double" "" "spacing" "" "wtf?"]
```

A quick fix might look like this:

```clojure
(clojure.string/split "double  spacing  wtf?" #" +")
; ["double" "spacing" "wtf?"]
```

That's nice, but it is going to fall over as soon as we run into input with
tabs and new lines. Assuming we want to split on all whitespace, we should
tell our regular expression to do just that:

```clojure
(clojure.string/split "we\thave new\nlines and  tabs\n" #"\s+")
; ["we" "have" "new" "lines" "and" "tabs"]
```
