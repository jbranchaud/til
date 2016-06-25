# List Functions For A Module

During an `iex` session, I can do a little introspection on modules using
either the
[`__info__/1`](http://elixir-lang.org/docs/stable/elixir/Module.html#__info__/1)
function or Erlang's
[`module_info/0`](http://erlang.org/doc/man/erlang.html#module_info-0)
function. In particular, I can pass `:functions` to either one to get a list
of the functions for that module.

This is what `__info__/1` looks like for the functions of the `List`
module:

```elixir
> List.__info__(:functions)
[delete: 2, delete_at: 2, duplicate: 2, first: 1,
 flatten: 1, flatten: 2, foldl: 3, foldr: 3, insert_at: 3,
 keydelete: 3, keyfind: 3, keyfind: 4, keymember?: 3,
 keyreplace: 4, keysort: 2, keystore: 4, keytake: 3,
 last: 1, replace_at: 3, to_atom: 1, to_existing_atom: 1,
 to_float: 1, to_integer: 1, to_integer: 2, to_string: 1,
 to_tuple: 1, update_at: 3, wrap: 1, zip: 1]
```

[source](http://stackoverflow.com/questions/28664119/in-elixir-is-there-any-way-to-get-a-module-to-list-its-functions)
