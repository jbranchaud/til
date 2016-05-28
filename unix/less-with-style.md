# Less With Style

I was using `less` the other day to look at a log file. The log file was
filled with ANSI color escape sequences which made it pretty painful to
read. I was stuck looking at a white, unparsed log file instead of a
colorful, stylish one.

The `-R` flag fixes this. It tells `less` to display the ANSI color escape
sequences as colors rather than the caret notation.

The tradeoff is that `less` has _less_ control over the overall display of
the screen. This may result in some buggy display behavior, but not
necessarily.

[source](http://superuser.com/questions/117841/get-colors-in-less-command)
