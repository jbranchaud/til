# Root Directory Of A Project

Do you need the root directory of an elixir project? The
[`File.cwd!/0`](http://elixir-lang.org/docs/stable/elixir/File.html#cwd!/0)
function can help.

```elixir
iex> File.cwd!
"/home/dev/code/my_app"
```

Keep in mind though, this will only work reliably with projects that are
compiled using Mix.

[source](https://groups.google.com/forum/#!msg/elixir-lang-talk/Ls0eJDdMMW8/1Lmg5K2MAQAJ)
