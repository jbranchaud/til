# Reference A Capture In The Regex

You create a capture group in a `sed` regex by wrapping a pattern in `\(` and
`\)`. Generally, this capture group is referenced in the substitution
expression with `\1`.

The capture references (e.g. `\1`) can also be used in the regex as part of
specifying the match.

For instance, we can do a capture of a single digit followed by a reference to
that capture. That will match any line that has a pair of matching consecutive
digits.

```bash
$ seq 111 | sed -n 's/\([[:digit:]]\)\1/&/p'
11
22
33
44
55
66
77
88
99
100
110
111
```

This also uses `&` in the subex which represents the entire match. The `-n` and
`/p` combination suppresses printing of lines to only those that have
substitutions.
