# List All Commits Where File Was Added Or Deleted

I noticed I wasn't able to find a file with a specific name anywhere in my
codebase. I expected it to be there, so I wondered when it had been added and
deleted from the codebase according to the git commit history.

This calls for running a `git log`, but with a couple flags. First, I'll include
`--name-status` so that each commit that is listed includes the file names with
the change status (i.e. `A` for added and `D` for deleted). Then the
`--diff-filter` flag tells git that I am only looking for `A`dded and `D`eleted
files. Then the `--` indicates that a file path will follow, even a regex
pattern is valid here.

```bash
git log --name-status --diff-filter=AD -- '*_mock_payment_form.*'
```

I'm looking for what is called a _partial_ in Rails. I know the filename
consists of `_mock_payment_form`. The leading `*` is so that I can be vague
about the directory this might be found in. That's useful if this file was
potentially moved around. The trailing `.*` indicates the file extension which I
also want to be vague about.

For any of the commits returned by this `git log`, I can grab the SHA and run
`git show <SHA>` to see the full picture of that commit.

Another flag that might be useful to add is the `--all` flag which will look
across all refs/branches instead of just the branch (`main`) that I'm currently
on.

```bash
git log --all --name-status --diff-filter=AD -- '*_mock_payment_form.*'
```

Perhaps I'm thinking of a file that was added on an abandoned feature branch.
`--all` will help turn up that in the results as well.
