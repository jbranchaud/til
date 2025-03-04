# List The Files Being Loaded By Mise

While running `mise` for the first time, after adding a `mise.toml` file to a
project, I noticed something strange. Instead of invoking the command I had
specified (`mise run dev`), several parellel tool downloads were kicked off. In
addition to Ruby, it was installing an older version of Postgres, and lua. What
gives?

By running `mise cfg`, I can list all the files being loaded by `mise` and get
to the bottom of this.

```bash
mise cfg

Path                         Tools
~/.tool-versions             node, ruby, postgres, lua
~/code/still/.ruby-version   ruby
~/code/still/Gemfile         (none)
~/code/still/.tool-versions  ruby
~/code/still/mise.toml       (none)
```

I was only thinking about the files local to my project and I forgot that I
have a system-wide `.tool-versions` file. As we can see from the output, that
file specifies `postgres` and `lua` as well. Mise wanted to ensure that it had
downloaded the specified versions of each of those tools before running my
task.

[source](https://mise.jdx.dev/configuration.html)
