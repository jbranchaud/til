# Get The Value Of An Environment Variable

You can get the value of an environment variable on your system using the
`System/getenv` function. Just pass it the environment variable as a string:

```clojure
> (System/getenv "HOME")
"/Users/jbranchaud"
```

It returns `nil` when the environment variable doesn't exist.

```clojure
> (System/getenv "HOUSE")
nil
```
