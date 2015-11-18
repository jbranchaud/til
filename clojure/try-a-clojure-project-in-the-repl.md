# Try A Clojure Project In The REPL

The `lein-try` plugin is a tool that makes it easy to quickly try out a
clojure project in the lein repl. Given the name and version of a clojure
project, it will drop you into a repl with that project loaded in. This is a
great way to get the feel for the features of an unfamiliar clojure library
before dropping it in as a dependency to your own project.

First, add the plugin to your `~/.lein/profiles.clj` file by including the
following line in the `:plugins` vector:

```
[lein-try "0.4.3"]
```

Then simply invoke the plugin with whatever project you want to try:

```
$ lein try automat
```

And to include a specific version number:

```
$ lein try automat "0.1.3"
```
