# Ignore Files Specific To Your Workflow

_If you want to watch instead of read, I explore this in [Four Ways to Ignore
Files with Git](https://www.youtube.com/watch?v=ip06v7Wnfz0)._

The most common way to tell git to ignore files is to add them to a project's
`.gitignore` file. This file is kept under version control, so it is shared
with anyone who clones the project.

What about ignoring files that shouldn't necessarily be recorded in the
project's `.gitignore`?

For instance, let's say I create a `notes.md` file to write some project notes
to myself or keep track of a few todo items. This file is just for me. I don't
want it committed. Because this `notes.md` is an idiosyncrasy of my workflow, I
don't want to exclude it in the tracked `.gitignore` file.

Instead, this file is a perfect candidate for the git repository's
`.git/info/exclude` file. Git treats entries in this file the same as it does
the `.gitignore` file. This file only exists on my machine and is not under
version control.

```
# .git/info/exclude
notes.md
```

Once I've added that line, `notes.md` will no longer show up as an untracked
file when I run `git status`.

See `man gitignore` for more details.
