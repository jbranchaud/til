# Grep For A Pattern On Another Branch

Git has a built-in `grep` command that works essentially the same as the
standard `grep` command that unix users are used to. The benefit of
`git-grep` is that it is tightly integrated with Git.
You can search for occurrences of a pattern on another branch. For example,
if you have a feature branch, `my-feature`,  on which you'd like to search
for occurrences of `user.last_name`, then your command would look like this:

```bash
$ git grep 'user\.last_name' my-feature
```

If there are matching results, they follow this format:

```
my-feature:app/views/users/show.html.erb:  <%= user.last_name %>
...
```

This formatting is handy because you can easily copy the branch and file
directive for use with [`git-show`](viewing-a-file-on-another-branch.md).

See `man git-grep` for more details.
