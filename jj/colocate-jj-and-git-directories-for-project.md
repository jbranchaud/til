# Colocate jj And git Directories For Project

When doing a standard clone of a git repository with `jj`, you'll get a copy of
the project with a `.jj` directory containing the version control information.

```bash
$ jj git clone git@github.com:jbranchaud/my-repo
Fetching into new repo in "/path/of/local/repo"
...

$ exa --tree --all -L 1
.
├── .gitignore
├── .jj
├── Cargo.lock
├── Cargo.toml
└── src
```

This is fine if I'm completely familiar with using
[jujutsu](https://martinvonz.github.io/jj/latest/). However, if I'm coming from
`git` and still learning, then it would be nice to be able to fallback to
familiar `git` commands when needed.

But without a `.git` directory, I get this:

```bash
$ git log
fatal: not a git repository (or any of the parent directories): .git
```

When cloning a git repo with `jj`, I can instruct it to _colocate_ which means
that it will create both the `.jj` and the `.git` data directories in the
project.

```bash
$ jj git clone --colocate git@github.com:jbranchaud/my-repo
Fetching into new repo in "/path/of/local/repo"
...

$ exa --tree --all -L 1
.
├── .git
├── .gitignore
├── .jj
├── Cargo.lock
├── Cargo.toml
└── src
```

Now I can run `jj` commands or `git` commands:

```bash
$ git log
commit 0c72abbb83657096677f9a3d5ddc7bce20839165 (HEAD, origin/trunk, trunk)
...
```

[source](https://martinvonz.github.io/jj/latest/git-compatibility/#co-located-jujutsugit-repos)
