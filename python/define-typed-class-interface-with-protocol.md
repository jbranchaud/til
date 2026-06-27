# Define Typed Class Interface With Protocol

In [`py-vmt`](https://github.com/jbranchaud/py-vmt) I am defining different
storage access layers for the CLI to use. I want a consistent interface that the
core CLI logic can depend on regardless of whether it is a JSON file or a SQLite
database. To achieve that I can define a class of unimplemented functions that
inherits from
[`typing.Protocol`](https://typing.python.org/en/latest/spec/protocol.html).

```python
from typing import Protocol

class SessionRepository(Protocol):
    def active_session(self) -> Session | None: ...
    def write_active_session(self, session) -> None: ...
    def append_session(self, session) -> None: ...
    def all_sessions(self) -> list[Session]: ...
    def clear_active_session(self) -> None: ...
```

Notice that none of these have default implementations. The `...` indicates that
class implementing this protocol will define the implementation of those
functions.

Now, my `CliContext` class, which needs some kind of `SessionRepository` to
function can indicate as much in `__init__`.

```python
class CliContext:
    def __init__(self, verbose: bool, repo: SessionRepository | None = None) -> None:
        self.verbose: bool = verbose
        self.active_session: Session | None = None
        self.repo: SessionRepository = repo or JsonRepository()
        self.active_session = self.repo.active_session()
```

If `JsonRepository` doesn't define all of the methods specified in the protocol,
then a type error will occur wherever it clashes with `SessionRepository`. Now
as I implement `SqliteRepository` I have a standard interface to build against
that I know I can seamlessly swap in.

[source](https://typing.python.org/en/latest/reference/protocols.html#simple-user-defined-protocols)
