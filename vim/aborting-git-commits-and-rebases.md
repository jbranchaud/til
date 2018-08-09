# Aborting Git Commits And Rebases

When you are amending a commit or doing an interactive rebase of a series of
commits, Vim will be open to a buffer full of content related to the
respective action. Normally, you'll make some changes, save the buffer, and
then quit -- Git will take over from there by processing the commit or
rebase.

What if you find yourself in this situation and you want to cancel the commit or
rebase? Simply quitting with text already in the buffer will be interpreted
by Git as a signal to go ahead and process the commit/rebase.

So, how do we quit without confirming the action?

Vim allows you to quit with an error code.

```
:cq
```

This means that irrespective of the content of the buffer, Vim will signal
to Git with an error code to not process the commit or rebase, effectively
aborting the action.

See `:help cq` for more details.
