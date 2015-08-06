# Evaluate One Liners With lein-exec

You can install the [`lein-exec`](https://github.com/kumarshantanu/lein-exec)
plugin and then use it to evaluate one liner bits of code with the `-e`
flag.

```bash
$ lein exec -e '(println "foo" (+ 20 30))'
foo 50
```
