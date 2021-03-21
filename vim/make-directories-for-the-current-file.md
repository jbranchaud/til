# Make Directories For The Current File

The [`vim-eunuch` plugin](https://github.com/tpope/vim-eunuch) provides Vim
commands that correspond to many common Unix shell commands. One such command
is an equivalent to the `mkdir` command.

The `mkdir` command creates the given directory if it doesn't already exist. If
multiples levels of new directories are specified, the `-p` flag can be
included to create each successive level.

The `vim-eunuch` equivalents are `Mkdir` and `Mkdir!`.

Let's say I'm working within a project that doesn't currently have a `docs`
directory. When I open up a buffer to `docs/setup.md`, before I can write that
new file, I need to create the `docs` directory. Running `:Mkdir` will do that.

Now let's say I open up a buffer to `src/api/util/base.js`. The `src` directory
already exists, but neither `/api` nor `util/` nested under it exist. Before I
can write the buffer, I need to create both of those directories. `:Mkdir` on
its own won't create these nested directories. Instead I need to reach for the
`-p` equivalent which is `:Mkdir!`.

See `:h eunuch-:Mkdir` for more details.
