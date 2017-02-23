# Viewing A File On Another Branch

Sometimes you want to view a file on another branch (without switching
branches). That is, you want to view the version of that file as it exists
on that branch. `git show` can help. If your branch is named `my_feature` and
the file you want to see is `app/models/users.rb`, then your command should
look like this:

```
$ git show my_feature:app/models/users.rb
```

You can even tab-complete the filename as you type it out.

See `man git-show` for more details.

[source](http://stackoverflow.com/questions/7856416/view-a-file-in-a-different-git-branch-without-changing-branches)
