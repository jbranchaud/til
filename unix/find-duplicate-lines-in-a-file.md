# Find Duplicate Lines In A File

Let's say I have a large file in a Ruby project. I want to find instances of a
`field` declaration being duplicated throughout the file. Just searching for
duplicate lines within the file is going to result in all kinds of false
positives (think, lots of duplicate `end` lines).

What I can do is `grep` for a pattern that will just match on the lines that
are `field` declarations. The results of the `grep` can then be piped to `sort`
which will order them. This ordering will mean that any duplicates are placed
next to each other. Lastly, I'll pipe the sorted lines to `uniq` with the `-d`
flag which will filter the results down to just those lines that are repeated.

Here is what the whole thing looks like:

```
$ grep -o "field :[a-zA-Z_][a-zA-Z_0-9]*" file.rb | sort | uniq -d
```

See `man uniq` for more details on the available flags.
