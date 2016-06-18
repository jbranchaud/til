# Setting Filetype With Modelines

Vim and various plugins generally use known file extensions to determine the
filetype of a file. This is important because it is how Vim decides which
filetype-specific settings to enable, such as syntax highlighting.

If I am editing a file such as `build.boot`, Vim is not going to know that
its filetype should be set to `clojure`. The `build.boot` file is full of
clojure code though, so I'm losing out on syntax highlighting and so forth.
I can settle for manually setting the filetype to clojure (e.g. `:set
ft=clojure`) each time I open up the file.

Or I can use a modeline setting. By including a comment at the top or
bottom of the file specifying the filetype setting, I can ensure that each
time I go to edit the file, the appropriate filetype will be set.

That modeline comment will look something like:

```clojure
; vim: set ft=clojure:
```

See `:h modeline` for more details.

h/t Brian Dunn
