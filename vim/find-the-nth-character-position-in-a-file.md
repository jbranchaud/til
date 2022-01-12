# Find The Nth Character Position In A File

While trying to load a JSON file in a JavaScript program, I got an error
message. The error message said that there was an issue parsing the JSON file
at the 9010th character position in the file. Though highly specific, this
didn't feel particularly actionable. I'm not going to count out 9010 characters
in a massive JSON file.

It turns out that Vim can help with this. After opening the file, I can then
run this search:

```
/\%^\_.\{9010}/e
```

This will put my cursor right on the 9010th character.

It matches on the first character position in the file (`\%^`), then it matches
on _any single character or end-of-line_ (`:h /\_.`), and then it matches on
that character class the number of times specified (`\{N}`) — in this case,
9010 times. 

Lastly, the second `/` marks the end of the search pattern and the `e` tells
the search to place the cursor at the end of the match. Without the `e`, the
cursor will be placed at the beginning of the match. For a match on thousands
of characters, that's not too helpful.

[source](https://vi.stackexchange.com/a/25308/28962)
