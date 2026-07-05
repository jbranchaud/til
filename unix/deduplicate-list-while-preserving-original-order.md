# Deduplicate List While Preserving Original Order

Usually when I want to deduplicate a list coming out of some command, I'll reach
for `sort | uniq`. This is a nice Unix trick where `uniq` removes consecutive
duplicate lines which relies on `sort` first reorganizing all lines in
alphabetically sorted order, bringing all duplicate lines together.

The caveat to using `sort | uniq` (or even `sort -u`) is that it will reorder
entries alphabetically. That means you'll lose the original order, which may
have been important.

```bash
❯ echo "red green blue red yellow green blue red green" | tr ' ' '\n' | sort -u
blue
green
red
yellow
```

Another approach is to use `awk` which can deduplicate while preserving the
order of entries as they first appear. This can be done with a pattern that
records the count of each line in an associative array.

```bash
❯ echo "red green blue red yellow green blue red green" | tr ' ' '\n' | awk '!seen[$0]++'
red
green
blue
yellow
```

The above pattern accepts on the first occurrence of each line and rejects on
any subsequent occurrences. That is done by adding `$0` (the current line) to
`seen` (associative array that auto-initializes inline). If it doesn't exist in
`seen` yet, then `0` is returned which is negated to a truthy value with `!`.
That entry is then incremented from `0` to `1` via the `++`. As `awk` continues
to process each line, `seen` is continually added to and incremented. The
default _action_ for `awk` is to print the line. Those truthy lines are the ones
that are printed.

An example of where this might be useful is when creating a unique listing of
all authors of a git repository while maintaining the order that they become
committers. I wanted to show this with a high-contribution public repo that I
worked on, so I referenced the [`egghead-next`
repo](https://github.com/skillrecordings/egghead-next).

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
John Lindquist <johnlindquist@work.local>
Vojta Holik <vojta@egghead.io>
Daniel Miller <dealingwith@gmail.com>
jh3y <jh3y@users.noreply.github.com>
Jhey Tompkins <jh3y@users.noreply.github.com>
Josh Branchaud <jbranchaud@gmail.com>
Lauro Silva <57044804+laurosilvacom@users.noreply.github.com>
LB <barth.laurie@gmail.com>
kodiakhq[bot] <49736102+kodiakhq[bot]@users.noreply.github.com>
dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
samuelhulick <samuel@samuelhulick.com>
Ian Jones <jones58ian@gmail.com>
Zac Jones <zacjones93@gmail.com>
...
```
