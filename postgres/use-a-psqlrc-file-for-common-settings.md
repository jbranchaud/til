# Use A psqlrc File For Common Settings

There are a handful of settings that I inevitably turn on or configure each
time I open up a `psql` session. I can save myself a little time and sanity
by configuring these things in a `.psqlrc` dotfile that is located in my
home directory. This will ensure my `psql` session is configured just how I
like it each time I launch it. Here is what my `~/.psqlrc` file currently
looks like:

```
\x auto
\timing
\pset null 'Ø'
```
