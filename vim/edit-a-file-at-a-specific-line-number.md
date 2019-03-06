# Edit A File At A Specific Line Number

I use long-running Vim sessions where I constantly open files as new buffers
with the `:edit` (or `:e`) command. Generally, when I open a new file I
end up with the cursor at the top of the buffer and go from there. But what
if I have a specific line number in mind and I want the cursor to start
there?

The `:edit` command can receive arguments, including a line number argument. To
open up to line 159, I can include the `+159` argument in the command.

```
:edit +159 path/to/the/file.txt
```

See `:h :edit` and `:h +cmd` for more details about how `:edit` works and
what the different arguments can do.
