# Copy A File From Another Branch

After doing some work on a large feature branch, I wanted to split out some of
the work into a separate smaller branch to create an initial PR. There were
several files on the feature branch that I knew needed to be part of this
smaller branch.

To bootstrap this smaller branch, I need to check it out from main and then
copy over the needed files.

First, let's create a fresh branch:

```bash
$ git branch --show-current
large-feature-branch

$ git checkout main
$ git checkout -b new-smaller-branch
```

Now I can start pulling over the files I care about:

```bash
$ git checkout large-feature-branch some/file/ICareAbout.js
```

This form of `git-checkout` looks on the specified branch for the specified
file and copies that over to the index.

Note: this will copy over any local, working tree changes that you've made to
the named file.
