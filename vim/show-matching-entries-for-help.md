# Show Matching Entries For Help

Looking up things with Vim's `:help` command can be error prone if you don't
know exactly how to format what you are looking up. Bypass some of the
guesswork by hitting `Ctrl-d` after writing part of the `:help` command.
This will populate a wildmenu of possible matches.

For instance, if you know there is a command containing `?`, but you aren't
sure how to look it up, try the following:

```
:help ?<Ctrl-d>
```

You can tab through to the one you want and hit enter to read up on it. Who
knew there were so many Vim bindings involving a `?`.

See `:h help-context` for more details.
