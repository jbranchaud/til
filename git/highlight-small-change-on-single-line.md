# Highlight Small Change On Single Line

Sometimes a change gets made on a single, long line of text in a Git tracked
file. If it is a small, subtle change, then it can be hard to pick out when
looking at the diff. A standard diff will show a green line of text stacked on
a red line of text with no more granular information.

There are two ways we can improve the diff output in these situations.

The first is built-in to git. It is the `--word-diff` flag which will visually
isolate the portions of the line that have changed.

```bash
git diff --word-diff README.md
```

Which will produce something like this:

```diff
A collection of concise write-ups on small things I learn [-day to day-]{+day-to-day+} across a
```

The outgoing part is wrapped in `[-...-]` and the incoming part is wrapped in
`{+...+}`.

The second (and my preference) is to use
[`delta`](https://github.com/dandavison/delta) as an external differ and pager
for git.

```bash
git -c core.pager=delta diff README.md
```

I cannot visually demonstrate the difference in a standard code block. So I'll
describe it. We see a red and green line stacked on each other, but with muted
background colors. Then the specific characters that are different stand out
because they are highlighted with brighter red and green. I [posted a visual
here](https://bsky.app/profile/jbranchaud.bsky.social/post/3ln245orlxs2j).

`delta` can also be added as a standard part of your config like I demonstrate
in [Better Diffs With Delta](git/better-diffs-with-delta.md).

h/t to [Dillon Hafer's post on
`--word-diff`](https://til.hashrocket.com/posts/t994rwt3fg-finds-diffs-in-long-line)
