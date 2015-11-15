# Add A File Without Loading It

Generally, when you interact with files (e.g. `:e some-file.txt`), you are
both adding it to the buffer list and loading the contents of the file as a
separate buffer. The `:bad` command allows you to add a file to the buffer
list without loading it. For instance, you can add your `README.md` to the
buffer list and leave the current buffer in focus with:

```
:bad README.md
```

This command seems particularly useful for scripting the setup of an initial
vim environment or preparing for a `:bufdo` command.
