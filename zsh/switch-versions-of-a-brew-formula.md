# Switch Versions of a Brew Formula

If you've installed a couple versions of a program via brew and you'd like
to switch from the currently linked version to the other installed version,
you can use the `switch` command. For instance, if you are on version
`1.8.2` of `phantomjs` and you'd like to switch to `1.9.0`, you can simply
invoke:

```
$ brew switch phantomjs 1.9.0
```

More generically:

```
$ brew switch <formula> <version>
```
