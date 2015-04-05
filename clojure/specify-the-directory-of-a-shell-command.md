# Specify the Directory of a Shell Command

Clojure gives us access to Java's shell capabilities through
`clojure.java.shell`. For instance, if you want to list the contents of your
project's directory, you can issue an `ls` command:

```
> (clojure.java.shell/sh "ls")
; {:exit 0,
;  :out "LICENSE\nREADME.md\ndoc\nproject.clj\nresources\nsrc\ntarget\ntest\n",
;  :err ""}
```

The default will always be to execute the command in the directory of the
containing project. It is likely that you'd like to specify a different
directory though. There is a function for that:

```clojure
(clojure.java.shell/with-sh-dir "some/dir" (clojure.java.shell/sh "ls"))
```

Or more concisely, you can specify the directory as part of the `sh`
function:

```clojure
(clojure.java.shell/sh "ls" :dir "some/dir")
```
