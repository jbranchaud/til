# Change To That New Directory

The `$_` variable provided by bash is always set to the last argument of the
previous command. One handy use of this is for changing directories into a
newly created directory.

```bash
$ mkdir new_dir && cd $_
```

This command will leave you in your newly created directory, `new_dir`.

We can imagine using this bash variable in a number of similar scenarios as
well. What if we are using some language specific command that creates a
directory? Will it work when creating a new Phoenix or Rails project?

It sure will.

Give it a try with Phoenix:

```bash
mix phx.new my_app && cd $_
```

or with Rails:

```bash
rails new app && cd $_
```

[source](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html)
