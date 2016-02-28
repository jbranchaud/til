# Show All Commits For A File Beyond Renaming

By including `-- <filename>` with a `git log` command, we can list all the
commits for a file. The following is an example of such a command with some
formatting and file names.

```bash
> git log --name-only --pretty=format:%H -- README.md
4e57c5d46637286731dc7fbb1e16330f1f3b2b7c
README.md

56955ff027f02b57212476e142a97ce2b7e60efe
README.md

5abdc5106529dd246450b381f621fa1b05808830
README.md
```

What we may not realize, though, is that we are missing out on a commit in
this file's history. At one point, this file was renamed. The command above
wasn't able to capture that.

Using the `--follow` flag with a file name, we can list all commits for a
file beyond renaming.

```bash
> git log --name-only --pretty=format:%H --follow README.md
4e57c5d46637286731dc7fbb1e16330f1f3b2b7c
README.md

56955ff027f02b57212476e142a97ce2b7e60efe
README.md

5abdc5106529dd246450b381f621fa1b05808830
README.md

ea885f458b0d525f673623f2440de9556954c0c9
README.rdoc
```

This command roped in a commit from when `README.md` used to be called
`README.rdoc`. If you want to know about the *full* history of a file, this
is the way to go.

[source](http://stackoverflow.com/questions/3701404/list-all-commits-for-a-specific-file)
