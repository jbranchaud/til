# List All Files Added During Span Of Time

I wanted to get an idea of all the TIL posts I wrote during 2024. Every TIL I
write is under version control in a [git repo on
github](https://github.com/jbranchaud/til). That means git has all the info I
need to figure that out.

The `git diff` command is a good way at this problem. With the
`--diff-filter=A` flag I can restrict the results to just files that were
_Added_. And with `--name-only` I can cut all the other diff details out and
get just filenames.

But filenames added to which commits? We need to specify a ref range. There is
a ton of flexibility in how you define a ref, including [a date specification
suffix](https://git-scm.com/docs/gitrevisions#Documentation/gitrevisions.txt-emltrefnamegtltdategtemegemmasteryesterdayememHEAD5minutesagoem)
that points to the value of the ref at an earlier point in time.

So, how about from the beginning of 2024 to the beginning of 2025:

```
HEAD@{2024-01-01}..HEAD@{2025-01-01}
```

Putting that all together, we this command and potentially a big list of files.

```bash
$ git diff --diff-filter=A --name-only HEAD@{2024-01-01}..HEAD@{2025-01-01}
```

I wanted to restrict the results to just markdown files, so I added a filename
pattern.

```bash
$ git diff --diff-filter=A --name-only HEAD@{2024-01-01}..HEAD@{2025-01-01} -- "*.md"
```

I could even go a step further to see only the files added to a specific
directory.

```bash
$ git diff --diff-filter=A --name-only HEAD@{2024-01-01}..HEAD@{2025-01-01} -- "postgres/*.md"
```

As a final bonus, I can spit out the github URLs for all those files with a bit of `awk`.

```bash
$ git diff --diff-filter=A --name-only HEAD@{2024-01-01}..HEAD@{2025-01-01} -- "postgres/*.md" |
awk '{print "https://github.com/jbranchaud/til/blob/master/" $0}'
```
