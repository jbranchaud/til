# Turn Method Into Cached Property On Class Instance

I have a class that encapsulates a few things including a somewhat expensive
data lookup from a file on disk. When this class is instantiated, it is
short-lived and the data that gets pulled from the file on disk is considered
fresh for the life of the instance.

```python
class CliContext:
    def __init__(self, verbose: bool) -> None:
        # ...
        self.repo = JsonRepository()
        # ...

    def session_log(self) -> list[Session]:
        return self.repo.load_session_log()
```

Because this method gets called from a couple places during a single lifecycle,
this class would benefit from caching it via the [`@cached_property`
decorator](https://docs.python.org/3/library/functools.html#functools.cached_property).

```python
from functools import cached_property

class CliContext:
    def __init__(self, verbose: bool) -> None:
        # ...
        self.repo = JsonRepository()
        # ...

    @cached_property
    def session_log(self) -> list[Session]:
        return self.repo.load_session_log()
```

Now `session_log` can be treated like a property instead of a method. That means
when I want to load and access the session log, I can do `self.session_log` (no
parentheses) like I would any other property. The first time I reference it, the
method will run. Then that value will be cached and all subsequent references
will use that cache.

> Transform a method of a class into a property whose value is computed once and
> then cached as a normal attribute for the life of the instance.

Of course, anytime we use caching, we can create a footgun for ourselves. We
have to be careful that our program doesn't evolve in such a way where the
caching will create a subtle bug due to stale data.
