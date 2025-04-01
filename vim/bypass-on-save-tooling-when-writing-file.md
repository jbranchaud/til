# Bypass On-Save Tooling When Writing File

Every once in a while I run into an issue where my code formatters or linters
are misconfigured for a project. I try to save a file and it applies formatting
that I don't want. Or in an extreme case, the error ouput of the tool is what
overwrites the file.

I need to troubleshoot my dev tooling eventually, but I don't want to get
sidetracked at the moment. I just want to save the file. What can I do?

Tools like linters and code formatters are typically hooked up to Vim via
autocommands on certain actions like `FileWrite*` or `BufWrite*`. We can
execute a Vim command like writing a file (`w`) while disregarding autocommands
like so:

```vim
:noautocmd w
```

or, write and quit:

```vim
:noautocmd wq
```

This disables all autocommands for this one command. The file gets saved and
the misconfigured formatters and linters don't clobber the changes you
intended.

See `:h noautocmd` for more details.
