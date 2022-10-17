# Find And Remove Files That Match A Name

Let's say I have a bunch of `robots.txt` file scattered throughout my project.
I want to find all instances of that file checked into git. I then want to
remove that file from git.

I can find all the instances of that file checked into git using the
[`git-ls-files`](https://git-scm.com/docs/git-ls-files) command.

```bash
$ git ls-files '**/robots.txt'
project-a/public/robots.txt
project-b/public/robots.txt
apps/project-c/public/robots.txt
```

That results in a list of paths of those files regardless of how far down they
are nested (because of the `**` glob pattern).

And because `git-ls-files` is a _git plumbing_ command, it pipes cleanly into
other unix commands.

I can combine that first command with [`git
rm`](https://git-scm.com/docs/git-rm) using the
[`xargs`](https://man7.org/linux/man-pages/man1/xargs.1.html) command.

```bash
$ git ls-files '**/robots.txt' | xargs git rm
rm 'project-a/public/robots.txt'
rm 'project-b/public/robots.txt'
rm 'apps/project-c/public/robots.txt'
```

That takes each path from the first part of the command and passes it to `git
rm` which stages it as a removed file.

I can finalize my work by creating a commit from these staged changes.
