# Determine The Latest Release Of A Hex Package

I will often pop open the browser and do a Google search in order to figure
out the latest release of a package when adding it to my dependencies.
However, lately I've been getting in the habit of using a quicker approach.
The `mix` CLI has a way of looking up info about a package and we don't have
to leave the terminal to use it.

For instance, if I need to determine the latest version of the `postgrex`
package, I can run the following command.

```bash
$ mix hex.info postgrex
PostgreSQL driver for Elixir.

Config: {:postgrex, "~> 0.12.0"}
Releases: 0.12.0, 0.11.2, 0.11.1, 0.11.0, 0.10.0, 0.9.1, 0.9.0, 0.8.4, 0.8.3, 0.8.2, ...

Maintainers: Eric Meadows-Jönsson, James Fish
Licenses: Apache 2.0
Links:
  Github: https://github.com/elixir-ecto/postgrex
```

The third line gives me the info I need (`{:postgrex, "~> 0.12.0"}`) and it
is already formatted as a tuple that I can paste right into my `mix.exs`
file.
