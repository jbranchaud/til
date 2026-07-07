# List All Authors On Git Repository

The `git log` is the ledger of all commits made to the repository. If I am on
the `main` branch and I have the latest pulled from the remote, then running
`git log` will be a complete listing of all commits.

`git log` includes more information than just authorship. I can narrow that all
down to only author name and author email using the `--format` flag. For all the
format string options available, I can run `man git-log` and jump to the `PRETTY
FORMATS` section, scrolling just past the built-in formats.

The two I am interested in are `%an` (Author Name) and `%ae` (Author Email). I
can arrange these however I want in the format string argument. Here is what it
looks like for the [`egghead-next`
project](https://github.com/skillrecordings/egghead-next):

```bash
❯ git log --format='%an <%ae>'
Zac Jones <zacjones93@gmail.com>
Zac Jones <zacjones93@gmail.com>
Zac Jones <zacjones93@gmail.com>
Zac Jones <zacjones93@gmail.com>
Zac Jones <zacjones93@gmail.com>
Zac Jones <zacjones93@gmail.com>
Zac Jones <zacjones93@gmail.com>
John Lindquist <johnlindquist@gmail.com>
Zac Jones <zacjones93@gmail.com>
...
```

I get _name_ followed by _email_ wrapped in angle brackets. This is only so
useful though because I am going to see tons duplicate authors especially for a
project with hundreds and thousands of commits. I can narrow this down with [a
deduplication trick via
`awk`](unix/deduplicate-list-while-preserving-original-order.md):

```bash
❯ git log --format='%an <%ae>' | awk '!seen[$0]++'
Zac Jones <zacjones93@gmail.com>
John Lindquist <johnlindquist@gmail.com>
Josh Branchaud <jbranchaud@gmail.com>
Vojta Holik <vojta@egghead.io>
Creeland A. Provinsal <cree@egghead.io>
joel <joelhooks@gmail.com>
Creeland <cree@provinsal.com>
...
```

That's already a big improvement. The only other change I want to make is
related to the default ordering of `git log`. It lists out commits in descending
order (most recent first). I want to see authors listed in the order that they
first committed to the project. Adding in the `--reverse` flag will solve for
that.

```bash
❯ git log --reverse --format='%an <%ae>' | awk '!seen[$0]++'
Joel Hooks <joelhooks@gmail.com>
johnlindquist <johnlindquist@gmail.com>
John Lindquist <johnlindquist@gmail.com>
William Johnson <w.alexander.johnson@gmail.com>
depfu[bot] <23717796+depfu[bot]@users.noreply.github.com>
Evgeniy Nagalskiy <evgeniy.nagalskiy@gmail.com>
Taylor Bell <taylorbell@gmail.com>
Maggie Appleton <maggie.fm.appleton@gmail.com>
...
```

See `man git-log` for more details.
