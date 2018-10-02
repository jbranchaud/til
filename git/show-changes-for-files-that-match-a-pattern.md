# Show Changes For Files That Match A Pattern

The `git show` command allows you to view the changes associated with a
reference, such as a commit sha (e.g. `git show 86748aacf14e`).

Consider a commit that has changed a bunch of JS files as well as two CSS
files. If we run `git show abcd1234`, we will see all of the changes to each
file which can result in quite a bit of noise. What if we only want to view
the changes to the CSS files?

We can instruct the command to only show changes to files that match a
pattern by tacking that pattern on to the end.

```bash
$ git show abcd1234 *.css
```

Alternatively, we could scope the output of the command to the files that
live in a certain directory.

```bash
$ git show abcd1235 src/css
```
