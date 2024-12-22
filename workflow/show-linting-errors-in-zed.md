# Show Linting Errors In Zed

When working in a language like TypeScript or Go, the language server tooling
in [Zed](https://zed.dev/) can draw my attention to errors in my code. This
could be an unrecognized function or variable, a type error, or a syntax error.
When these linting errors are detected, the editor underlines them with a red
squiggly. I can hover over offending token or statement and see what the error
is.

There are also a few mouse-free ways to do this.

First, I can hit `F8` to jump to the next one of these errors in the current
file. That will move my cursor to that location and display a small overlay
with the error details.

Second, assuming Vim mode, I can navigate my cursor over a specific highlighted
token and then hit `Shift+k`. That will pop open the same small overlay to
display the error details.

Third, I can hit `Cmd+Shift+M` to open the _Project Diagnostics_ tab which
displays a series of file buffer results with the offending lines and the error
description.
