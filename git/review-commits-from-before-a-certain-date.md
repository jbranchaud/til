# Review Commits From Before A Certain Date

I was recently looking at data in a 3rd-party tool and saw that there was a
very distinct shift in what was being recorded a couple years prior on a
specific date. I wanted to see what changes had been made to the codebase a day
or two before the shift.

Rather than scrolling all the way back in `git log`, I can tell `git log` to
show me all commits from before a certain date.

Let's say that date of interest is May 1st, 2021. I can use the `--until` flag
with `git log`. However, I should note that `--until` is an exclusive range, so
I'll need to specify `May 2 2021` if I want to start seeing commits on May 1.

```bash
$ git log --until='May 2 2021'
```

Because `git log` shows commits in reverse chronological order, I'll start
seeing commits from May 1st and then as I scroll, I'll see older and older
commits.

From here I can scan commits messages and look for one that I want to dig into.
I'd then use `git show <sha>` to explore a specific one further.

This is synonymous with `--before`.

See `man git-log` for more details.
