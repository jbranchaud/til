# Sum A Bunch Of Numbers In The Current File

Let's say I have a bunch of big numbers on consecutive lines in the file I
currently have open in Vim. Like this:

```
   418564
   921550
  1180181
  1234458
  2706100
 15954945
 16254608
```

If I make a visual selection of those numbers and then hit `:`, it will open a
command prompt for the beginning (`'<`) to the end (`'>`) of the visual
selection. I can then shell out those lines to an external command by starting
the command with `!`. The command to shell out to for this scenario is `awk`
which can sum up values from a "file" in a single line.

The whole thing will look like this:

```
:'<,'>!awk '{s+=$1} END {print s}'
```

Hit enter. Then `awk` will produce the sum and replace the highlighted lines
with that value.

```
38670406
```

[source](https://stackoverflow.com/a/450821)
