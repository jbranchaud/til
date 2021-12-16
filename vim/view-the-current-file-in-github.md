# View The Current File In GitHub

Sometimes when I'm browsing some code in Vim, I'll want to open up the a file
in GitHub. This is usually so that I can grab a URL to share as a point of
reference in a conversation.

To do this, I run [`vim-fugitive`](https://github.com/tpope/vim-fugitive)'s
`:Gbrowse` which will open up the current file for the current commit on the
current branch.

This works great if your current branch is the `main` branch. Or if your
current branch has previously been pushed up as a remote. It doesn't work so
well if you are on a local-only feature branch. You'll get the classic Star
Wars themed GitHub 404 page.

There is a handy workaround. You can specify the branch and file you want when
you run the command.

```
:Gbrowse main:app/models/user.rb
```

That will open the specified file (`app/models/user.rb`) as it exists on the
specified branch (`main`).

A shorthand of that for the current file looks like this:

```
:Gbrowse main:%
```
