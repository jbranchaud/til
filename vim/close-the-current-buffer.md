# Close the Current Buffer

There are a number of ways in Vim to close the current buffer. Obviously,
`:q` will do the trick, but that kills all of your buffers which isn't ideal
if you are still editing other files.

If you start digging through the Vim docs, you might come across both `:bd`
(`:bdelete`) and `:bw` (`:bwipe`). At surface level, these seem like aliases
of each other. Give them both a try and in both cases the current buffer
will go away, dropping you into one of the other buffers you have open.

The difference between `:bd` and `:bw` is in the details, namely in the
side-effects. The `:bd` command is sort of a soft delete that removes the
file from the buffer list (do an `:ls` to check). If you have set marks on
that buffer, you'll notice that they are still there (check with `:marks`).
You may also notice that that buffer may still appear all over the jump list
(see `:jump`). The `:bd` command is going to leave traces of your file all
over the place (which could either be really handy or really annoying
depending on what you are doing). The `:bw` command on the other hand is
going to *wipe out* all of this stuff, hence its name. The Vim docs for
`:bw` warn us to only use it if we know what we are doing.

Something worth noting for both commands is that if the buffer is *dirty*
(modified, but unsaved), then they won't work, unless you force them to with
`:bd!` or `:bw!`.
