# Open Vim To A Tag Definition

If you are using [ctags with Vim](https://andrew.stwrt.ca/posts/vim-ctags/),
you can provide a tag name when opening Vim. This signals to Vim that it
should open to the file and location of the tag's definition. For instance,
if you have a Rails project going and you provide Vim with the
`UsersController` tag name, it will open the
`app/controllers/users_controller.rb`. Just use the `-t` flag like so:

```bash
$ vim -t UsersController
```

See `man vim` for more details.
