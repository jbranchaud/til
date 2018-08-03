# Is This A Directory Or A File?

When compiling [ReasonML](https://reasonml.github.io/) natively, we have access to a variety of
additional modules including the `Unix` module. We can interact with
directories and files using functions on `Unix`.

```reason
let current_dir = Unix.opendir(Unix.getcwd());
let first_file = Unix.readdir(current_dir);
/* is first_file a directory or a file? */
Unix.closedir(current_dir);
```

Here we open the current working directory, grab the first thing out of that
directory -- maybe it's a file, maybe it's a directory, maybe it is
something else. Lastly, we close the directory.

```reason
let current_dir = Unix.opendir(Unix.getcwd());
let first_file = Unix.readdir(current_dir);

switch(Unix.stat(first_file)) {
| Unix.stats({ st_kind: Unix.S_REG }) => print_endline("Regular File")
| Unix.stats({ st_kind: Unix.S_DIR }) => print_endline("Directory")
| Unix.stats({ st_kind: Unix.S_LINK }) => print_endline("Link")
| Unix.stats({ st_kind: Unix.S_SOCK }) => print_endline("Socket")
| _ => print_endline("Something else")
};

Unix.closedir(current_dir);
```

There are a variety of kinds of files to switch on. Here, we are switching
on _Regular Files_, _Directories_, _Links_, and _Sockets_. Everything else
falls through.

See the [`Unix` module docs](https://reasonml.github.io/api/Unix.html) for
more details.
