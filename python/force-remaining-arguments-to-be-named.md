# Force Remaining Arguments To Be Named

When the _positional argument collector_ (`*`) is used in a function definition,
all the arguments that follow it must now be explicitly named when invoking that
function. This is regardless of whether you are collecting positional arguments
into a named tuple (e.g. `*rest`) or are using the empty/dummy version (`*`).

A friend recently recommended I use this syntax to force some configuration
values (often booleans) to be explicitly named at call sites.

Here is an example of this in my [`py-vmt` project](https://github.com/jbranchaud/py-vmt):

```python
class CliContext:
    def __init__(self, *, verbose: bool, repo: SessionRepository | None = None) -> None:
        self.verbose: bool = verbose
        self.active_session: Session | None = None
        self.repo: SessionRepository = repo or JsonRepository()
        self.active_session = self.repo.active_session()
```

Notice that right after `self` is the `*` which means that both `verbose` and
`repo` must be named arguments.

Here is a corresponding call site:

```python
    ctx.obj = CliContext(verbose=True)
```

Now when I initialize `CliContext`, there is no choice for me to pass in an
unnamed argument of `True`. It has to be paired with `verbose`. Above I've
excluded `repo` because that falls back to a default value. If I were to include
it, it would have to be named.

The same applies to this scenario where I'm collecting the positional arguments.

```python
def build_identifier(first, *rest, delimiter="/"):
    if rest is None:
        return first

    return delimiter.join([first, *rest])
```

```python
>>> print(build_identifier("taco"))
taco
>>> print(build_identifier("taco", "bell", "mas", delimiter="-"))
taco-bell-mas
>>> print(build_identifier("taco", "bell", "mas", "-"))
taco/bell/mas/-
```

Notice in the third example where I don't use a named argument for the
delimiter. It instead gets swept up in the collection of positional arguments.

This language of _positional argument collector_ I got from [Python in a
Nutshell, 4th
Edition](https://www.oreilly.com/library/view/python-in-a/9781098113544/) (see
pg. 96).
