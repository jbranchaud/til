# Count All Files Of Specific Type Tracked By Git

I want to get a count of all the markdown files in my [TIL
repo](https://github.com/jbranchaud/til). Since all the files I care about are
tracked by `git`, I can use `git ls-files` to get a listing of all files. That
command on its own lists all files tracked by your git repository. Though there
are many other flags we can apply, that will do for my purposes.

By giving `git ls-files` a pattern to match against, I can turn up just, for
instance, markdown files (`*.md`). I can pipe that to `wc -l` to get a count
rather than exploding my terminal with a list of file names.

```bash
❯ git ls-files '*.md' | wc -l
    1503
```

That command includes `README.md` and `CONTRIBUTING.md`, but really I only want
to count the markdown files that constitute a TIL. Those all happen to be
nested under a single directory. So I can tweak the glob pattern like so:

```bash
❯ git ls-files '*/*.md' | wc -l
    1501
```

See `man git-ls-files` for more details.
