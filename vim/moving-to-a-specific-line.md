# Moving To A Specific Line

Often times when I open a new buffer, it is with the intention of moving to
a particular line. For example, if I am trying to move to line 55 in the
file, then I will hit `55j`\*. This works fine when I am dealing with a
freshly opened buffer. That is, this works fine if I am starting from the
top of the buffer.

In general, there is a better approach. I can move to an exact line number
from normal mode with `:{N}` where `{N}` is the line number. So, if I want
to get to line 55 regardless of where I am currently positioned in the
buffer, I can simply hit `:55<cr>`.

\* *This actually is slightly inaccurate, it moves me to line 56, not 55.
If I need to be precise, `55j` doesn't cut it.*

\*\* Also, I can apparently use `55G` to achieve the same thing
([source](https://twitter.com/rossnelson/status/591239951032983553)).
