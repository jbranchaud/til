# Whole Line Auto-Completion

To get whole line auto-completion in Vim, you don't need a fancy plugin. It
is built right in. There is a sub-mode of insert mode called *X mode* that
allows you to do various kinds of special insertions. The `ctrl-x ctrl-l`
binding corresponds to whole line completion. So, if you start typing a few
characters and then (while still in insert mode) hit `ctrl-x ctrl-l` you
will see a completed line that matches the initial characters you typed as
well as a list of subsequent matches. You can cycle through the matches
using `ctrl-n` and `ctrl-p` (going forward and backward, respectively).

The completion is done based on the configured completion sources.
Generally, the completion sources will include the current buffer, other
loaded and unloaded buffers, plus others. You can see which sources are
configured with `:set complete?` and read more about the completion
configuration at `:h 'complete'`.
