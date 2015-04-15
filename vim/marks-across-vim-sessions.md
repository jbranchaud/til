# Marks Across Vim Sessions

Any mark set with a capital letter (that is, `A-Z`) is called a *file mark*.
File marks can be used to move from file to file. File marks will also be
written to the Vim Info file (`~/.viminfo`) which means that if you close
Vim and open it again, it will still know about those file marks. This means
that your file marks are persisted across vim sessions which will save you
the trouble of having to redefine them each time.

A more detailed description of marks is at `:help marks`.
