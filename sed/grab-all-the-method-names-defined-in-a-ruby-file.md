# Grab All The Method Names Defined In A Ruby File

I wanted a listing of all the methods defined in a Ruby file. Metaprogramming
aside, I figured I could write a one-line `sed` script to effectively do this.

```bash
$ sed -n 's/[[:space:]]*def \([[:alnum:]_?!]*\).*/\1/p' file.rb
```

Let's break this down.

- `[[:space:]]*` accounts for any level of indentation.
- `def ` matches againts the start of a method definition.
- `\(...\)` is a capture that can be referenced in the replace side of the
  script.
- `[[:alnum:]_?!]*` represents the characters that can make up a Ruby method
  name, this is equivalent to writing `[a-zA-Z0-9_?!]*`.
- `.*` is the final part of the regex match which ensures the rest of the line
  is loaded into the pattern space so that the replacement will only be the
  method name.
- `\1` replaces everything in the first part of the script with the capture
  which is just the method name.
- combining the `-n` and `p` flags ensures that only lines with substitutions
  are printed.

This probably isn't perfect, but it is good enough to reference from time to
time in my shell history.
