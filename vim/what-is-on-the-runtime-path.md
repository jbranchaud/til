# What Is On The Runtime Path?

All of the plugins, syntax highlighting, language-specific indentation that
extend the default behavior of Vim are on the runtime path. If something
isn't on Vim's runtime path, then Vim won't know about and as a result will
not load it at _runtime_.

How do we see what is on the runtime path?

The `rtp` option is the shorthand for `runtimepath`. Calling `set` on either
of these will show us the list of runtime paths, or at least some of them.

```
:set rtp
```

This will generally be a truncated list if you have a lot of plugins. To be
sure you are seeing all of them, use `echo` instead.

```
:echo &rtp
```

See `:h rtp` for more details.

h/t Chris Erin
