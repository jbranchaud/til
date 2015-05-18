# Vim Without The Extras

If you want to start up vim without loading all the usual plugins, you
can supply the `--noplugin` flag

```
$ vim --noplugin coffee.rb
```

You can take things even further by instead telling vim to open without
loading any plugins or configuration files. That is, you can tell vim to
skip all initializations.

```
$ vim -u NONE coffee.rb
```

If you are used to lots of syntax highlighting, custom bindings, and
other niceties, this may feel rather foreign.

h/t [Jake Worth](https://twitter.com/jwworth)
