# Create A New Branch With Git Switch

As of [Git 2.23](https://www.infoq.com/news/2019/08/git-2-23-switch-restore/),
there is a new command in town for change and creating branches --
`git-switch`.

As a git user, you may be used to using `git checkout -b my_branch` to create
and switch to a new branch called `my_branch`. The `git-checkout` command can
do that and a lot more. In order to reduce some confusion and create a more
explicit command for this kind of action. That's what brought about
`git-switch`.

Create and change to a new branch with `git-switch` and the `-c` flag:

```bash
$ git switch -c my_new_branch
```

The `-c` flag is short for `--create` and the docs describe it as "a convenient
shortcut for:"

```bash
$ git branch <new-branch>
$ git switch <new-branch>
```

See `man git-switch` for more details.
