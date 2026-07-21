# Select Implementation With Class Registry

I am working on [supporting multiple storage formats (JSON and
SQLite)](https://github.com/jbranchaud/py-vmt/pull/1) for my [`py-vmt`
project](https://github.com/jbranchaud/py-vmt). While SQLite will be the default
storage format, the CLI can be configured via a `config.json` file to use
another supported `storage_format` (e.g. JSON).

When the `CliContext` is initialized, I need to determine which will be used so
that I can use the correct _repository_ implementation for reads, writes, etc. I
decided to use a simplified _Class Registry Pattern_ to build the correct
implementation without a messy chain of conditionals.

```python
class CliContext:
    def __init__(self) -> None:
        self.config = self.read_config()
        self.repo = self._initialize_configured_repo()
        # ...

    # ...

    _REPOS: dict[str, type[SessionRepository]] = {
        "json": JsonRepository,
        "sqlite": SqliteRepository,
    }

    def _initialize_configured_repo(self) -> SessionRepository:
        default_format = "sqlite"
        format = self.config.get("storage_format", default_format)
        try:
            return self._REPOS[format]()
        except KeyError:
            raise ValueError(f"Unknown storage_format: {format!r}")
```

I define a `dict` called `_REPOS` that registers each of the repository
implementations that I support. Notice each value is a `SessionRepository`
class. Then the `_initialize_configured_repo` function (which is called in
`__init__`) initializes the correct repository implementation. It first tries to
grab the `storage_format` from the config, then pulls that out of `_REPOS`, and
then tags on `()` to initialize it. If I have a bad config, a `KeyError` will
be raised which I will re-raise as a `ValueError`.

Some class registries support decorators or have a whole mechanism registering
and unregistering classes. I don't need anything quite that sophisticated, so I
stuck to a hard-coded dict. If I add support for more storage formats, I can add
their repository classes to the registry.
