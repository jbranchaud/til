# Type Fewer Paths With Brace Expansion

Bash has a feature called _brace expansion_ that allows us to do a kind of
shorthand when writing out file paths. We can specify multiple variants
comma-separated between curly braces and they'll each be expanded into separate
arguments.

It's easier to understand this by seeing it. If we type the following (don't
hit `Enter` yet):

```bash
$ mkdir src/{one,two,three}
```

And then hit _Tab_:

```bash
$ mkdir src/one src/two src/three
```

Bash uses the portion in braces to expand into separate arguments. The part
outside the braces gets reused for each. That's where we get some savings from
typing out the same path each time.

Here is another example where we use `mv` to rename a file deeply nested in our
project:

```bash
$ mv projects/project1/src/app/utils/{names,constants}.js
```

We don't even have to _Tab_ it out. We can hit _Enter_ directly and `mv` gets
both arguments.

Similarly, how about we change the extension of our renamed file:

```bash
$ mv projects/project1/src/app/utils/constants.{js,ts}
```

I've always found this feature most useful with paths and filenames, but you
can do brace expansion with any arguments.

```bash
$ echo 1{3,1,6,4,9,2,7,5}
13 11 16 14 19 12 17 15
```

[source](https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html)
