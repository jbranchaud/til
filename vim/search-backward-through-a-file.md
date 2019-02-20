# Search Backward Through A File

There are a number of ways to search for a match in a file. One I use quite
often is hitting `*` while the cursor is over the word I want to find
matches for. It searches forward jumping to the next occurrence of that
word.

It turns out there is a way of doing the same thing, but searching backward
to the previous occurrence of the word. If you hit `#` with the cursor over
a word, it will jump backward through the file until it finds an occurrence
of that word. Keep hitting `#` to keep searching backward.

See `:h #` for more details.
