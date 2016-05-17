# List Functions For A Namespace

You know that `clojure.string` has a function for uppercasing a string, but
you can't quite remember the name of the function. You'd remember if you saw
the name though. What you'd like to do is list all the functions in the
`clojure.string` namespace to see if you can pick it out.

You can do just that. There are a couple ways to do it, in fact.

You can use the `dir` function with Clojure 1.6+. Alternatively, you can
grab all the keys from the public intern mappings of the namespace.

```clojure
> (dir clojure.string)
blank?
capitalize
ends-with?
escape
includes?
index-of
join
last-index-of
lower-case
re-quote-replacement
replace
replace-first
reverse
split
split-lines
starts-with?
trim
trim-newline
triml
trimr
upper-case
nil

> (keys (ns-publics 'clojure.string))
(ends-with? capitalize reverse join replace-first starts-with? escape last-index-of re-quote-replacement includes? replace split-lines lower-case trim-newline upper-case split trimr index-of trim triml blank?)
```

[source](http://stackoverflow.com/questions/2747294/how-to-list-the-functions-of-a-namespace)
