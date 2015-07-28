# Excluding Files Locally

Excluding (read: ignoring) files that should not be tracked is generally
done by listing such files in a tracked `.gitignore` file. Though it doesn't
make sense to list all kinds of excluded files here. For files that you'd
like to exclude that are temporary or are specific to your local
environment, there is another option. These files can be added to the
`.git/info/exclude` file as a way of ignoring them locally.

Add specific files or patterns as needed to that file and then save it.
Relevant files will no longer show up as untracked files when you `git
status`.

h/t [Dillon Hafer](https://twitter.com/DillonHafer)
