# Edit The Current Command Prompt

A neat feature of `bash` is the ability to open whatever the current state of
the command prompt is into your default editor.

Let's say we have a really long command that we've just tried to run, but it
failed and we need to make a small change somewhere in the middle. Instead of
holding the left arrow key for 30 seconds, we can instead hit `CTRL-X CTRL-E`.

This pops us into our `EDITOR` (or maybe `VISUAL`, not sure which). In my case,
that is `nvim`. I now have access to all the features I'm used to in `nvim` for
quickly navigating to and editing, searching and replacing, or whatever.

Once I've got the command how I like it, I can save and exit (`:wq`) and the
updated command will be executed.

This is similar to [the `fc` builtin](unix/fix-previous-command-with-fc.md),
which also happens to be available for `zsh`.
