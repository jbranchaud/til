# BasedPyright Will Use Pyright Config

I was transitioning my [`py-vmt` project](https://github.com/jbranchaud/py-vmt)
from `pyright` to `basedpyright` for Python type checking. That's because Zed
uses `basedpyright` by default and `pyright` doesn't work in Cursor, whereas
`basedpyright` does. I wanted to unify around one set of type check tooling.

I swapped out `pyright` for `basedpyright` in my dev dependencies, updated what
was being called in my `Taskfile.yml`, and GitHub workflow action.

What I didn't have to change, though, was the `tool.pyright` config heading in
my `pyproject.toml`. For aesthetics I could have changed it to
`tool.basedpyright`. However, `basedpyright` knows to look for either config, so
I can leave that one as is.

```toml
[tool.pyright]
include = ["src", "tests"]
typeCheckingMode = "basic"
```

If I introduce a `pyrightconfig.json` file to the project, which is also
supported by `basedpyright`, it will take precedence over the settings in
`pyproject.toml`.

[source](https://docs.basedpyright.com/v1.24.0/configuration/config-files/)
