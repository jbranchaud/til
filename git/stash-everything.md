# Stash Everything

Running the `git stash` command will take all the changes to tracked files
in the working directory and stash them away. You can tack on the
`--include-untracked` flag to make sure that untracked files are also
included in the stash.

You can take this a step further with the `--all` flag. This will stash
everything included files that you've told git to ignore.

You probably don't want to do this. I ran this command and realized after
the command hung for about 10 seconds that I had just stashed the
`node_modules` directory.

See `man git-stash` for more details.
